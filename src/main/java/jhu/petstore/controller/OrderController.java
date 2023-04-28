package jhu.petstore.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jhu.petstore.entity.request.LoginRequestBody;
import jhu.petstore.service.OrderService;
import jhu.petstore.entity.db.Product;
import jhu.petstore.entity.request.OrderRequestBody;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import jhu.petstore.entity.db.Order;

import java.io.IOException;
import java.util.Date;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/order", method = RequestMethod.POST)
    public void order(@RequestBody OrderRequestBody requestBody, HttpSession session, HttpServletResponse response) throws IOException {
        for(Product product : requestBody.getProducts()) {
            float orderNum = new Date().getTime();
            String user= (String) session.getAttribute("user_id");

            Order order = new Order(
                    orderNum,
                    requestBody.getOrderDate(),
                    user,
                    product.getProductId(),
                    1,
                    requestBody.getAddress());
            if (!orderService.placeOrder(order)) {
                response.setStatus(HttpServletResponse.SC_CONFLICT);
            }
        }
        response.setStatus(HttpServletResponse.SC_OK);
    }

}