package kopo.poly.controller;

import kopo.poly.dto.MarketDTO;
import kopo.poly.dto.MypageDTO;
import kopo.poly.service.IMypageService;
import kopo.poly.util.CmmUtil;
import kopo.poly.util.EncryptUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Slf4j
@Controller
public class MypController {

    @Resource(name = "MypageService")
    private IMypageService mypageService;

    @GetMapping("/mypage/myinfo")
    public String myInfo(HttpServletRequest request, Model model, HttpSession session) throws Exception {
        log.info(this.getClass().getName()+".myInfo Start!!");
        String seq = (String) session.getAttribute("sessionNo");

        if(seq == null) {
            String msg = "로그인이 필요한 서비스 입니다.";
            String url = "/login/login";
            model.addAttribute("msg", msg);
            model.addAttribute("url", url);
            return "redirect";
        }

        MypageDTO myDTO = new MypageDTO();
        myDTO.setUser_seq(seq);

        MypageDTO iDTO = mypageService.getMypageInfo(myDTO);

        if(iDTO == null) {
            iDTO = new MypageDTO();
        }
        model.addAttribute("iDTO", iDTO); //user_info 개인정보


        /* == 페이징 START == */
        // 전체 페이지 개수
        int count = mypageService.getMyMarketCount(myDTO);
        log.info("count: "+count);
        //시작 페이지
        String no = CmmUtil.nvl(request.getParameter("num"));
        int num = 0, start = 0, finish = 0;

        if(no == "")
            num = 1;
        else
            num = Integer.parseInt(no);

        // 한 페이지에 출력할 게시물 수
        finish = 5;
        start  = (num - 1) * finish;

        // 하단 페이징 번호 ([게시물 총 갯수 / 한 페이지에 출력 할 유저 수]의 올림)
        int pageNum = (int)Math.ceil((double) count / finish);

        log.info("num : "+num);
        log.info("start : "+start);
        log.info("finish : "+finish);

        // 시작번호, 끝번호
        myDTO.setStart(start);
        myDTO.setFinish(finish);

        // 나(seq) 갖고오기
        myDTO.setUser_seq(seq);
        log.info("seq : "+seq);

        //나의 마켓 리스트 갖고오기
        List<MarketDTO> mkList = mypageService.getMypageMarket(myDTO);

        model.addAttribute("pageNum", pageNum);

        // 한번에 표시할 페이징 번호의 갯수
        int pageNum_cnt = 5;

        // 표시되는 페이지 번호 중 마지막 번호
        int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);
        log.info("endPageNum : "+endPageNum);
        log.info("count : "+count);
        // 표시되는 페이지 번호 중 첫번째 번호
        int startPageNum = endPageNum - (pageNum_cnt - 1);

