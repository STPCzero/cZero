package kopo.poly.controller;

import kopo.poly.dto.NewsDTO;
import kopo.poly.service.INewsService;
import kopo.poly.service.impl.NewsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Slf4j
@Controller
@RequestMapping(value = "news")
public class NewsController {

    @Resource(name = "NewsService")
    private INewsService newsService;   // InewsService 를 newsService에 담기

    /** news 페이지 가는 함수 */
    @RequestMapping("/news")
    public String showNews(ModelMap model) throws Exception{
        log.info(getClass().getName() + ".뉴스 Start!!!");

        List<NewsDTO> nList = newsService.showNews();   // service의 함수를 사용할 때 @Resource 안에서 만든 변수를 사용

        model.addAttribute("nList",nList);

        // 크롤링 결과 모델에 넣어주기

        log.info(getClass().getName() + ".뉴스 End!!!");
        return "/news/news";
    }
}