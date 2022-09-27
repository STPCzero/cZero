package kopo.poly.controller;

import kopo.poly.dto.MypageDTO;
import kopo.poly.service.IMypageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Slf4j
@Controller
public class MypController {

    @Resource(name = "MypageService")
    private IMypageService mypageService;

    @GetMapping("/mypage/myinfo")
    public String myInfo(HttpServletRequest request, Model model, HttpSession session) throws Exception {
        log.info(this.getClass().getName()+".myInfo Start!!");

        MypageDTO myDTO = new MypageDTO();
        myDTO.setUser_seq("1");

        MypageDTO iDTO = mypageService.getMypageInfo(myDTO);

        if(iDTO == null) {
            iDTO = new MypageDTO();
        }
        log.info("iDTO.getUser_name: "+iDTO.getUser_name());
        log.info("iDTO.getUser_name: "+iDTO.getUser_email());

        model.addAttribute("iDTO", iDTO); //user_info 개인정보

        log.info(this.getClass().getName()+".myInfo End!!");
        return "/mypage/myinfo";
    }

    @PostMapping("/mypage/myinfo-modify")
    public String myInfoModify() {
        log.info(this.getClass().getName()+".myInfoModify Start!!");
        log.info(this.getClass().getName()+".myInfoModify End!!");
        return "/mypage/myinfo-modify";
    }
}