        // 마지막 번호 재계산
        int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));
        log.info("endPageNum_tmp : "+endPageNum_tmp);
        if(endPageNum > endPageNum_tmp) {
            endPageNum = endPageNum_tmp;
        }
        // 현재 페이지
        model.addAttribute("select", num);

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
    public String myinfoPaging(HttpSession session) throws Exception {
        log.info(this.getClass().getName() + ".myinfoPaging Start!!");

        MypageDTO myDTO = new MypageDTO();
        myDTO.setUser_seq((String) session.getAttribute("sessionNo"));

        log.info(this.getClass().getName() + ".myinfoPaging End!!");
        return "/mypage/myinfo";
    }

    @PostMapping("/mypage/myinfo-modify")
    public String myInfoModify(HttpServletRequest request, Model model, HttpSession session) throws Exception {
        log.info(this.getClass().getName()+".myInfoModify Start!!");

        //내 회원번호(seq 넣어줌)
        MypageDTO myDTO = new MypageDTO();
        myDTO.setUser_seq((String) session.getAttribute("sessionNo"));

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
    public String getMyInfoModify(HttpServletRequest request, Model model, HttpSession session) throws Exception {
        log.info(this.getClass().getName()+".getMyInfoModify Start!!");
        String name = CmmUtil.nvl(request.getParameter("name"));
        String email = EncryptUtil.encAES128CBC(CmmUtil.nvl(request.getParameter("email")));

        String new_password = EncryptUtil.encHashSHA256(CmmUtil.nvl(request.getParameter("password")));
        String hidden_password = CmmUtil.nvl(request.getParameter("hidden-password"));
        String password = "";
        if(new_password != hidden_password) {
            password = new_password;
        }

        log.info("name : "+name);
        log.info("email : "+email);
        log.info("password : "+password);

        MypageDTO iDTO = new MypageDTO();
        iDTO.setUser_seq((String) session.getAttribute("sessionNo"));
        iDTO.setUser_name(name);
        iDTO.setUser_email(email);
        iDTO.setUser_pw(password);

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

    @GetMapping("/mypage/myinfo-withdrawal")
    public String myInfoWithdrawal(HttpServletRequest request, Model model, HttpSession session) throws Exception {
        log.info(this.getClass().getName()+".myInfoWithdrawal Start!!");
        //String password = EncryptUtil.encHashSHA256(CmmUtil.nvl(request.getParameter("password")));
        String msg = "", url="", icon = "success";
        //내 회원번호(seq 넣어줌)
        MypageDTO myDTO = new MypageDTO();
        myDTO.setUser_seq((String) session.getAttribute("sessionNo"));

        // 회원 삭제 진행
        int res =  mypageService.myInfoWithdrawal((String) session.getAttribute("sessionNo"));
        log.info("res : "+res);
        if(res > 0) {
            url = "/index";
            msg = "회원 탈퇴가 완료되었습니다.";
        } else {
            icon="error";
            url="/mypage/myinfo";
            msg = "회원탈퇴 처리가 실패하였습니다.\n 관리자에게 문의해주세요.";
        }

        model.addAttribute("msg", msg);
        model.addAttribute("url", url);
        model.addAttribute("icon", icon);

        //세션 다 날리기
        session.invalidate();

        log.info(this.getClass().getName()+".myInfoWithdrawal End!!");
        return "/redirect";
    }

    @GetMapping("/mypage/calender")
    public String myCalender(HttpServletRequest request, Model model, HttpSession session) throws Exception {
        log.info(this.getClass().getName()+".myCalender Start!!");
       //String seq = (String) session.getAttribute("sessionNo");
        String seq = "1";
        if(seq == null) {
            String msg = "로그인이 필요한 서비스 입니다.";
            String url = "/login/login";
            model.addAttribute("msg", msg);
            model.addAttribute("url", url);
            return "redirect";
        }

        MypageDTO myDTO = new MypageDTO();
        myDTO.setUser_seq(seq);

        MypageDTO iDTO = mypageService.getMypageInfo(myDTO);

        if(iDTO == null) {
            iDTO = new MypageDTO();
        }
        model.addAttribute("iDTO", iDTO); //user_info 개인정보


        /* == 페이징 START == */
        // 전체 페이지 개수
        int count = mypageService.getMyMarketCount(myDTO);
        log.info("count: "+count);

        //시작 페이지
        String no = CmmUtil.nvl(request.getParameter("num"));
        int num = 0, start = 0, finish = 0;

        if(no == "")
            num = 1;
        else
            num = Integer.parseInt(no);

        finish = count - ( (num-1) * 5 );
        start  = finish - 4;
        if( start < 1 ) start = 1;

        log.info("num : "+num);
        log.info("start : "+start);
        log.info("finish : "+finish);

        // 시작번호, 끝번호
        myDTO.setStart(start);
        myDTO.setFinish(finish);

        // 나(seq) 갖고오기
        myDTO.setUser_seq(seq);
        log.info("seq : "+seq);

        //나의 마켓 리스트 갖고오기
        List<MarketDTO> mkList = mypageService.getMypageMarket(myDTO);

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

        log.info("startPageNum: "+startPageNum);
        log.info("endPageNum: "+endPageNum);
        // 현재 페이지
        model.addAttribute("select", num);

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

        log.info(this.getClass().getName()+".myCalender End!!");
        return "/mypage/calender";
    }
}
