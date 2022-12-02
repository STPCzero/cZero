package kopo.poly.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import kopo.poly.dto.ReplyVO;
import kopo.poly.service.IReplyService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONArray;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RequestMapping("/replies")
@RestController
@Slf4j
@AllArgsConstructor
public class ReplyController {


    private IReplyService service;
    @ResponseBody
    @PostMapping(value = "/new")
    public void create(String replyer, String bno, String reply) throws Exception {

        log.info("왜안들어와");
        ReplyVO vo = new ReplyVO();

        vo.setReply(reply);
        vo.setReplyer(replyer);
        vo.setBno(bno);

        service.register(vo);


    }

    @ResponseBody
    @GetMapping(value = "/reply")
    public Object getReplyList(String bno) throws Exception {

        log.info("오긴하지 + "+bno);
        List<ReplyVO> rList = service.read(bno);
        log.info(rList.toString());
        JSONArray jsonArray = new JSONArray();
        ObjectMapper objectMapper = new ObjectMapper();
        for(ReplyVO vo : rList){
            jsonArray.put(objectMapper.writeValueAsString(vo));

        }
        return jsonArray.toString();

    }

}

