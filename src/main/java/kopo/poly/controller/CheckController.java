package kopo.poly.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class CheckController {

    /** 체크리스트 페이지 가는 함수 */
    @GetMapping("/checklist/checklist")
    public String checkList() {
        log.info(getClass().getName() + " checkList Start!!!");
        log.info(getClass().getName() + " checkList End!!!");
        return "/checklist/checklist123";
    }
}