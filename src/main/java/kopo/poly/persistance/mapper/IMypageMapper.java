package kopo.poly.persistance.mapper;

import kopo.poly.dto.MarketDTO;
import kopo.poly.dto.MypageDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IMypageMapper {

    MypageDTO getMypageInfo(MypageDTO myDTO) throws Exception;

    int getMyInfoModify(MypageDTO iDTO) throws Exception;

    List<MarketDTO> getMypageMarket(MypageDTO myDTO) throws Exception;

    int getMyMarketCount(MypageDTO iDTO) throws Exception;

    int myInfoChkPassword(MypageDTO myDTO) throws Exception;

    int myInfoWithdrawal(String sessionNo) throws Exception;
}
