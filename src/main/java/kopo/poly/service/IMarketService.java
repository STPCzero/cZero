package kopo.poly.service;

import kopo.poly.dto.MarketDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IMarketService {

    List<MarketDTO> getMarketList() throws Exception;

    void InsertMarketInfo(MarketDTO mDTO) throws Exception;

    MarketDTO getMarketInfo(MarketDTO mDTO) throws Exception;

    void updateMarketInfo(MarketDTO mDTO) throws Exception;

    void deleteMarketInfo(MarketDTO mDTO) throws Exception;
}
