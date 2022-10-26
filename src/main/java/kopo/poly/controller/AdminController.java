package kopo.poly.controller;

import kopo.poly.dto.UserInfoDTO;
import kopo.poly.service.IAdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Slf4j
@RequestMapping("/admin")
@Controller
public class AdminController {

    @Resource(name = "AdminService")
    private IAdminService adminService;

    @GetMapping("admin-member")
    public String adminMembers(Model model) throws Exception {
        log.info(getClass().getName() + " admin-member Start!!!");

        List<UserInfoDTO> uList = adminService.geMembersInfo();

        model.addAttribute("uList", uList);
        log.info(getClass().getName() + " admin-member End!!!");
        return "/admin/admin-member";
    }
}
