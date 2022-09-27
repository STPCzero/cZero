package kopo.poly.persistance.mapper;

import kopo.poly.dto.MypageDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMypageMapper {

    MypageDTO getMypageInfo(MypageDTO myDTO) throws Exception;
}
