package kopo.poly.service.impl;

import kopo.poly.dto.NewsDTO;
import kopo.poly.service.INewsService;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service("NewsService")
public class NewsService implements INewsService {

    /**
     * DB에 탄소중립 소식 크롤링한 결과 저장하기
     */
    @Override
    public List<NewsDTO> InsertNews_Info() throws Exception {
        log.info(this.getClass().getName() + ".뉴스 저장 시작!!");

        String[] str = {
                "https://www.google.com/search?q=탄소중립+뉴스&sxsrf=ALiCzsai04-5qNMIZPXm4fuv1qFoP5EsvA:1668563949506&source=lnms&tbm=nws&sa=X&ved=2ahUKEwj86fqLzbH7AhVQz2EKHfz_Ba8Q_AUoAXoECAEQAw&biw=1920&bih=969&dpr=1",   // 구글 주소
                "3",    //  가져오는 게시물 개수
                "div.SoaBEf", // 전체 html
                "구글",// 사이트
                "div.CEMjEf.NUnG9d",    // 부서
                "div.mCBkyc.ynAwRc.MBeuO.nDgy9d",   // 제목
                "div.GI74Re.nDgy9d",    // 내용
                "div.OSrXXb.ZE0LJd.YsWzw", // 날짜
                "a.WlydOe", // url

                "https://search.naver.com/search.naver?where=news&query=%ED%83%84%EC%86%8C%EC%A4%91%EB%A6%BD%20%EB%89%B4%EC%8A%A4&sm=tab_opt&sort=0&photo=0&field=0&pd=0&ds=&de=&docid=&related=0&mynews=0&office_type=0&office_section_code=0&news_office_checked=&nso=so%3Ar%2Cp%3Aall&is_sug_officeid=0", // 네이버 주소
                "3",    //  가져오는 게시물 개수
                "div.news_area",    // 전체 html
                "네이버",// 사이트
                "a.info.press",     // 부서
                "a.news_tit",   // 제목
                "a.api_txt_lines.dsc_txt_wrap",    // 내용
                "span.info", // 날짜
                "a.news_tit", // url

                "https://www.gihoo.or.kr/netzero/user/board/pressRelease/nv_carbonNtrlNewsList.do", // 2050탄소중립포털 탄소중립뉴스 주소
                "5",    //  가져오는 게시물 개수
                "tbody tr", // 전체 html
                "탄소중립뉴스",// 사이트
                "div.sub-txt",  // 부서
                "div.main-txt", // 제목
                " ",    // 내용
                "td.date", // 날짜
                "a.link-cell.ellipsis-txt.tooltip-target", // url

                "https://www.gihoo.or.kr/netzero/user/board/pressRelease/nv_carbonNtrlWordList.do", // 2050탄소중립포털 탄소중립소식 소식
                "5",    //  가져오는 게시물 개수
                "tbody tr", // 전체 html
                "탄소중립소식",   // 사이트
                "div.sub-txt",  // 부서
                "div.main-txt", // 제목
                " ",    // 내용
                "td.date", // 날짜
        };

        List<NewsDTO> nList = new ArrayList<>();

        for (int i = 0; i < 28; i += 9) {   // 사이트 개수만큼 돌리기

            // 뉴스 가져올 주소
            String NewsUrl = str[i];

            int cnt = Integer.parseInt(str[i+1]);    // 내부 for문 반복 횟수
            log.info("반복 횟수 : " + cnt);
            int f = 0;  // 반복횟수

            // 사이트 전체 html 소스 저장할 변수
            Document doc = null;

            // doc 에 NewsUrl 에 있는 html 다 넣기
            doc = Jsoup.connect(NewsUrl).get();

            // 전체 html 에서 select("")의 내용들 다 가져오기
            Elements elements = doc.select(str[i+2]);

            NewsDTO nDTO = null;

            for (Element element : elements) {
                nDTO = new NewsDTO(); // 수집한 데이터 저장할 DTO 메모리에 미리 올려두기

                String site = str[i+3];
                nDTO.setNews_site(site);
                log.info(nDTO.getNews_site()+ "의 "+ (f+1) + "번째 게시글입니다");

                String news_department = element.select(str[i+4]).text().split(" ")[0];
                nDTO.setNews_department(news_department);
                log.info("부서 : " + nDTO.getNews_department());

                String news_title = element.select(str[i+5]).text();
                nDTO.setNews_title(news_title);
                log.info("제목 : " + nDTO.getNews_title());

                if (i < 10){    // 구글과 네이버는 contents가 있다
                    String contents = element.select(str[i+6]).text();
                    nDTO.setNews_contents(contents);
                    log.info("contents : " + nDTO.getNews_contents());
                }else{  // 탄소 중립 뉴스, 소식은 contents가 공백
                    String contents = str[i+6];
                    nDTO.setNews_contents(contents);
                    log.info("contents : " + nDTO.getNews_contents());
                }

                String news_date = element.select(str[i+7]).text();
                nDTO.setNews_date(news_date);
                log.info("날짜 : " + nDTO.getNews_date());

                if (i != 27){
                    String url = element.select(str[i+8]).attr("href");
                    nDTO.setNews_url(url);
                    log.info("url : " + nDTO.getNews_url());

                }else { // 탄소중립 소식일 때
                    String url = element.select("a").attr("onclick");
                    String BasicUrl = "https://www.gihoo.or.kr/netzero/user/board/pressRelease/nv_carbonNtrlWordView.do?firstIndex=&currentPageNo=1&recordCountPerPage=10&bbscttId=게시글이동경로&bbsId=CRBNNTRLWORD&p_cntntsNm="; // 원본 url
                    int IndexOfUrl = url.indexOf("BBSCTT");    // url 안에 위치 찾기
                    String PostUrl = url.substring(IndexOfUrl, IndexOfUrl + 17);  // 이동하려는 글 url 뽑아온 문자열
                    String news_url = BasicUrl.replace("게시글이동경로", PostUrl);  // 원본 url 안에 게시글이동경로에 가려는 url 정보 넣기
                    nDTO.setNews_url(news_url);
                    log.info("url : " + nDTO.getNews_url());
                }

                nList.add(nDTO);

                f++;
                if ( f == cnt) break;
            }
        }
        log.info(this.getClass().getName() + ".뉴스 저장 끝!!");
        return nList;
    }


//    /** DB에 저장된 데이터 뽑아오기 */
//    @Override
//    public List<NewsDTO> showNews() throws Exception {
//        return null;
//    }
}
