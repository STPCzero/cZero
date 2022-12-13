package kopo.poly.service;

import kopo.poly.dto.CheckDTO;
import kopo.poly.dto.MarketDTO;
import kopo.poly.dto.MypageDTO;

import java.util.List;

public interface IMypageService {
    MypageDTO getMypageInfo(MypageDTO myDTO) throws Exception;

    int getMyInfoModify(MypageDTO iDTO) throws Exception;

    List<MarketDTO> getMypageMarket(MypageDTO myDTO) throws Exception;

    int getMyMarketCount(MypageDTO mDTO) throws Exception;

    int myInfoChkPassword(MypageDTO myDTO) throws Exception;

    int myInfoWithdrawal(String sessionNo) throws Exception;

    List<CheckDTO> getCheckDays(int seq) throws Exception;

    int insertCheck(CheckDTO seq) throws Exception;

    int getTodayCheck(CheckDTO seq) throws Exception;
}
