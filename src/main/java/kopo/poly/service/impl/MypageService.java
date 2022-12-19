package kopo.poly.service.impl;

import kopo.poly.dto.CheckDTO;
import kopo.poly.dto.MarketDTO;
import kopo.poly.dto.MypageDTO;
import kopo.poly.persistance.mapper.IMypageMapper;
import kopo.poly.service.IMypageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Slf4j
@Service("MypageService")
public class MypageService implements IMypageService {

    private final IMypageMapper mypageMapper;

    @Autowired
    public MypageService(IMypageMapper mypageMapper){
        this.mypageMapper = mypageMapper;
    }

    @Override
    public MypageDTO getMypageInfo(MypageDTO myDTO) throws Exception {
        log.info(this.getClass().getName()+".getMypageInfo Start!!");
        MypageDTO mDTO = mypageMapper.getMypageInfo(myDTO);
        log.info(this.getClass().getName()+".getMypageInfo End!!");
        return mDTO;
    }

    @Override
    public int getMyInfoModify(MypageDTO iDTO) throws Exception {
        log.info(this.getClass().getName()+".getMyInfoModify Start!!");
        int res = mypageMapper.getMyInfoModify(iDTO);
        log.info(this.getClass().getName()+".getMyInfoModify End!!");
        return res;
    }

    @Override
    public List<MarketDTO> getMypageMarket(MypageDTO myDTO) throws Exception {
        log.info(this.getClass().getName()+".getMypageMarket Start!!");
        List<MarketDTO> mkList = mypageMapper.getMypageMarket(myDTO);
        log.info(this.getClass().getName()+".getMypageMarket End!!");
        return mkList;
    }

    @Override
    public int getMyMarketCount(MypageDTO mDTO) throws Exception {
        log.info(this.getClass().getName()+".getMyMarketCount Start!!");
        int res = mypageMapper.getMyMarketCount(mDTO);
        log.info(this.getClass().getName()+".getMyMarketCount End!!");
        return res;
    }

    @Override
    public int myInfoChkPassword(MypageDTO myDTO) throws Exception {
        log.info(this.getClass().getName()+".myInfoChkPassword Start!!");
        int res = mypageMapper.myInfoChkPassword(myDTO);
        log.info(this.getClass().getName()+".myInfoChkPassword End!!");
        return res;
    }

    @Override
    public int myInfoWithdrawal(String sessionNo) throws Exception {
        log.info(this.getClass().getName()+".myInfoWithdrawal Start!!");
        int res = mypageMapper.myInfoWithdrawal(sessionNo);
        log.info(this.getClass().getName()+".myInfoWithdrawal End!!");
        return res;
    }

    @Override
    public List<CheckDTO> getCheckDays(int seq) throws Exception {
        log.info(this.getClass().getName()+".getCheckDays Start!!");
        List<CheckDTO> cDTO = mypageMapper.getCheckDays(seq);
        log.info(this.getClass().getName()+".getCheckDays End!!");
        return cDTO;
    }

    @Override
    public int insertCheck(CheckDTO seq) throws Exception {
        log.info(this.getClass().getName()+".insertCheck Start!!");
        log.info("chkchk:"+seq.getChk_date());
        int res = mypageMapper.insertCheck(seq);
        log.info(this.getClass().getName()+".insertCheck End!!");
        return res;
    }

    @Override
    public int getTodayCheck(CheckDTO seq) throws Exception {
        log.info(this.getClass().getName()+".getTodayCheck Start!!");
        int res = mypageMapper.getTodayCheck(seq);
        log.info("출석여부 res : "+res);
        log.info(this.getClass().getName()+".getTodayCheck End!!");
        return res;
    }
}
