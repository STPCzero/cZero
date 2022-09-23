package kopo.poly.service.impl;

import kopo.poly.dto.MarketDTO;
import kopo.poly.persistance.mapper.IMarketMapper;
import kopo.poly.service.IMarketService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Slf4j
@Service("MarketService")

public class MarketService implements IMarketService {

    private final IMarketMapper marketMapper;

    @Autowired
    public MarketService(IMarketMapper marketMapper) {

        this.marketMapper = marketMapper;
    }

    @Override
    public List<MarketDTO> getMarketList() throws Exception {
        return marketMapper.getMarketList();
    }

    @Transactional
    @Override
    public void InsertMarketInfo(MarketDTO mDTO) throws Exception {

        log.info(this.getClass().getName() + ".InsertMarketInfo start!");

        marketMapper.InsertMarketInfo(mDTO);
    }

    @Transactional
    @Override
    public MarketDTO getMarketInfo(MarketDTO mDTO) throws Exception {

        log.info(this.getClass().getName() + ".getMarketInfo start!");

        // 상세보기 할 때마다, 조회수 증가하기
        log.info("Update Read_CNT");
        marketMapper.updateMarketInfo(mDTO);

        return marketMapper.getMarketInfo(mDTO);
    }

    @Transactional
    @Override
    public void updateMarketInfo(MarketDTO mDTO) throws Exception {

        log.info(this.getClass().getName() + ".updateMarketInfo start!");

        marketMapper.updateMarketInfo(mDTO);
    }

    @Transactional
    @Override
    public void deleteMarketInfo(MarketDTO mDTO) throws Exception {

        log.info(this.getClass().getName() + ".deleteMarketInfo start!");

        marketMapper.deleteMarketInfo(mDTO);
    }
}
