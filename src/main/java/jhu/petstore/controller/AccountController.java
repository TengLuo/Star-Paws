package jhu.petstore.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jhu.petstore.entity.db.Order;
import jhu.petstore.entity.db.Product;
import jhu.petstore.service.ProfileService;
import jhu.petstore.service.OrderService;
import jhu.petstore.service.ProductService;
import jhu.petstore.util.OrderItem;
import jhu.petstore.util.UserOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

@Controller
public class AccountController {

    @Autowired
    private ProfileService profileService;

    @Autowired
    private  OrderService orderService;

    @Autowired
    private  ProductService productService;

    @RequestMapping(value = "/account", method = RequestMethod.GET)
    public ModelAndView account(HttpServletRequest request,
                                HttpServletResponse response,
                                HttpSession session) throws IOException {
        String user= (String) session.getAttribute("user_id");
        if (user != null) {
            List<String> userOrders = this.orderService.getOrdersByUsers(user);
            List<UserOrder> ordersByOrderNumber = new LinkedList<>();
            for(String orderNum : userOrders) {
                List<Order> orderByNumber = this.orderService.getOrdersByOrderNumber(orderNum);
                List<OrderItem> items = new LinkedList<>();
                UserOrder updatedOrder = null;
                for (Order row : orderByNumber) {
                    Product product = this.productService.getProductById(row.getProductId());
                    OrderItem item = new OrderItem(row.getProductId(), row.getProductQuant(), product.getName(), product.getPrice());
                    items.add(item);
                    updatedOrder = new UserOrder(row.getOrderNumber(), row.getOrderDate(), user, row.getAddress(), row.getFirstName(), row.getLastName(), items);
                }
                ordersByOrderNumber.add(updatedOrder);
            }
            session.setAttribute("user_profile", this.profileService.getUserById(user) );
            session.setAttribute("order_history", ordersByOrderNumber );
        }
        ModelAndView mv = new ModelAndView();
        mv.setViewName("account");
        return mv;
    }

}
