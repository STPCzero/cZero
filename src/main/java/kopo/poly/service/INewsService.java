package kopo.poly.service;


import kopo.poly.dto.NewsDTO;

import java.util.List;

public interface INewsService {
    // 뉴스 정보 가져오기
    List<NewsDTO> showNews() throws Exception;
}
