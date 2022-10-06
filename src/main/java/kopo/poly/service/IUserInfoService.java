package kopo.poly.service;

import kopo.poly.dto.UserInfoDTO;

public interface IUserInfoService {

    int insertUserInfo(UserInfoDTO uDTO) throws Exception;

    UserInfoDTO findUserId(UserInfoDTO uDTO) throws Exception;

    int updateUserPw(UserInfoDTO pDTO) throws Exception;

    UserInfoDTO ChkUserInfo(UserInfoDTO uDTO) throws Exception;
}
