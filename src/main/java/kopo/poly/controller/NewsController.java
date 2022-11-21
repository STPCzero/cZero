package kopo.poly.controller;

import kopo.poly.dto.NewsDTO;
import kopo.poly.service.INewsService;
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

    /** 뉴스 수집하기 **/
    @RequestMapping("/news")
    public String showNews(ModelMap model) throws Exception{
        log.info(getClass().getName() + ".뉴스 Start!!!");

        List<NewsDTO> nList = newsService.InsertNews_Info();

        model.addAttribute("nList", nList);

        log.info(getClass().getName() + ".뉴스 End!!!");
        return "/news/news";
    }
}