package kopo.poly.controller;

import kopo.poly.dto.MarketDTO;
import kopo.poly.dto.UserInfoDTO;
import kopo.poly.service.IMarketService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.catalina.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@RequestMapping(value = {"/market", "/admin"})
@Controller
public class MarketController {

    @Resource(name = "MarketService")
    private IMarketService marketService;

    @GetMapping(value = "market-list")
    public String marketlist(ModelMap model) throws Exception {
        log.info(this.getClass().getName() + ".market-list Start!!");

        // 마켓리스트 가져오기
        List<MarketDTO> mList = marketService.getMarketList();
        UserInfoDTO uDTO = new UserInfoDTO();


        if (mList == null) {
            mList = new ArrayList<>();
        }


        // 조회된 리스트 결과값 넣어주기
        model.addAttribute("mList", mList);

        model.addAttribute("uDTO",uDTO);

        log.info(this.getClass().getName() + ".market-list End!!");

        return "/market/market-list";
    }

    @GetMapping(value = "market-upload")
    public String marketupload() {
        log.info(this.getClass().getName() + ".market-upload Start!!");
        log.info(this.getClass().getName() + ".market-upload End!!");
        return "/market/market-upload";
    }

    // 마켓 글 등록
    @PostMapping(value = "marketInsert")
    public String marketInsert(HttpSession session, HttpServletRequest request, ModelMap model) {
        log.info(this.getClass().getName() + ".MarketInsert Start!");

        String msg = "";

        try {
            String user_name = CmmUtil.nvl((String) session.getAttribute("SESSION_USER_NAME"));
            String title = CmmUtil.nvl(request.getParameter("title"));
            String contents = CmmUtil.nvl(request.getParameter("contents"));

            log.info("user_name" + user_name);
            log.info("title" + title);
            log.info("contents" + contents);

            MarketDTO mDTO = new MarketDTO();
            UserInfoDTO uDTO = new UserInfoDTO();
            mDTO.setUser_name(user_name);
            uDTO.setUser_name(user_name);
            mDTO.setTitle(title);
            mDTO.setContents(contents);

            marketService.insertMarketInfo(mDTO, uDTO);

            msg = "등록되었습니다.";

        } catch (Exception e) {

            // 저장이 실패되면 사용자에게 보여줄 메시지
            msg = "실패하였습니다. : " + e.getMessage();
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            log.info(this.getClass().getName() + ".MarketInsert end!");

            // 결과 메시지 전달하기
            model.addAttribute("msg", msg);

        }

        return "/market/MsgToList";
    }

    // 마켓 상세보기
    @GetMapping(value = "market-detail")
    public String marketdetail(HttpServletRequest request, ModelMap model) {

        log.info(this.getClass().getName() + ".market-detail Start!!");

        String msg = "";

        try {
            String mk_seq = CmmUtil.nvl(request.getParameter("mk_seq"));

            log.info("mk_seq : " + mk_seq);

            MarketDTO mDTO = new MarketDTO();
            mDTO.setMk_seq(mk_seq);

            // 마켓 상세정보 가져오기
            MarketDTO rDTO = marketService.getMarketInfo(mDTO);

            if (rDTO == null) {
                rDTO = new MarketDTO();

            }

            log.info("getMarketInfo success!!");

            // 조회된 리스트 결과값 넣어주기
            model.addAttribute("rDTO", rDTO);
        } catch (Exception e) {

            // 저장이 실패되면 사용자에게 보여줄 메시지
            msg = "실패하였습니다. : " + e.getMessage();
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            log.info(this.getClass().getName() + ".MarketInsert end!");

            // 결과 메시지 전달하기
            model.addAttribute("msg", msg);

        }

        log.info(this.getClass().getName() + ".MarketInfo end!");

        return "/market/market-detail";

    }


    @GetMapping(value = "market-modify")
    public String marketmodify(HttpSession session, HttpServletRequest request, ModelMap model) {
        log.info(this.getClass().getName() + ".market-modify Start!!");

        String msg = "";

        try {
            String user_name = CmmUtil.nvl((String) session.getAttribute("SESSION_USER_NAME"));
            String mk_seq = CmmUtil.nvl(request.getParameter("mk_seq"));
            String title = CmmUtil.nvl(request.getParameter("title"));
            String contents = CmmUtil.nvl(request.getParameter("contents"));

            log.info("user_name" + user_name);
            log.info("mk_seq" + mk_seq);
            log.info("title" + title);
            log.info("contents" + contents);

            MarketDTO mDTO = new MarketDTO();
            UserInfoDTO uDTO = new UserInfoDTO();

            uDTO.setUser_name(user_name);
            mDTO.setMk_seq(mk_seq);
            mDTO.setTitle(title);
            mDTO.setContents(contents);

            // 마켓 수정하기 DB
            marketService.updateMarketInfo(mDTO, uDTO);

            msg = "수정되었습니다.";

        } catch (Exception e) {

            msg = "실패하였습니다. : " + e.getMessage();
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            log.info(this.getClass().getName() + ".MarketUpdate end!");

            // 결과 메시지 전달하기
            model.addAttribute("msg", msg);

        }

        return "/market/MsgToList";
    }

    // 마켓 삭제
    @GetMapping(value = "MarketDelete")
    private String deleteMarket(HttpServletRequest request, ModelMap model) {
        log.info(this.getClass().getName() + ".MarketDelete start!");

        String msg = "";

        try {
            String mk_seq = CmmUtil.nvl(request.getParameter("mk_seq"));

            log.info("mk_seq : " + mk_seq);

            MarketDTO mDTO = new MarketDTO();

            mDTO.setMk_seq(mk_seq);

            // 마켓 삭제하기 DB
            marketService.deleteMarketInfo(mDTO);

            msg = "삭제되었습니다.";

        } catch (Exception e) {
            msg = "삭제하였습니다. : " + e.getMessage();
            log.info(e.toString());
            e.printStackTrace();

        } finally {
            log.info(this.getClass().getName() + ".MarketDelete end!");

            // 결과 메시지 전달하기
            model.addAttribute("msg", msg);

        }

        return "/market/MsgToList";
    }

}
