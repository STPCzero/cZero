package kopo.poly.service;

import kopo.poly.dto.MarketDTO;
import kopo.poly.dto.UserInfoDTO;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface IMarketService {

    List<MarketDTO> getMarketList() throws Exception;

    @Transactional
    void insertMarketInfo(MarketDTO mDTO, UserInfoDTO uDTO) throws Exception;

    MarketDTO getMarketInfo(MarketDTO mDTO) throws Exception;

    void updateMarketInfo(MarketDTO mDTO, UserInfoDTO uDTO) throws Exception;

    void deleteMarketInfo(MarketDTO mDTO) throws Exception;
}
