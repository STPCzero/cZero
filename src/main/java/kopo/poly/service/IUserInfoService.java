package kopo.poly.service;

import kopo.poly.dto.UserInfoDTO;

public interface IUserInfoService {

    int insertUserInfo(UserInfoDTO uDTO) throws Exception;

    /* 아이디 비밀번호 일치하는지 확인 */
    int getUserLoginCheck(UserInfoDTO uDTO) throws Exception;
}
