package kopo.poly.service;

import kopo.poly.dto.NewsDTO;
import java.util.List;

public interface INewsService {
    // 크롤링한 뉴스 정보 넣기
    List<NewsDTO> InsertNews_Info() throws Exception;

}