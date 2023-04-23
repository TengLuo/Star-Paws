package jhu.petstore.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jhu.petstore.entity.db.User;
import jhu.petstore.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import java.io.IOException;

@Controller
public class RegisterController {

    @Autowired WebController webController;
    @Autowired
    private RegisterService registerService;

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@RequestBody User user, HttpServletRequest request, HttpServletResponse response) throws IOException {
//        System.out.println("SignIn page has been visited....");
//        HttpSession session = request.getSession();
//        webController.home(request, response, session);

        return "redirect:home";

//        HttpSession session = request.getSession();
//        session.setAttribute("user", user);
//        System.out.println("user: "+user.getFirstName());
//        return;


//        webController.home(request, response, session);
//        if (!registerService.register(user)) {
//            response.setStatus(HttpServletResponse.SC_CONFLICT);
//            mv.setViewName("register");
//        } else {
//            response.setStatus(HttpServletResponse.SC_OK);
//            mv.setViewName("signIn");
//        }
//        return mv;
    }
}
