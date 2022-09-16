package kopo.poly.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class MypController {

    @GetMapping("/mypage/myinfo")
    public String myInfo() {
        log.info("myInfo start!!");
        return null;
    }

    @GetMapping("/mypage/myinfo-modify")
    public String myInfoModify() {
        log.info("myInfoModify start!!");
        return null;
    }
}
