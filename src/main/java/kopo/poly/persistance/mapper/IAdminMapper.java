package kopo.poly.persistance.mapper;

import kopo.poly.dto.MarketDTO;
import kopo.poly.dto.UserInfoDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IAdminMapper {
    List<UserInfoDTO> getMembersInfo(UserInfoDTO uDTO) throws Exception;

    int getMembersCount(UserInfoDTO uDTO) throws Exception;

    int getMarketCount() throws Exception;

    List<MarketDTO> getMarketInfo(MarketDTO mDTO) throws Exception;
}
