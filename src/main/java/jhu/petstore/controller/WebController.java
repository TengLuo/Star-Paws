package jhu.petstore.controller;

import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jhu.petstore.entity.db.Product;
import jhu.petstore.service.ProductService;
import jhu.petstore.service.ProfileService;
import jhu.petstore.service.TestService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;

@Controller
public class WebController {
    @Resource
    private TestService testService;

    @Autowired
    private ProductService productService;
    @RequestMapping(value = "/home", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView home(HttpServletRequest request,
                             HttpServletResponse response,
                             HttpSession session) {
        System.out.println("Nav to Home page");
        System.out.println("user: " + session.getAttribute("user_id"));
        ModelAndView mv = new ModelAndView();
        mv.addObject("msg", "Star Paws ");
        mv.setViewName("home");
        return mv;
    }

    @RequestMapping("/faq")
    public ModelAndView faq(HttpServletRequest request,
                             HttpServletResponse response,
                             HttpSession session) {
        System.out.println("Home page has been visited....");
        ModelAndView mv = new ModelAndView();
        mv.setViewName("faq");
        return mv;
    }

    @RequestMapping("/aboutUs")
    public ModelAndView aboutUs(HttpServletRequest request,
                             HttpServletResponse response,
                             HttpSession session) {
        System.out.println("About Us page has been visited....");
        ModelAndView mv = new ModelAndView();
        mv.addObject("msg", "Star Paws ");
        mv.setViewName("aboutUs");
        return mv;
    }

    @RequestMapping("/contactUs")
    public ModelAndView contactUs(HttpServletRequest request,
                             HttpServletResponse response,
                             HttpSession session) {
        System.out.println("contactUs page has been visited....");
        ModelAndView mv = new ModelAndView();
        mv.addObject("msg", "Star Paws ");
        mv.setViewName("contactUs");
        return mv;
    }

    @RequestMapping("/shop")
    public ModelAndView shop(HttpServletRequest request,
                                  HttpServletResponse response,
                                  HttpSession session) {
        System.out.println("Shop page has been visited....");
        ModelAndView mv = new ModelAndView();
        mv.setViewName("shop");
        List<Product> products= this.productService.getAll();
        session.setAttribute("products", products);
        return mv;
    }

    @RequestMapping("/cart")
    public ModelAndView cart(HttpServletRequest request,
                             HttpServletResponse response,
                             HttpSession session) {
        System.out.println("Cart page has been visited....");
        List<Product> cart= (List<Product>)session.getAttribute("cart");
        System.out.println(cart);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("cart");
        return mv;
    }

    @RequestMapping(value = "/cart/addItem", method = RequestMethod.POST)
    public String addItem(@RequestParam("itemId") int itemId,
                          @RequestParam("quantity") int quantity,
                          HttpSession session) {
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        Product product = this.productService.getProductById(itemId);
        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        // Check if the product is already in the cart
        boolean productExists = false;
        for (Product cartItem : cart) {
            if (cartItem.getId() == itemId) {
                // If the product is found in the cart, update the quantity
                cartItem.setQuantity(cartItem.getQuantity() + quantity);
                productExists = true;
                break;
            }
        }

        // If the product is not in the cart, add it with the specified quantity
        if (!productExists) {
            product.setQuantity(quantity);
            cart.add(product);
        }
        return "redirect:/shop";
    }

    @RequestMapping(value = "/cart/deleteItem", method = RequestMethod.POST)
    public String deleteItem(@RequestParam("itemId") int itemId,
                             HttpSession session) {
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        if (cart != null) {
            for (Product product : cart) {
                if (product.getId() == itemId) {
                    int currentQuantity = product.getQuantity();
                    if (currentQuantity > 1) {
                        product.setQuantity(currentQuantity - 1);
                    } else {
                        cart.remove(product);
                    }
                    break;
                }
            }
            session.setAttribute("cart", cart);
        }
        return "redirect:/cart";
    }

    @RequestMapping(value = "/cart/proceed", method = RequestMethod.POST)
    public String viewCart() {
        return "redirect:/cart";
    }


    @RequestMapping(value = "/cart/clear", method = RequestMethod.POST)
    public String clearCart(HttpSession session) {
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        if (cart != null) {
            cart.clear();
            session.setAttribute("cart", cart);
        }
        session.setAttribute("cartCleared", true);
        return "redirect:/shop";
    }

    @RequestMapping("/testService")
    public String testService(){
        return testService.test();
    }


    //@RequestMapping("/demo.action")
    @RequestMapping(value = {"/demo", "/test"}, method = RequestMethod.GET)
    public ModelAndView demo(HttpServletRequest request,
                             HttpServletResponse response,
                             HttpSession session) {
        System.out.println("Server has been visited....");
        ModelAndView mv = new ModelAndView();
        mv.addObject("msg", "Star Paws --- Test Message ");
        // nav to show.jsp .
        mv.setViewName("home");
        return mv;
    }

    // @RequestParam( "username")
    @RequestMapping(value = "/receiveProperty", method = RequestMethod.POST)
    public ModelAndView formSubmit(@RequestParam( "username") String name, String email) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("name", name);
        mv.addObject("email", email);
        mv.setViewName("show");
        return mv;
    }

    @RequestMapping("/checkout")
    public ModelAndView checkout(HttpServletRequest request,
                            HttpServletResponse response,
                            HttpSession session) {
        System.out.println("Checkout page has been visited....");
        ModelAndView mv = new ModelAndView();
        mv.setViewName("checkout");
        return mv;
    }

    @RequestMapping("/confirmation")
    public ModelAndView confirmation(HttpServletRequest request,
                                 HttpServletResponse response,
                                 HttpSession session) {
        System.out.println("Confirmation page has been visited....");
        session.removeAttribute("cart");
        ModelAndView mv = new ModelAndView();
        mv.setViewName("confirmation");
        return mv;
    }

    // Save to POJO
//    @RequestMapping(value = "/receiveParam", method = RequestMethod.POST)
//    public ModelAndView formUserSave(UserData myUser) {
//        ModelAndView mv = new ModelAndView();
//        mv.addObject("name", myUser.getName());
//        mv.addObject("email", myUser.getEmail());
//        mv.setViewName("show");
//        return mv;
//    }

    // nav to Show.jsp
//    @RequestMapping(value = "/doReturnView")
//    public String doReturnView(){
//        return "show";
//    }
//
//    @RequestMapping(value = "/return-ajax")
//    public void doReturnAjax(HttpServletResponse response, String name, String email) throws IOException {
//        UserData user = new UserData();
//        user.setEmail(email);
//        user.setName(name);
//        String json = "";
//        if(user != null){
//            ObjectMapper om = new ObjectMapper();
//            json = om.writeValueAsString(user);
//            System.out.println(json);
//        }
//        response.setContentType("application/json;charset=utf-8");
//        PrintWriter pw = response.getWriter();
//        pw.println(json);
//        pw.flush();
//        pw.close();
//    }
//
//    @RequestMapping(value = "/saveUser")
//    @ResponseBody
//    public UserData doUserJsonObject(String name, String email){
//        UserData user = new UserData();
//        user.setName(name);
//        user.setEmail(email);
//        return user;
//    }
//
//    @RequestMapping(value = "/getUsers")
//    @ResponseBody
//    public List<UserData> getUsers(String name, String email){
//        List<UserData> users = new ArrayList<>();
//        UserData user = new UserData();
//        user.setName(name);
//        user.setName(email);
//        users.add(user);
//        UserData user2 = new UserData();
//        user2.setName("Mike");
//        user2.setEmail("Mike@jh.edu");
//        users.add(user2);
//        return users;
//    }
}
