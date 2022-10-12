package kopo.poly.service.impl;

import kopo.poly.dto.MarketDTO;
import kopo.poly.dto.MypageDTO;
import kopo.poly.persistance.mapper.IMypageMapper;
import kopo.poly.service.IMypageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
}
