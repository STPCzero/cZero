package kopo.poly.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import kopo.poly.dto.MarketDTO;
import kopo.poly.dto.UserInfoDTO;
import kopo.poly.service.IAdminService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@Controller
public class AdminController {

    @Resource(name = "AdminService")
    private IAdminService adminService;

    @GetMapping("/admin/admin-member")
    public String adminMembers(HttpServletRequest request, ModelMap model) throws Exception {
        log.info(getClass().getName() + " admin-member Start!!!");
        String search = CmmUtil.nvl(request.getParameter("searchName"));

        log.info("search: "+search);
        UserInfoDTO uDTO = new UserInfoDTO();

        uDTO.setUser_name(search);

        /* == 페이징 START == */
        // 전체 페이지 개수
        int count = adminService.getMembersCount(uDTO);
        log.info("count: "+count);

        //시작 페이지
        String no = CmmUtil.nvl(request.getParameter("num"));
        int num = 0, start = 0, finish = 0;

        if(no == "")
            num = 1;
        else
            num = Integer.parseInt(no);

        finish = count - ( (num-1) * 10 );
        start  = finish - 9;
        if( start < 1 ) start = 1;

        log.info("num : "+num);
        log.info("start : "+start);
        log.info("finish : "+finish);

        // 시작번호, 끝번호
        uDTO.setStart(start);
        uDTO.setFinish(finish);

        log.info("값 확인 : "+uDTO.getUser_name());
        List<UserInfoDTO> uList = adminService.getMembersInfo(uDTO);

        log.info("uList size : "+uList.size());
        model.addAttribute("uList", uList);

        // 한번에 표시할 페이징 번호의 갯수
        int pageNum_cnt = 10;
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

        model.addAttribute("searchName", search);
        /* == 페이징 END == */

        log.info(getClass().getName() + " admin-member End!!!");
        return "/admin/admin-member";
    }

    @GetMapping(value = "/admin/admin-market")
    public String adminMarket(HttpServletRequest request, ModelMap model) throws Exception {
        log.info(this.getClass().getName() + ".admin-market Start!!");
        String search = "";

        log.info("search: "+search);
        MarketDTO uDTO = new MarketDTO();
        uDTO.setTitle(search);

        /* == 페이징 START == */
        // 전체 페이지 개수
        int count = adminService.getMarketCount();
        log.info("count: "+count);

        //시작 페이지
        String no = CmmUtil.nvl(request.getParameter("num"));
        int num = 0, start = 0, finish = 0;

        if(no == "")
            num = 1;
        else
            num = Integer.parseInt(no);

        finish = count - ( (num-1) * 10 );
        start  = finish - 9;
        if( start < 1 ) start = 1;

        log.info("num : "+num);
        log.info("start : "+start);
        log.info("finish : "+finish);

        // 시작번호, 끝번호
        uDTO.setStart(start);
        uDTO.setFinish(finish);

        log.info("값 확인 : "+ uDTO.getTitle());
        List<MarketDTO> mList = adminService.getMarketInfo(uDTO);

        log.info("mList size : "+ mList.size());
        model.addAttribute("mList", mList);

        // 한번에 표시할 페이징 번호의 갯수
        int pageNum_cnt = 10;
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

        log.info(this.getClass().getName() + ".admin-market End!!");

        return "/admin/admin-market";
    }

    @GetMapping (value = "/test2")
    @ResponseBody
    public Object test ()throws Exception{
        UserInfoDTO uDTO = new UserInfoDTO();

        uDTO.setUser_name("사용자");

        int count = adminService.getMembersCount(uDTO);
        log.info("count: "+count);

        //시작 페이지
        String no ="1";
        int num = 0, start = 0, finish = 0;

        if(no == "")
            num = 1;
        else
            num = Integer.parseInt(no);

        finish = count - ( (num-1) * 10 );
        start  = finish - 9;
        if( start < 1 ) start = 1;

        log.info("num : "+num);
        log.info("start : "+start);
        log.info("finish : "+finish);

        // 시작번호, 끝번호
        uDTO.setStart(start);
        uDTO.setFinish(finish);

        log.info("값 확인 : "+uDTO.getUser_name());
        List<UserInfoDTO> uList = adminService.getMembersInfo(uDTO);

        log.info("uList size : "+uList.size());


        // 한번에 표시할 페이징 번호의 갯수
        int pageNum_cnt = 10;
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
        JSONArray jsonArray = new JSONArray();
        ObjectMapper objectMapper = new ObjectMapper();
        for(UserInfoDTO dto : uList){
            jsonArray.put(objectMapper.writeValueAsString(dto));
        }
        log.info(uList.get(0).toString());
        return jsonArray.toString();
    }
    @GetMapping (value = "/test")
    public String test2 ()throws Exception{


        return "/admin/test";
    }
}
