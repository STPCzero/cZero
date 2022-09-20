package kopo.poly.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class MarketController {

    @GetMapping(value = "/market/market-list")
    public String marketlist() throws Exception {
        log.info(this.getClass().getName()+".market-list Start!!");
        log.info(this.getClass().getName()+".market-list End!!");
        return "market/market-list";
    }

    @GetMapping(value = "market/market-upload")
    public String marketupload() throws Exception {
        log.info(this.getClass().getName()+".market-upload Start!!");
        log.info(this.getClass().getName()+".market-upload End!!");
        return "market/market-upload";
    }
}
