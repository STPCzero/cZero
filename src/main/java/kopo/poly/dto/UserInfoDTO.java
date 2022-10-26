package kopo.poly.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserInfoDTO {
    private String user_seq;
    private String user_id;
    private String user_pw;
    private String check_pw;
    private String user_name;
    private String user_email;
    private String EXISTS_YN;

}
