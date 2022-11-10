package kopo.poly.persistance.mapper;

import kopo.poly.dto.NewsDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface INewsMapper {
    // 수집한 News DB 에 등록
    int InsertNews_Info(NewsDTO nDTO) throws Exception;
}
