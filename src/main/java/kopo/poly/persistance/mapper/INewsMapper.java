package kopo.poly.persistance.mapper;

import kopo.poly.dto.NewsDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface INewsMapper {
    // 수집한 News DB 에 등록
    int insertNews_info(NewsDTO nDTO) throws Exception;

    // 수집한 News 중복체크
    NewsDTO getNewsExists(NewsDTO nDTO) throws Exception;

    // 중복된 News 업데이트
    int updateNews_Info(NewsDTO nDTO) throws Exception;
}
