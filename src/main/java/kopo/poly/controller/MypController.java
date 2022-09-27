package kopo.poly.controller;

import kopo.poly.dto.MarketDTO;
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
import java.util.ArrayList;
import java.util.List;

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

        //나의 마켓 리스트 갖고오기
        List<MarketDTO> mkList = mypageService.getMypageMarket(myDTO);
        log.info("사이즈 : "+String.valueOf(mkList.size()));
        if(mkList == null) {
            mkList = new ArrayList<>();
        }

        model.addAttribute("iDTO", iDTO); //user_info 개인정보
        model.addAttribute("mkList", mkList); //내 market 정보
        log.info(this.getClass().getName()+".myInfo End!!");
        return "/mypage/myinfo";
    }

    @PostMapping("/mypage/myinfo-modify")
    public String myInfoModify(HttpServletRequest request, Model model) throws Exception {
        log.info(this.getClass().getName()+".myInfoModify Start!!");

        //내 회원번호(seq 넣어줌)
        MypageDTO myDTO = new MypageDTO();
        myDTO.setUser_seq("1");

        //내 정보 갖고오기
        MypageDTO iDTO = mypageService.getMypageInfo(myDTO);

        if(iDTO == null) {
            iDTO = new MypageDTO();
        }
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
        return "/redirect";
    }
}
