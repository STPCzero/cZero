package kopo.poly.persistance.mapper;

import kopo.poly.dto.UserInfoDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IUserInfoMapper {

    int insertUserInfo(UserInfoDTO uDTO) throws Exception;

    /* 중복체크 */
    UserInfoDTO getUserExists(UserInfoDTO uDTO) throws Exception;

    UserInfoDTO ChkUserInfo(UserInfoDTO uDTO);

    UserInfoDTO findUserId(UserInfoDTO uDTO);

    int updateUserPw(UserInfoDTO pDTO);
}
