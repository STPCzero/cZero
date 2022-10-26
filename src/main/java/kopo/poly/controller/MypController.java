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
