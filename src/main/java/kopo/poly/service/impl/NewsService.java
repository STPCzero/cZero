package kopo.poly.service.impl;

import kopo.poly.dto.NewsDTO;
import kopo.poly.service.INewsService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

@Slf4j
@Service("NewsService")
public class NewsService implements INewsService {

    @Transactional
    //@Scheduled(cron = "* 10 * * * *")
    @Override
    public List<NewsDTO> showNews() throws Exception{
        log.info(this.getClass().getName() + ".선수입장!!" );

        int res = 0;    // 크롤링 성공여부 숫자로 저장

        // 뉴스 가져올 주소
        String url = "https://www.gihoo.or.kr/netzero/user/board/pressRelease/nv_carbonNtrlWordList.do?firstIndex=&currentPageNo=1&recordCountPerPage=10&bbscttId=&bbsId=CRBNNTRLWORD&p_cntntsNm=";

        // 사이트 전체 html 소스 저장할 변수
        Document doc = null;

        // doc 에 url 에 있는 html 다 넣기
        doc = Jsoup.connect(url).get();

        // 전체 html 에서 select("")의 내용들 다 가져오기
        Elements element = doc.select("td.title");
        
        // hasNext 를 쓰기위한 Iterator 호출
        Iterator<Element> NewsIt = element.iterator(); // 뉴스 목록

        NewsDTO nDTO = null;

        List<NewsDTO> nList = new ArrayList<>();
        int idx = 0;

        while(NewsIt.hasNext()){

            // 반복횟수 카운팅, 10번하기

            if (idx++ > 10){
                break;
            }else if (idx == 0){
                continue;
            }

            nDTO = new NewsDTO(); // 수집한 데이터 저장할 DTO 메모리에 미리 올려두기

            String News = CmmUtil.nvl(NewsIt.next().text().trim());
            log.info("수집된 뉴스 : " + News);

            String[] STR = News.split(" "); // 띄어쓰기로 분리

            News = News.replace(STR[0], "");    // 뽑아온 데이터에서 부서 지우기
            News = News.replace(STR[STR.length-2], ""); // 뽑아온 데이터에서 날짜 지우기
            News = News.replace(STR[STR.length-1], ""); // 뽑아온 데이터에서 조회수 지우기
            News = News.trim(); // 띄어쓰기 지우기

            nDTO.setNews_title(News);
            nDTO.setNews_Department(STR[0]);    // DTO에 부서 넣기
            nDTO.setNews_date(STR[STR.length-2]);   // DTO에 날짜 넣기

            log.info("날짜 : " + nDTO.getNews_date());
            log.info("부 : " + nDTO.getNews_Department());
            log.info("제목 : " + nDTO.getNews_title());

            nList.add(nDTO);
        }
        log.info(this.getClass().getName() + ".선수퇴장!!" );
        return nList;
    }
}
