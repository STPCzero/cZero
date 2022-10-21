package kopo.poly.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@Controller
public class BicycleController {

    @GetMapping("/bicycle/bicycle")
    public String bicycle(HttpServletRequest request, Model model) throws Exception {
        log.info(this.getClass().getName() + ".bicycle Start!!");
        log.info(this.getClass().getName() + ".bicycle End!!");
        return "/bicycle/bicycle";
    }

}
