package jhu.petstore.controller;

import jhu.petstore.entity.User;
import jhu.petstore.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(value="/getUserDB",method = RequestMethod.GET)
    @ResponseBody
    public List<User> getUser(){
        System.out.println("Test");
        List<User> users = userService.getAllUser();
        return users;
    }
}
