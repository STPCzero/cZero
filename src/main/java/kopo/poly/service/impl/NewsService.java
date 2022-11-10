package kopo.poly.service.impl;

import kopo.poly.dto.NewsDTO;
import kopo.poly.persistance.mapper.INewsMapper;
import kopo.poly.service.INewsService;
import kopo.poly.util.CmmUtil;
import kopo.poly.util.DateUtil;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Iterator;
import java.util.List;

@Slf4j
@Service("NewsService")
public class NewsService implements INewsService {

    private final INewsMapper newsMapper;

    public NewsService(INewsMapper newsMapper){
        this.newsMapper = newsMapper;
    }

    @Transactional
    @Scheduled(cron = "0 0 * * * *")
    @Override
    public int InsertNews_Info() throws Exception{
        log.info(this.getClass().getName() + ".뉴스 저장 시작!!" );

        int res = 0;    // 크롤링 성공여부 숫자로 저장

        // 뉴스 가져올 주소
        String NewsUrl = "https://www.gihoo.or.kr/netzero/user/board/pressRelease/nv_carbonNtrlWordList.do";

        // 사이트 전체 html 소스 저장할 변수
        Document doc = null;

        // doc 에 NewsUrl 에 있는 html 다 넣기
        doc = Jsoup.connect(NewsUrl).get();

        // 전체 html 에서 select("")의 내용들 다 가져오기
        Elements elements = doc.select("td.title");

        NewsDTO nDTO = null;

        for (Element element : elements){
            nDTO = new NewsDTO(); // 수집한 데이터 저장할 DTO 메모리에 미리 올려두기

            String news_seq = element.select("td.num").text();
            log.info(news_seq);

            String news_title = element.select("div.main-txt").text();
            nDTO.setNews_title(news_title);
            log.info("제목 : " + nDTO.getNews_title());

            String news_department = element.select("div.sub-txt").text().split(" ")[0];
            nDTO.setNews_department(news_department);
            log.info("제목 : " + nDTO.getNews_department());

            String news_date = element.select("div.title__etc").text().split(" ")[0];
            nDTO.setNews_date(news_date);
            log.info("제목 : " + nDTO.getNews_date());

            String url = element.select("a").attr("onclick");
            String BasicUrl = "https://www.gihoo.or.kr/netzero/user/board/pressRelease/nv_carbonNtrlWordView.do?firstIndex=&currentPageNo=1&recordCountPerPage=10&bbscttId=게시글이동경로&bbsId=CRBNNTRLWORD&p_cntntsNm="; // 원본 url
            int IndexOfUrl = url.indexOf("BBSCTT");    // url 안에 위치 찾기
            String PostUrl = url.substring(IndexOfUrl,IndexOfUrl+17);  // 이동하려는 글 url 뽑아온 문자열
            String news_url = BasicUrl.replace("게시글이동경로",PostUrl);  // 원본 url 안에 게시글이동경로에 가려는 url 정보 넣기
            nDTO.setNews_url(news_url);
            log.info("제목 : " + nDTO.getNews_url());

            NewsDTO eDTO = newsMapper.getNewsExists(nDTO);

            if ( eDTO == null){   // 값이 제대로 못 넘어오면
                eDTO = new NewsDTO();   // 빈 것이라도 넣기
                log.info(news_title + " : 값이 제대로 안넘어와서 null 을 출력했습니다");

            }else if (CmmUtil.nvl(nDTO.getNews_exist()).equals('Y')){ // DB에 저장한 데이터가 있으면
                int result = newsMapper.insertNews_info(nDTO); // DB에 데이터 업데이트 해주기
                log.info(news_title + " : DB에 이미 데이터가 있어서 데이터 업데이트를 하였습니다 결과는 ~ " + result + "입니다.");
            }else {                                             // DB에 데이터가 없으면
                int result = newsMapper.insertNews_info(nDTO);  // DB에 데이터 저장해주기

                if (result > 0){
                    res = 1;
                }else {
                    res = 0;
                }
                log.info(news_title + " : DB에 데이터가 없어서 데이터 저장을 하였습니다 결과는 ~ " + res + "입니다.");
            }

        }
        log.info(this.getClass().getName() + ".뉴스 저장 끝!!" );
        return res;
    }

    @Override
    public List<NewsDTO> showNews() throws Exception {
        return null;
    }
}
