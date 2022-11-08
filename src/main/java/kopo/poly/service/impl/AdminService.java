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
    public List<UserInfoDTO> geMembersInfo(UserInfoDTO uDTO) throws Exception {
        log.info(getClass().getName() + " geMembersInfo Start!!!");
        List<UserInfoDTO> rList = adminMapper.geMembersInfo(uDTO);
        log.info(getClass().getName() + " geMembersInfo End!!!");
        return rList;
    }
}
