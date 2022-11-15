package kopo.poly.service;

import kopo.poly.dto.MarketDTO;
import kopo.poly.dto.UserInfoDTO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface IMarketService {

    List<MarketDTO> getMarketList() throws Exception;

    @Transactional
    void InsertMarketInfo(MarketDTO mDTO) throws Exception;

    MarketDTO getMarketInfo(MarketDTO mDTO) throws Exception;

    @Transactional
    void updateMarketInfo(MarketDTO mDTO) throws Exception;

    void deleteMarketInfo(MarketDTO mDTO) throws Exception;


}
