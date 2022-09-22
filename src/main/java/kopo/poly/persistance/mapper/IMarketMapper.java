package kopo.poly.persistance.mapper;

import kopo.poly.dto.MarketDTO;
import kopo.poly.dto.NoticeDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IMarketMapper {

    // 상품 리스트
    List<MarketDTO> getMarketList() throws Exception;

    // 상품 글 등록
    void InsertMarketInfo(NoticeDTO mDTO) throws Exception;

    // 상품 상세보기
    MarketDTO getMarketInfo(MarketDTO mDTO) throws Exception;

    // 상품 조회수 업데이트
    void updateMarketReadCnt(NoticeDTO mDTO) throws Exception;

    //게시판 글 수정
    void updateMarketInfo(NoticeDTO mDTO) throws Exception;

    // 게시판 글 삭제
    void deleteMarketReadCnt(NoticeDTO mDTO) throws Exception;
}
