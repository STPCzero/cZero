package kopo.poly.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NewsDTO {
    private String news_seq;
    private String news_title;
    private String news_department;
    private String news_date;
    private String news_url;

    private String news_exist;


}