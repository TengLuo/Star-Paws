package jhu.petstore.controller;

import jakarta.annotation.Resource;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jhu.petstore.service.TestService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@Controller
public class WebController {
    @Resource
    private TestService testService;

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
        mv.addObject("msg", "Star Paws ");
        // nav to show.jsp .
        mv.setViewName("demo");
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
