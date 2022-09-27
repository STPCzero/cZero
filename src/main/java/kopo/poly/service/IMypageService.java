package kopo.poly.service;

import kopo.poly.dto.MypageDTO;

public interface IMypageService {
    MypageDTO getMypageInfo(MypageDTO myDTO) throws Exception;

    int getMyInfoModify(MypageDTO iDTO) throws Exception;
}
