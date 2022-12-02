package kopo.poly.service.impl;

import com.jayway.jsonpath.Criteria;
import kopo.poly.dto.ReplyVO;
import kopo.poly.persistance.mapper.IReplyMapper;
import kopo.poly.service.IReplyService;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class ReplyService implements IReplyService {

    @Setter(onMethod_ = @Autowired)
    private IReplyMapper mapper;

    @Override
    public int register(ReplyVO vo) throws Exception {
        log.info("register......" );
        vo.setRrno(String.valueOf(mapper.getTotal(vo)));
        vo.setDerno("0");
        log.info("INSERT......" + vo);
        return mapper.insert(vo);
    }

    @Override
    public List<ReplyVO> read(String rno) throws Exception {
        log.info("get......" + rno);
        return mapper.read(rno);
    }

    @Override
    public int modify(ReplyVO vo) {
        log.info("modify......" + vo);
        return mapper.update(vo);
    }

    @Override
    public int remove(Long rno) {
        log.info("remove......" + rno);
        return mapper.delete(rno);
    }

    @Override
    public List<ReplyVO> getList(Criteria cri, Long bno) {
        log.info("get Reply List of a Board " + bno);
        return mapper.getListWithPaging(cri, bno);
    }
}
