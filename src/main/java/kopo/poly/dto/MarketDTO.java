package kopo.poly.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MarketDTO {
    private int mk_seq;
    private String notice_yn;
    private String user_seq;
    private int update_seq;
    private String title;
    private String contents;
    private String mk_date;
    private String update_date;
    private int price;
    private int read_cnt;
    private String thumbnail;
    private String user_name; // 관리자에서 씀

    private int start;
    private int finish;

}
