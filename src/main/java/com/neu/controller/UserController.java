package com.neu.controller;

import com.captcha.botdetect.web.servlet.Captcha;
import com.neu.dao.UserDAO;
import com.neu.pojo.Users;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Random;

@Controller
public class UserController {
    @RequestMapping(value = "/user/login.htm", method = RequestMethod.GET)
    public String showLoginForm() {
        return "login";
    }
    @RequestMapping(value = "/user/login.htm", method = RequestMethod.POST)
    public String handleLoginForm(HttpSession session,HttpServletRequest request, UserDAO userDao, ModelMap map) {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try {
            Users u = userDao.get(username, password);

            if (u != null && u.getLevel() == 1 && u.getStatus() ==1) {
                session.setAttribute("user",u.getUsername());
                return "redirect:/";
            } else if (u != null && u.getLevel() == 0 && u.getStatus() == 1) {
                return "admin-dashboard";
            } else {
                map.addAttribute("errorMessage", "Invalid username/password!");
                return "error";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    @RequestMapping(value = "/user/create.htm", method = RequestMethod.GET)
    public String showRegister() {
        return "register";
    }
    @RequestMapping(value = "/user/create.htm", method = RequestMethod.POST)
    public String handleCreateForm(HttpServletRequest request, UserDAO userDao, ModelMap map) {
        Captcha captcha = Captcha.load(request, "CaptchaObject");
        String captchaCode = request.getParameter("captchaCode");
        HttpSession session = request.getSession();
        if (captcha.validate(captchaCode)) {
            String username = request.getParameter("username");
            if (userDao.get(username)!=null){
                map.addAttribute("errorMessage", "User Name Exists!");
                return "register";
            }
            String useremail =request.getParameter("useremail");
            String password = request.getParameter("password");
            Users user = new Users();
            user.setUsername(username);
            user.setPassword(password);
            user.setEmail(useremail);
            user.setLevel(1);
            user.setStatus(0);

            try {
                Users u = userDao.register(user);
                Random rand = new Random();
                int randomNum1 = rand.nextInt(5000000);
                int randomNum2 = rand.nextInt(5000000);
                try {
                    String str = "http://localhost:8080/xiaohan/user/validateemail.htm?username=" + username + "&key1="
                            + randomNum1 + "&key2=" + randomNum2;
                    session.setAttribute("key1", randomNum1);
                    session.setAttribute("key2", randomNum2);
                    System.out.println(useremail);
                    sendEmail(useremail,
                            "Click on this link to activate your account : "+ str);
                } catch (Exception e) {
                    System.out.println("Email cannot be sent");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            map.addAttribute("errorMessage", "Invalid Captcha!");
            return "register";
        }

        return "user-created";
    }
    public void sendEmail(String useremail, String message) {
        try {
            Email email = new SimpleEmail();
            email.setHostName("smtp.googlemail.com");
            email.setSmtpPort(465);
            email.setAuthenticator(new DefaultAuthenticator("contactapplication2018@gmail.com", "springmvc"));
            email.setSSLOnConnect(true);
            email.setFrom("no-reply@msis.neu.edu"); // This user email does not
            // exist
            email.setSubject("Password Reminder");
            email.setMsg(message); // Retrieve email from the DAO and send this
            email.addTo(useremail);
            email.send();
        } catch (EmailException e) {
            System.out.println("Email cannot be sent");
        }
    }

    @RequestMapping(value = "/user/forgotpassword.htm", method = RequestMethod.GET)
    public String getForgotPasswordForm(HttpServletRequest request) {

        return "forgot-password";
    }

    @RequestMapping(value = "/user/forgotpassword.htm", method = RequestMethod.POST)
    public String handleForgotPasswordForm(HttpServletRequest request, UserDAO userDao) {
        String username = request.getParameter("username");
        Captcha captcha = Captcha.load(request, "CaptchaObject");
        String captchaCode = request.getParameter("captchaCode");

        if (captcha.validate(captchaCode)) {
            Users user = userDao.get(username);
            sendEmail(user.getEmail(), "Your password is : " + user.getPassword());
            return "forgot-password-success";
        } else {
            request.setAttribute("captchamsg", "Captcha not valid");
            return "forgot-password";
        }
    }

    @RequestMapping(value = "user/validateemail.htm", method = RequestMethod.GET)
    public String validateEmail(HttpServletRequest request, UserDAO userDao, ModelMap map) {

        // The user will be sent the following link when the use registers
        // This is the format of the email
        // http://hostname:8080/lab10/user/validateemail.htm?email=useremail&key1=<random_number>&key2=<body
        // of the email that when user registers>
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        int key1 = Integer.parseInt(request.getParameter("key1"));
        int key2 = Integer.parseInt(request.getParameter("key2"));
        System.out.println(session.getAttribute("key1") );
        System.out.println(session.getAttribute("key2") );


        if ((Integer)(session.getAttribute("key1")) == key1 && ((Integer)session.getAttribute("key2"))== key2) {
            try {
                System.out.println("HI________");
                boolean updateStatus = userDao.updateUser(username);
                if (updateStatus) {
                    return "login";
                } else {

                    return "error";
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            map.addAttribute("errorMessage", "Link expired , generate new link");
            map.addAttribute("resendLink", true);
            return "error";
        }

        return "user-login";

    }
    @RequestMapping(value = "user/resendemail.htm", method = RequestMethod.POST)
    public String resendEmail(HttpServletRequest request, UserDAO userDAO) {
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        Users u = userDAO.get(username);
        Random rand = new Random();
        int randomNum1 = rand.nextInt(5000000);
        int randomNum2 = rand.nextInt(5000000);
        try {
            String str = "http://localhost:8080/lab10/user/validateemail.htm?username=" + username + "&key1=" + randomNum1
                    + "&key2=" + randomNum2;
            session.setAttribute("key1", randomNum1);
            session.setAttribute("key2", randomNum2);
            sendEmail(u.getEmail(),
                    "Click on this link to activate your account : "+ str);
        } catch (Exception e) {
            System.out.println("Email cannot be sent");
        }

        return "user-created";
    }

    @RequestMapping(value = "logout.htm",method = RequestMethod.GET)
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/";
    }

}
