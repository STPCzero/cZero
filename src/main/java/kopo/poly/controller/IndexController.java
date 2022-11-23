package kopo.poly.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
public class IndexController {

    @GetMapping(value = "index")
    public String index() throws Exception {
        log.info(this.getClass().getName()+".index Start!!");
        log.info(this.getClass().getName()+".index End!!");
        return "index";
    }

    /** Logout */
    @GetMapping(value = "logout")
    public String logout(HttpSession session, Model model) throws Exception {
        log.info(this.getClass().getName()+".logout Start!!");

        session.invalidate(); //세션 다 지움

        String msg = "로그아웃 되었습니다.";
        String url = "/index";

        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        log.info(this.getClass().getName()+".logout End!!");
        return "redirect";
    }


}
