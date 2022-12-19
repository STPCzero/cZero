package kopo.poly.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
public class UserInfoDTO {
    private String user_seq;
    private String user_id;
    private String user_pw;
    private String check_pw;
    private String user_name;
    private String user_email;
    private String user_type;
    private String EXISTS_YN;
    private int start;
    private int finish;

}
