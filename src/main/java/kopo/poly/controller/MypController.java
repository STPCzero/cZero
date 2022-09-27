package kopo.poly.controller;

import kopo.poly.dto.MypageDTO;
import kopo.poly.service.IMypageService;
import kopo.poly.util.CmmUtil;
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
    public String myInfoModify(HttpServletRequest request, Model model) throws Exception {
        log.info(this.getClass().getName()+".myInfoModify Start!!");

        MypageDTO myDTO = new MypageDTO();
        myDTO.setUser_seq("1");

        MypageDTO iDTO = mypageService.getMypageInfo(myDTO);

        if(iDTO == null) {
            iDTO = new MypageDTO();
        }
        log.info("iDTO.getUser_name: "+iDTO.getUser_name());
        log.info("iDTO.getUser_name: "+iDTO.getUser_email());
        model.addAttribute("iDTO", iDTO); //user_info 개인정보
        log.info(this.getClass().getName()+".myInfoModify End!!");
        return "/mypage/myinfo-modify";
    }

    @PostMapping("/mypage/getMyInfoModify")
    public String getMyInfoModify(HttpServletRequest request, Model model) throws Exception {
        log.info(this.getClass().getName()+".getMyInfoModify Start!!");
        String name = CmmUtil.nvl(request.getParameter("name"));
        String email = CmmUtil.nvl(request.getParameter("email"));

        log.info("name : "+name);
        log.info("email : "+email);

        MypageDTO iDTO = new MypageDTO();
        iDTO.setUser_seq("1");
        iDTO.setUser_name(name);
        iDTO.setUser_email(email);

        int res = mypageService.getMyInfoModify(iDTO);

        String msg = "";

        if(res > 0) {
            msg = "정보 수정 성공";
            log.info("res : "+res);
        } else {
            msg = "정보 수정 실패";
        }
        String url = "/mypage/myinfo";

        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        log.info(this.getClass().getName()+".getMyInfoModify End!!");
        return "/mypage/myinfo";
    }
}
