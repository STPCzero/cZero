package kopo.poly.service.impl;

import kopo.poly.dto.UserInfoDTO;
import kopo.poly.persistance.mapper.IAdminMapper;
import kopo.poly.service.IAdminService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service("AdminService")
public class AdminService implements IAdminService {

    private final IAdminMapper adminMapper;

    @Autowired
    public AdminService(IAdminMapper adminMapper) { this.adminMapper = adminMapper; }

    @Override
    public List<UserInfoDTO> getMembersInfo(UserInfoDTO uDTO) throws Exception {
        log.info(getClass().getName() + " getMembersInfo Start!!!");
        List<UserInfoDTO> rList = adminMapper.getMembersInfo(uDTO);
        log.info(getClass().getName() + " getMembersInfo End!!!");
        return rList;
    }

    @Override
    public int getMembersCount() throws Exception {
        log.info(getClass().getName() + " getMembersCount Start!!!");
        int res = adminMapper.getMembersCount();
        return res;
    }
}
