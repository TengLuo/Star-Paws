package jhu.petstore.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jhu.petstore.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

@Controller
public class AccountController {

    @Autowired
    private ProfileService profileService;

    @RequestMapping(value = "/account", method = RequestMethod.GET)
    public ModelAndView account(HttpServletRequest request,
                                HttpServletResponse response,
                                HttpSession session) {
        String user= (String) session.getAttribute("user_id");
        if (user != null) {
            session.setAttribute("user_profile", this.profileService.getUserById(user) );
        }
        ModelAndView mv = new ModelAndView();
        mv.setViewName("account");
        return mv;
    }

}
