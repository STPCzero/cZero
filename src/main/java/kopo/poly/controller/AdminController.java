package kopo.poly.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class AdminController {

    @GetMapping("/admin/admin-member")
    public String admin() {
        log.info(getClass().getName() + " admin-member Start!!!");
        log.info(getClass().getName() + " admin-member End!!!");
        return "/admin/admin-member";
    }
}
