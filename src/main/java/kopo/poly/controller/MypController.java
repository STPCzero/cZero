package kopo.poly.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class MypController {

    @GetMapping("/mypage/myinfo")
    public String myInfo() {
        log.info(this.getClass().getName()+".myInfo Start!!");
        log.info(this.getClass().getName()+".myInfo End!!");
        return "/mypage/myinfo";
    }

    @GetMapping("/mypage/myinfo-modify")
    public String myInfoModify() {
        log.info(this.getClass().getName()+".myInfoModify Start!!");
        log.info(this.getClass().getName()+".myInfoModify End!!");
        return "/mypage/myinfo-modify";
    }
}
