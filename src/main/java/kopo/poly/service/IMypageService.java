package kopo.poly.service;

import kopo.poly.dto.MarketDTO;
import kopo.poly.dto.MypageDTO;

import java.util.List;

public interface IMypageService {
    MypageDTO getMypageInfo(MypageDTO myDTO) throws Exception;

    int getMyInfoModify(MypageDTO iDTO) throws Exception;

    List<MarketDTO> getMypageMarket(MypageDTO myDTO) throws Exception;

    int getMyMarketCount(MypageDTO mDTO) throws Exception;
}
