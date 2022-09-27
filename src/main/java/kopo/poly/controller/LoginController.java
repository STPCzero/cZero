package kopo.poly.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class LoginController {

    @GetMapping(value = "login/login")
    public String login() throws Exception {
        log.info(this.getClass().getName()+".login Start!!");
        log.info(this.getClass().getName()+".login End!!");
        return "login/login";
    }

    @GetMapping(value = "login/register")
    public String register() throws Exception {
        log.info(this.getClass().getName()+".register Start!!");
        log.info(this.getClass().getName()+".register End!!");
        return "login/register";
    }

    @GetMapping(value = "login/find-id")
    public String findId() throws Exception {
        log.info(this.getClass().getName()+".register Start!!");
        log.info(this.getClass().getName()+".register End!!");
        return "login/find-id";
    }

    @GetMapping(value = "login/find-pw")
    public String findPw() throws Exception {
        log.info(this.getClass().getName()+".register Start!!");
        log.info(this.getClass().getName()+".register End!!");
        return "login/find-pw";
    }

    @GetMapping(value = "login/forgot-password")
    public String forgotPassword() throws Exception {
        log.info(this.getClass().getName()+".register Start!!");
        log.info(this.getClass().getName()+".register End!!");
        return "login/forgot-password";
    }

}
