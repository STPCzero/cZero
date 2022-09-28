package kopo.poly.service.impl;

import kopo.poly.dto.UserInfoDTO;
import kopo.poly.persistance.mapper.IUserInfoMapper;
import kopo.poly.service.IUserInfoService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service("UserInfoService")

public class UserInfoService implements IUserInfoService {

    private final IUserInfoMapper userInfoMapper;


    public UserInfoService(IUserInfoMapper userInfoMapper) {
        this.userInfoMapper = userInfoMapper;
    }

    @Override
    public int insertUserInfo(UserInfoDTO uDTO) throws Exception {

        int res = 0;

        if (uDTO == null) {
            uDTO = new UserInfoDTO();
        }

        /* 중복 방지 */
        UserInfoDTO rDTO = userInfoMapper.getUserExists(uDTO);

        if (rDTO == null) {
            rDTO = new UserInfoDTO();
        }
        log.info("=======> "+CmmUtil.nvl(rDTO.getEXISTS_YN()));
        if(CmmUtil.nvl(rDTO.getEXISTS_YN()).equals("Y")){
            res = 2;
        } else {
            int success = userInfoMapper.insertUserInfo(uDTO);

            if (success > 0) {
                res = 1;
            } else {
                res = 0;
            }
        }

        return res;
    }

    @Override
    public int getUserLoginCheck(UserInfoDTO uDTO) throws Exception {
        return 0;
    }
}
