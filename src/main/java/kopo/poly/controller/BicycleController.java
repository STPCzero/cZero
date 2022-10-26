package kopo.poly.controller;

import kopo.poly.service.IBicycleService;
import kopo.poly.service.IMailService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Slf4j
@RequestMapping("bicycle")
@Controller
public class BicycleController {

    @Resource(name = "BicycleService")
    private IBicycleService bicycleService;

    @GetMapping("bicycle")
    public String bicycle(HttpServletRequest request, Model model) throws Exception {
        log.info(this.getClass().getName() + ".bicycle Start!!");
        log.info(this.getClass().getName() + ".bicycle End!!");
        return "/bicycle/bicycle";
    }

    @GetMapping("bicycleTest")
    public String bicycleTest(HttpServletRequest request, Model model) throws Exception {
        log.info(this.getClass().getName() + ".bicycleTest Start!!");
        log.info(this.getClass().getName() + ".bicycleTest End!!");
        return "/bicycle/bicycleTest";
    }

}
