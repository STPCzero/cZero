package kopo.poly.service;

import kopo.poly.dto.MailDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMailService {
    // 메일 발송
    int doSendMail(MailDTO pDTO);
}
