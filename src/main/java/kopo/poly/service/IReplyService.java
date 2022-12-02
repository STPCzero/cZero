package kopo.poly.service;

import com.jayway.jsonpath.Criteria;
import kopo.poly.dto.ReplyVO;

import java.util.List;

public interface IReplyService {

    public int register(ReplyVO vo) throws Exception;
    public List<ReplyVO> read(String rno) throws Exception;
    public int modify(ReplyVO vo);
    public int remove(Long rno);
    public List<ReplyVO> getList(Criteria cri, Long bno);

}
