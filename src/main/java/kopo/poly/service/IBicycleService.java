package kopo.poly.service;

import kopo.poly.dto.BicycleDTO;

public interface IBicycleService {

    BicycleDTO findBicycleInfo(BicycleDTO bDTO) throws Exception;
}
