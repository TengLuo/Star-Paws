package jhu.petstore.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jhu.petstore.entity.request.LoginRequestBody;
import jhu.petstore.entity.response.LoginResponseBody;
import jhu.petstore.service.LoginService;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@Controller
public class LoginController {

    @Autowired
    private WebController webController;
    @Autowired
    private LoginService loginService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public void login(@RequestBody LoginRequestBody requestBody, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String firstname = loginService.verifyLogin(requestBody.getUserId(), requestBody.getPassword());

        // Create a new session for the user to verify username and password return Unauthorized error if username/password is unexpected.
        if (!firstname.isEmpty()) {
            // Create a new session, put user ID as an attribute into the session object, and set the expiration time to 60 mins.
            HttpSession session = request.getSession();
            session.setAttribute("user_id", requestBody.getUserId());
            session.setMaxInactiveInterval(60 * 60);
        } else {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        }
    }
}
