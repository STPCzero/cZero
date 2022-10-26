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
        model.addAttribute("iDTO", iDTO); //user_info 개인정보


        /* == 페이징 START == */
        int num = 1;
        int userNum = 5;

        // 현재 페이지 (리미트 기준)
        int displayNum = (num - 1) * userNum;
        myDTO.setDisplayNum(String.valueOf(displayNum));
        //나의 마켓 리스트 갖고오기
        List<MarketDTO> mkList = mypageService.getMypageMarket(myDTO);

        log.info("사이즈 : "+String.valueOf(mkList.size()));

        int count = Integer.parseInt(String.valueOf(mkList.size()));

        // 하단 페이징 번호 ([게시물 총 갯수 / 한 페이지에 출력 할 유저 수]의 올림)
        int pageNum = (int)Math.ceil((double) count / userNum);
        model.addAttribute("pageNum", pageNum);

        // 한번에 표시할 페이징 번호의 갯수
        int pageNum_cnt = 5;

        // 표시되는 페이지 번호 중 마지막 번호
        int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);

        // 표시되는 페이지 번호 중 첫번째 번호
        int startPageNum = endPageNum - (pageNum_cnt - 1);

        // 마지막 번호 재계산
        int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));

        if(endPageNum > endPageNum_tmp) {
            endPageNum = endPageNum_tmp;
        }

        boolean prev = startPageNum == 1 ? false : true;
        boolean next = endPageNum * pageNum_cnt >= count ? false : true;

        // 시작 및 끝 번호
        model.addAttribute("startPageNum", startPageNum);
        model.addAttribute("endPageNum", endPageNum);

        // 이전 및 다음
        model.addAttribute("prev", prev);
        model.addAttribute("next", next);
        /* == 페이징 END == */

        if(mkList == null) {
            mkList = new ArrayList<>();
        }
        model.addAttribute("mkList", mkList); //내 market 정보

        log.info(this.getClass().getName()+".myInfo End!!");
        return "/mypage/myinfo";
    }

    @PostMapping("/mypage/myinfoPaging")
    public String myinfoPaging(HttpServletRequest request, Model model) throws Exception {
        log.info(this.getClass().getName() + ".myinfoPaging Start!!");

        MypageDTO myDTO = new MypageDTO();
        myDTO.setUser_seq("1");

        log.info(this.getClass().getName() + ".myinfoPaging End!!");
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
