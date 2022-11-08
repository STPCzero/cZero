package kopo.poly.service;

import kopo.poly.dto.UserInfoDTO;

import java.util.List;

public interface IAdminService {
    List<UserInfoDTO> getMembersInfo(UserInfoDTO uDTO)throws Exception;
}
