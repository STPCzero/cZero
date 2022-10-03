package kopo.poly.controller;

import kopo.poly.dto.MailDTO;
import kopo.poly.dto.UserInfoDTO;
import kopo.poly.service.IMailService;
import kopo.poly.service.IUserInfoService;
import kopo.poly.util.CmmUtil;
import kopo.poly.util.EncryptUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Slf4j
@Controller
public class LoginController {

    @Resource(name = "UserInfoService")
    private IUserInfoService userInfoService;

    @Resource(name = "MailService")
    private IMailService mailService;


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

    // 유저 ID찾기 ---> 이메일 전송
    @PostMapping(value = "forget_id")
    public String findID(HttpServletRequest request, ModelMap model) throws Exception {

        log.info(this.getClass().getName() + ".findId start!");

        String msg = "";
        String url = "";
        String icon = "";
        String contents = "";

        try {
            // 이메일 AES-128-CBC 암호화
            String user_name = CmmUtil.nvl(request.getParameter("user_name"));
            String user_email = CmmUtil.nvl(request.getParameter("user_email"));

            UserInfoDTO uDTO = new UserInfoDTO();

            uDTO.setUser_name(user_name);
            uDTO.setUser_email(user_email);
            log.info("user_name : " + user_name);
            log.info("user_email : " + user_email);

            UserInfoDTO rDTO = userInfoService.findUserId(uDTO);

            log.info("rDTO : " + rDTO);
            if (rDTO != null) {
                String user_id = rDTO.getUser_id();
                msg = "아이디 찾기 성공!";
                icon = "success";
                contents = "해당하는 아이디 : " + user_id;
            } else {
                msg = "아이디 찾기 실패!";
                icon = "warning";
                contents = "이름과 이메일을 확인해주세요.";
            }
            url = "/login/login";


        } catch (Exception e) {
            msg = "서버 오류입니다.";
            url = "login/find-id";
            log.info(e.toString());
            e.printStackTrace();
        }

        model.addAttribute("msg", msg);
        model.addAttribute("url", url);
        model.addAttribute("icon", icon);
        model.addAttribute("contents", contents);

        log.info(this.getClass().getName() + ".findId end!");

        return "redirect";
    }

    // 유저 비밀번호 찾기 --> 새비밀번호 전송 (비밀번호를모를때)
    @PostMapping(value = "forgot-password")
    public String findPw(HttpServletRequest request, ModelMap model) throws Exception {

        log.info(this.getClass().getName() + ".findPw start!");

        String msg = "";
        String url = "";
        String icon = "";
        String contents = "";

        try {

            String newPW = String.valueOf((int) (Math.random() * 1000000));

            // 이메일 AES-128-CBC 암호화
            String user_email = CmmUtil.nvl(request.getParameter("user_email"));
            String user_id = CmmUtil.nvl(request.getParameter("user_id"));
            // 비밀번호 해시 알고리즘 암호화
            String user_pw = EncryptUtil.encHashSHA256(newPW);

            UserInfoDTO pDTO = new UserInfoDTO();
            pDTO.setUser_pw(user_pw);
            pDTO.setUser_email(user_email);
            pDTO.setUser_id(user_id);
            log.info("user_email : " + user_email);
            log.info("user_pw : " + user_pw);
            log.info("user_id :" + user_id );

            int res = userInfoService.updateUserPw(pDTO);
            log.info("res : " + res);

            if (res == 1) {

                MailDTO rDTO = new MailDTO();
                rDTO.setToMail(user_email);
                log.info("email : " + user_email);
                rDTO.setTitle("######의 새비밀번호 전송!!!");
                rDTO.setContents("new password : " + newPW);
                log.info("newPW : " + newPW);

                int mailRes = mailService.doSendMail(rDTO);

                if (mailRes == 1) {
                    msg = "비밀 번호 변경 성공!";
                    icon = "success";
                    contents = "새 비밀번호를 이메일로 발송했습니다. 로그인 후 변경해주세요.";
                } else {
                    msg = "비밀 번호 변경 실패!";
                    icon = "warning";
                    contents = "변경된 비밀번호 발송에 실패했습니다. ####@naver.com 으로 문의해주세요.";
                }
                url = "login/find-id";

            } else if (res == 0) {
                msg = "정보를 다시 확인해주세요.";
                icon = "warning";
                contents = "정확한 정보를 입력해주세요!";
            }

        } catch (Exception e) {
            msg = "서버 오류입니다.";
            icon = "warning";
            contents = "서버 오류입니다 관리자에게 문의해주세요";
            log.info(e.toString());
            e.printStackTrace();
        }
        model.addAttribute("msg", msg);
        log.info(url);
        model.addAttribute("url", url);
        model.addAttribute("icon", icon);
        model.addAttribute("contents",contents);

        log.info(this.getClass().getName() + ".findPw end!");

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