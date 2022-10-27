package kopo.poly.controller;

import kopo.poly.dto.BicycleDTO;
import kopo.poly.dto.BicycleRowDTO;
import kopo.poly.service.IBicycleService;
import kopo.poly.service.IMailService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@RequestMapping("bicycle")
@Controller
public class BicycleController {

    @Resource(name = "BicycleService")
    private IBicycleService bicycleService;

    @GetMapping("bicycle")
    public String bicycle(HttpServletRequest request, Model model) throws Exception {
        log.info(this.getClass().getName() + ".bicycle Start!!");

        //BicycleDTO bDTO = bicycleService.callBicycleApi();

        //model.addAttribute("bDTO", bDTO);
        log.info(this.getClass().getName() + ".bicycle End!!");
        return "/bicycle/bicycle";
    }

    @GetMapping("getBicycle")
    public @ResponseBody BicycleDTO getBicycle(HttpServletRequest request) throws Exception {
        log.info(this.getClass().getName() + ".getBicycle Start!!!");

        BicycleDTO bDTO = bicycleService.callBicycleApi();

        log.info(this.getClass().getName() + ".getBicycle End!!");
        return bDTO;
    }

}
