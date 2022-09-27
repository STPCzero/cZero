package kopo.poly.service.impl;

import kopo.poly.dto.MypageDTO;
import kopo.poly.persistance.mapper.IMypageMapper;
import kopo.poly.service.IMypageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
