package kopo.poly.persistance.mapper;

import com.jayway.jsonpath.Criteria;
import kopo.poly.dto.ReplyVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface IReplyMapper {

    //등록
    public int insert(ReplyVO vo);

    // 조회
    public List<ReplyVO> read(String bno);

    //삭제
    public int delete (Long bno);

    //수정
    public int update(ReplyVO reply);

    public List<ReplyVO> getListWithPaging (
            @Param("cri") Criteria cri,
            @Param("bno") Long bno);

    public int getTotal(ReplyVO vo);
}
