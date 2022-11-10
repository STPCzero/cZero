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

        // hasNext 를 쓰기위한 Iterator 호출
        Iterator<Element> NewsIt = elements.iterator(); // 뉴스 목록
        
        NewsDTO nDTO = null;

        for (Element element : elements){
            nDTO = new NewsDTO(); // 수집한 데이터 저장할 DTO 메모리에 미리 올려두기

            nDTO.setCollect_time(DateUtil.getDateTime("yyyyMMddhhmm"));
            log.info("수집된 시간 : "+nDTO.getCollect_time());

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

            res = newsMapper.InsertNews_Info(nDTO);
        }

        /*while(NewsIt.hasNext()){

            String News = CmmUtil.nvl(NewsIt.next().text().trim()); // 글 가져오기
            String href = CmmUtil.nvl(NewsIt.next().html().trim()); // html 속성 가져오기

            log.info("가져온 글 전체 : \n" + News);
            log.info("가져온 코드 전체 : \n" + href);

            String[] STR = News.split(" "); // 띄어쓰기로 분리

            News = News.replace(STR[0], "");    // 뽑아온 데이터에서 부서 지우기
            News = News.replace(STR[STR.length-2], ""); // 뽑아온 데이터에서 날짜 지우기
            News = News.replace(STR[STR.length-1], ""); // 뽑아온 데이터에서 조회수 지우기
            News = News.trim(); // 띄어쓰기 지우기

            String BasicUrl = "https://www.gihoo.or.kr/netzero/user/board/pressRelease/nv_carbonNtrlWordView.do?firstIndex=&currentPageNo=1&recordCountPerPage=10&bbscttId=게시글이동경로&bbsId=CRBNNTRLWORD&p_cntntsNm="; // 원본 url
            int IndexOfUrl = href.indexOf("BBSCTT");    // url 안에 위치 찾기
            String PostUrl = href.substring(IndexOfUrl,IndexOfUrl+17);  // 이동하려는 글 url 뽑아온 문자열
            String url = BasicUrl.replace("게시글이동경로",PostUrl);  // 원본 url 안에 게시글이동경로에 가려는 url 정보 넣기

            nDTO.setNews_title(News);   // DTO 에 제목 넣기
            nDTO.setNews_department(STR[0]);    // DTO 에 부서 넣기
            nDTO.setNews_date(STR[STR.length-2]);   // DTO 에 날짜 넣기
            nDTO.setNews_url(url);

            log.info("이동 경로 : " + url);
            log.info("날짜 : " + nDTO.getNews_date());
            log.info("부 : " + nDTO.getNews_department());
            log.info("제목 : " + nDTO.getNews_title());

            res = newsMapper.InsertNews_Info(nDTO);
        }*/
        log.info(this.getClass().getName() + ".뉴스 저장 끝!!" );
        return res;
    }

    @Override
    public List<NewsDTO> showNews() throws Exception {
        return null;
    }
}
