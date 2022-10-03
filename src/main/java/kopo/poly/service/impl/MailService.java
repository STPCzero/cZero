package kopo.poly.service.impl;

import kopo.poly.dto.MailDTO;
import kopo.poly.service.IMailService;
import kopo.poly.util.PrivateUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;

@Slf4j
@Service("MailService")
public class MailService implements IMailService {


    private final String mainEmailID = PrivateUtil.mainEmailID;
    private final String mainEmailPW = PrivateUtil.mainEmailPW;

    @Override
    public int doSendMail(MailDTO pDTO){

        log.info("메일 전송 시작");

        HtmlEmail email1 = new HtmlEmail();
        email1.setHostName("smtp.naver.com");
        email1.setSmtpPort(465);

        email1.setAuthentication(mainEmailID, mainEmailPW);

        email1.setSSLOnConnect(true);
        email1.setStartTLSEnabled(true);

        int res = 0;

        try{
            email1.setFrom(mainEmailID, "관리자", "utf-8"); //???
            email1.addTo(pDTO.getToMail(), "사용자", "utf-8"); //받는사람
            email1.setSubject(pDTO.getTitle()); //제목




            email1.setHtmlMsg(pDTO.getContents());  //내용
            email1.send();
            res = 1;
        } catch (EmailException e) {
            e.printStackTrace();
        }

        log.info("메일 전송 완료");
        return  res;
    }
}