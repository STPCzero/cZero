package kopo.poly.service;

import kopo.poly.dto.NewsDTO;
import java.util.List;

public interface INewsService {
    // 크롤링한 뉴스 정보 넣기
    int InsertNews_Info() throws Exception;

    // 뉴스 정보 가져오기
    List<NewsDTO> showNews() throws Exception;
}
