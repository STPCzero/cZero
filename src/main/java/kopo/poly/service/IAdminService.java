package kopo.poly.service;

import kopo.poly.dto.MarketDTO;
import kopo.poly.dto.UserInfoDTO;

import java.util.List;

public interface IAdminService {
    List<UserInfoDTO> getMembersInfo(UserInfoDTO uDTO)throws Exception;

    int getMembersCount(UserInfoDTO uDTO) throws Exception;

    List<MarketDTO> getMarketInfo(MarketDTO mDTO) throws Exception;

    int getMarketCount() throws Exception;
}
