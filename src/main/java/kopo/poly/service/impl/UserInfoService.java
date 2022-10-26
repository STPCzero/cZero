package kopo.poly.service.impl;

import kopo.poly.dto.UserInfoDTO;
import kopo.poly.persistance.mapper.IUserInfoMapper;
import kopo.poly.service.IUserInfoService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
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
    public UserInfoDTO findUserId(UserInfoDTO uDTO) throws Exception{
        log.info(this.getClass().getName() + ".findUserId start");

        if(uDTO ==null) {
            uDTO = new UserInfoDTO();
            log.info("DTO가 널값으로 넘어옴");
        }else {
            log.info("잘 넘어감");
        }
        UserInfoDTO rDTO= userInfoMapper.findUserId(uDTO);

        log.info(this.getClass().getName() + ".findUserId end");

        return rDTO;
    }

    @Override
    public int updateUserPw(UserInfoDTO pDTO) throws Exception{
        log.info(this.getClass().getName() + ".updateUserPw start");

        if(pDTO == null) {
            pDTO = new UserInfoDTO();
            log.info("DTO가 널값으로 넘어옴");
        }

        int res = userInfoMapper.updateUserPw(pDTO);

        log.info("res : " + res);

        log.info(this.getClass().getName() + ".updateUserPw end");

        return res;
    }

    @Override
    public UserInfoDTO ChkUserInfo(UserInfoDTO uDTO) throws Exception{
        log.info(this.getClass().getName()+".ChkUserInfo start!");
        UserInfoDTO iDTO = userInfoMapper.ChkUserInfo(uDTO);
        log.info(this.getClass().getName()+".ChkUserInfo end!");
        return iDTO;
    }

    @Override
    public UserInfoDTO getUserDetail(UserInfoDTO uDTO) throws Exception {
        log.info(this.getClass().getName()+".getUserDetail start!");
        UserInfoDTO iDTO = userInfoMapper.getUserDetail(uDTO);
        log.info(this.getClass().getName()+".getUserDetail end!");
        return iDTO;
    }

    @Override
    public int getUserUpdate(UserInfoDTO uDTO) throws Exception {
        log.info(this.getClass().getName()+".getUserUpdate start!");
        int res = userInfoMapper.getUserUpdate(uDTO);
        log.info(this.getClass().getName()+".getUserUpdate end!");
        return res;
    }
    @Override
    public UserInfoDTO getUserName(UserInfoDTO uDTO) throws Exception {
        return userInfoMapper.getUserName(uDTO);
    }
}
