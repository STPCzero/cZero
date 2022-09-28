package kopo.poly.controller;

import kopo.poly.dto.UserInfoDTO;
import kopo.poly.service.IUserInfoService;
import kopo.poly.util.CmmUtil;
import kopo.poly.util.EncryptUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Slf4j
@Controller
public class LoginController {

    @Resource(name = "UserInfoService")
    private IUserInfoService userInfoService;

//    @GetMapping(value = "insertUserInfo")
    @RequestMapping(value = "/login/insertUserInfo", method = {RequestMethod.GET,RequestMethod.POST})
    public String insertUserInfo(HttpServletRequest request, Model model) throws Exception {
        log.info(this.getClass().getName() + ".insertUserInfo Start!!");


        UserInfoDTO uDTO = null;
        String msg = "";
        String url = "";

        try {
            String user_seq = CmmUtil.nvl(request.getParameter("user_seq"));
            String user_id = CmmUtil.nvl(request.getParameter("user_id"));
            String user_pw = CmmUtil.nvl(request.getParameter("user_pw"));
            String user_name = CmmUtil.nvl(request.getParameter("user_name"));
            String user_email = CmmUtil.nvl(request.getParameter("user_email"));

            log.info("user_id" + user_id);
            log.info("user_pw" + user_pw);
            log.info("user_name" + user_name);
            log.info("user_email" + user_email);

            uDTO = new UserInfoDTO();

            uDTO.setUser_seq(user_seq);
            uDTO.setUser_id(user_id);
            uDTO.setUser_name(user_name);
            uDTO.setUser_pw(EncryptUtil.encHashSHA256(user_pw));
            uDTO.setUser_email(EncryptUtil.encAES128CBC(user_email));


            int res = userInfoService.insertUserInfo(uDTO);

            log.info("회원가입 결과(res) : " + res);

            if (res == 1) {
                msg = "회원가입 되었습니다. 환영합니다";
                url = "/index";

            } else if (res == 2) {
                msg = "이미 가입된 이메일 주소입니다.";
                url = "register";

            } else {
                msg = "오류로 인해 회원가입에 실패했습니다. 다시 시도해주세요";
                url = "register";
                log.info("url test : "+ url);
            }
        } catch (Exception e) {
            msg = "실패하였습니다. : " + e;
            log.info(e.toString());
            e.printStackTrace();
        } finally {
            log.info(this.getClass().getName() + ".insertUserInfo End!!");

            model.addAttribute("msg", msg);
            model.addAttribute("url", url);

            model.addAttribute("uDTO", uDTO);

            uDTO = null;

        }
        return "redirect";

    }


    @GetMapping(value = "login/login")
    public String login() throws Exception {
        log.info(this.getClass().getName() + ".login Start!!");
        log.info(this.getClass().getName() + ".login End!!");
        return "login/login";
    }

    @GetMapping(value = "login/register")
    public String register() throws Exception {
        log.info(this.getClass().getName() + ".register Start!!");
        log.info(this.getClass().getName() + ".register End!!");
        return "login/register";
    }

    @GetMapping(value = "login/find-id")
    public String findId() throws Exception {
        log.info(this.getClass().getName() + ".find-id Start!!");
        log.info(this.getClass().getName() + ".find-id End!!");
        return "login/find-id";
    }

    @GetMapping(value = "login/find-pw")
    public String findPw() throws Exception {
        log.info(this.getClass().getName() + ".find-pw Start!!");
        log.info(this.getClass().getName() + ".find-pw End!!");
        return "login/find-pw";
    }

    @GetMapping(value = "login/forgot-password")
    public String forgotPassword() throws Exception {
        log.info(this.getClass().getName() + ".forgot-password Start!!");
        log.info(this.getClass().getName() + ".forgot-password End!!");
        return "login/forgot-password";
    }

}
