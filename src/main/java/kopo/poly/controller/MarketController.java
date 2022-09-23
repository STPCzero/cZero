package kopo.poly.controller;

import kopo.poly.dto.MarketDTO;
import kopo.poly.dto.NoticeDTO;
import kopo.poly.service.IMarketService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.yaml.snakeyaml.error.Mark;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
public class MarketController {

    @Resource(name = "MarketService")
    private IMarketService marketService;

    @GetMapping(value = "/market/market-list")
    public String marketList(ModelMap model)
            throws Exception {
        log.info(this.getClass().getName()+".market-list Start!!");

        List<MarketDTO> rList = marketService.getMarketList();

        // 마켓리스트 가져오기
        if (rList == null) {
            rList = new ArrayList<>();

        }

        // 조회된 리스트 결과값 넣어주기
        model.addAttribute("rList", rList);

        log.info(this.getClass().getName()+".market-list End!!");

        return "market/market-list";
    }

    @GetMapping(value = "market/market-upload")
    public String marketUpload() throws Exception {
        log.info(this.getClass().getName()+".market-upload Start!!");
        log.info(this.getClass().getName()+".market-upload End!!");
        return "market/market-upload";
    }

    @PostMapping(value = "market/MarketInsert")
    public String MarketInsert(HttpSession session, HttpServletRequest request, ModelMap model) {

        log.info(this.getClass().getName() + ".MarketInsert start!");

        String msg = "";

        try {
            String user_name = CmmUtil.nvl((String) session.getAttribute("SESSION_USER_NAME"));
            String title = CmmUtil.nvl(request.getParameter("title"));
            String contents = CmmUtil.nvl(request.getParameter("contents"));

            log.info("user_name : " + user_name);
            log.info("title : " + title);
            log.info("contents : " + contents);

            MarketDTO mDTO = new MarketDTO();
            NoticeDTO nDTO = new NoticeDTO();

            nDTO.setUser_name(user_name);
            mDTO.setTitle(title);
            mDTO.setContents(contents);

            marketService.InsertMarketInfo(mDTO);

            // 저장이 완료 되면 사용자에게 보여줄 메시지
            msg = "등록되었습니다.";

        } catch (Exception e) {

            // 저장이 실패되면 사용자에게 보여줄 메시지
            msg = "실패하였습니다. : " + e.getMessage();
            log.info(e.toString());
            e.printStackTrace();

        }finally {
            log.info(this.getClass().getName() + ". MarketInsert end!");

            model.addAttribute("msg", msg);
        }
        return "/market/MsgToList";
    }

    @GetMapping(value = "market/MarketInfo")
    public String MarketInfo(HttpServletRequest request, ModelMap model) {
        log.info(this.getClass().getName() + "MarketInfo start!");

        String msg = "";

        try {
            String mSeq = CmmUtil.nvl(request.getParameter("mSeq")); // 공지글 번호(PK)

            log.info("mSeq : " + mSeq);

            MarketDTO mDTO = new MarketDTO();
            mDTO.setMk_seq(mSeq);

            // 공지사항 상세정보 가져오기
            MarketDTO dDTO = marketService.getMarketInfo(mDTO);

            if (dDTO == null) {
                dDTO = new MarketDTO();

            }
            log.info("getMarketInfo success!");

            model.addAttribute("dDTO", dDTO);
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

        return "/market/MarketInfo";
    }

    @PostMapping(value = "market/MarketUpdate")
    public String MarketUpdate(HttpServletRequest session, HttpServletRequest request, ModelMap model) {

        log.info(this.getClass().getName() + ".MarketUpdate start!");

        String msg = "";

        try {

            String user_name = CmmUtil.nvl((String) session.getAttribute("SESSION_USER_ID"));
            String mk_seq = CmmUtil.nvl(request.getParameter("mk_seq"));
            String title = CmmUtil.nvl(request.getParameter("title"));
            String contents = CmmUtil.nvl(request.getParameter("contents"));

            log.info("user_name : " + user_name);
            log.info("mk_seq : " + mk_seq);
            log.info("title : " + title);
            log.info("contents : " + contents);

            MarketDTO mDTO = new MarketDTO();
            NoticeDTO nDTO = new NoticeDTO();

            nDTO.setUser_name(user_name);
            mDTO.setMk_seq(mk_seq);
            mDTO.setTitle(title);
            mDTO.setContents(contents);

            // 게시글 수정하기 DB
            marketService.updateMarketInfo(mDTO);

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

    @GetMapping(value = "market/MarketDelete")
    public String MarketDelete(HttpServletRequest request, ModelMap model) {

        log.info(this.getClass().getName() + ".MarketDelete start!");

        String msg = "";

        try {

            String mSeq = CmmUtil.nvl(request.getParameter("mSeq"));

            log.info("mSeq : " + mSeq);

            MarketDTO mDTO = new MarketDTO();

            mDTO.setMk_seq(mSeq);

            // 상품 삭제하기 DB
            marketService.deleteMarketInfo(mDTO);

            msg = "삭제되었습니다.";
        } catch (Exception e) {
            msg = "실패하였습니다. : " + e.getMessage();
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
