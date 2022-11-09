package kopo.poly.controller;

import kopo.poly.dto.UserInfoDTO;
import kopo.poly.service.IAdminService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@RequestMapping("/admin")
@Controller
public class AdminController {

    @Resource(name = "AdminService")
    private IAdminService adminService;

    @GetMapping("admin-member")
    public String adminMembers(HttpServletRequest request, ModelMap model) throws Exception {
        log.info(getClass().getName() + " admin-member Start!!!");
        String search = "";

        log.info("search: "+search);
        UserInfoDTO uDTO = new UserInfoDTO();

        uDTO.setUser_name(search);

        /* == 페이징 START == */
        // 전체 페이지 개수
        int count = adminService.getMembersCount();
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
        uDTO.setStart(start);
        uDTO.setFinish(finish);

        log.info("값 확인 : "+uDTO.getUser_name());
        List<UserInfoDTO> uList = adminService.getMembersInfo(uDTO);

        log.info("uList size : "+uList.size());
        model.addAttribute("uList", uList);
        log.info(getClass().getName() + " admin-member End!!!");
        return "/admin/admin-member";
    }
}
