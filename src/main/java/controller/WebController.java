package controller;

import bean.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
    //@RequestMapping("/demo.action")
    @RequestMapping(value = {"/demo.action", "/test.action"}, method = RequestMethod.GET)
    public ModelAndView demo(HttpServletRequest request,
                             HttpServletResponse response,
                             HttpSession session) {
        System.out.println("Server has been visited....");
        ModelAndView mv = new ModelAndView();
        mv.addObject("msg", "Star Paws ");
        // nav to show.jsp
        mv.setViewName("demo");
        return mv;
    }

    // @RequestParam( "username")
    @RequestMapping(value = "/receiveProperty.action", method = RequestMethod.POST)
    public ModelAndView formSubmit(@RequestParam( "username") String name, String email) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("name", name);
        mv.addObject("email", email);
        mv.setViewName("show");
        return mv;
    }

    // Save to POJO
    @RequestMapping(value = "/receiveParam.action", method = RequestMethod.POST)
    public ModelAndView formUserSave(User myUser) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("name", myUser.getName());
        mv.addObject("email", myUser.getEmail());
        mv.setViewName("show");
        return mv;
    }

    // nav to Show.jsp
    @RequestMapping(value = "/doReturnView.action")
    public String doReturnView(){
        return "show";
    }

    @RequestMapping(value = "/return-ajax.action")
    public void doReturnAjax(HttpServletResponse response, String name, String email) throws IOException {
        User user = new User();
        user.setEmail(email);
        user.setName(name);
        String json = "";
        if(user != null){
            ObjectMapper om = new ObjectMapper();
            json = om.writeValueAsString(user);
            System.out.println(json);
        }
        response.setContentType("application/json;charset=utf-8");
        PrintWriter pw = response.getWriter();
        pw.println(json);
        pw.flush();
        pw.close();
    }

    @RequestMapping(value = "/saveUser.action")
    @ResponseBody
    public User doUserJsonObject(String name, String email){
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        return user;
    }

    @RequestMapping(value = "/getUsers.action")
    @ResponseBody
    public List<User> getUsers(String name, String email){
        List<User> users = new ArrayList<>();
        User user = new User();
        user.setName(name);
        user.setName(email);
        users.add(user);
        User user2 = new User();
        user2.setName("Mike");
        user2.setEmail("Mike@jh.edu");
        users.add(user2);
        return users;
    }
}
