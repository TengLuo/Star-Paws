package jhu.petstore.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jhu.petstore.service.OrderService;
import jhu.petstore.entity.db.Product;
import jhu.petstore.entity.request.OrderRequestBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import jhu.petstore.entity.response.OrderResponseBody;
import jhu.petstore.entity.db.Order;
import jhu.petstore.util.Util;
import javax.mail.MessagingException;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import static jhu.petstore.util.Util.createOrderNum;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/order", method = RequestMethod.POST)
    public void order(@RequestBody OrderRequestBody requestBody, HttpSession session, HttpServletResponse response) throws IOException {
        float orderNum = new Date().getTime();
        String user= (String) session.getAttribute("user_id");
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        for(Product product : cart) {
            Order order = new Order(
                    orderNum,
                    requestBody.getOrderDate(),
                    user,
                    product.getId(),
                    product.getQuantity(),
                    requestBody.getAddress(),
                    requestBody.getFirstName(),
                    requestBody.getLastName());
            if (!orderService.placeOrder(order)) {
                response.setStatus(HttpServletResponse.SC_CONFLICT);
            }
        }
        response.setStatus(HttpServletResponse.SC_OK);
        session.setAttribute("confirmation_num", orderNum);
        session.setAttribute("order_info", cart);
        session.removeAttribute("cart");
        try {
            //MailUtilLocal.sendMail(to, from, subject, body, isBodyHTML);
            Util.sendEmail(requestBody.getEmail(), orderNum, false);
        } catch (MessagingException e) {
            String errorMessage
                    = "ERROR: Unable to send email. "
                    + "Check Tomcat logs for details.<br>"
                    + "NOTE: You may need to configure your system "
                    + "as described in chapter 14.<br>"
                    + "ERROR MESSAGE: " + e.getMessage();
            System.out.println(errorMessage);
        }
        //return userid and orderNumber as response
        OrderResponseBody loginResponseBody = new OrderResponseBody(user, orderNum);
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().print(new ObjectMapper().writeValueAsString(loginResponseBody));
    }

}