package kopo.poly.controller;

import kopo.poly.dto.BicycleDTO;
import kopo.poly.dto.BicycleRowDTO;
import kopo.poly.service.IBicycleService;
import kopo.poly.service.IMailService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Slf4j
@RequestMapping("bicycle")
@Controller
public class BicycleController {

    @Resource(name = "BicycleService")
    private IBicycleService bicycleService;

    @GetMapping("bicycle")
    public String bicycle(HttpServletRequest request, Model model) throws Exception {
        log.info(this.getClass().getName() + ".bicycle Start!!");
        log.info(this.getClass().getName() + ".bicycle End!!");
        return "/bicycle/bicycle";
    }

    @GetMapping("getBicycle")
    public @ResponseBody BicycleDTO getBicycle(HttpServletRequest request) throws Exception {
        log.info(this.getClass().getName() + ".getBicycle Start!!!");

        String lat = CmmUtil.nvl(request.getParameter("lat"));
        String lon = CmmUtil.nvl(request.getParameter("lon"));
        log.info("lat : "+lat + " / lon : "+lon);

        BicycleDTO bDTO = new BicycleDTO();

        bDTO.setLat(lat);
        bDTO.setLon(lon);

        BicycleDTO biDTO = bicycleService.findBicycleInfo(bDTO);

        log.info(this.getClass().getName() + ".getBicycle End!!");
        return biDTO;
    }

    @GetMapping("getSearch")
    public @ResponseBody BicycleDTO getSearch(HttpServletRequest request) throws Exception {
        log.info(this.getClass().getName() + ".getSearch Start!!!");

        String keyword = CmmUtil.nvl(request.getParameter("searchWord"));
        log.info("keyword : "+keyword);

        BicycleDTO bDTO = new BicycleDTO();

        bDTO.setKeyword(keyword);

        //BicycleDTO biDTO = bicycleService.findBicycleInfo(bDTO);

        log.info(this.getClass().getName() + ".getSearch End!!");
        return null;
    }

}
