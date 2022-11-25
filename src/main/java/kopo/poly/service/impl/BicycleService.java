package kopo.poly.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import kopo.poly.dto.BicycleDTO;
import kopo.poly.dto.BicycleRowDTO;
import kopo.poly.service.IBicycleService;
import kopo.poly.util.CmmUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.*;

@Slf4j
@Service("BicycleService")
public class BicycleService implements IBicycleService {

    @Override
    public BicycleDTO findBicycleInfo(BicycleDTO bDTO) throws Exception {
        log.info(this.getClass().getName()+".findBicycleInfo Start!!");

        StringBuilder sb = new StringBuilder();

        String[] start = {"1", "1001", "2001"};
        String[] finish = {"1000", "2000", "3000"};

        for (int i = 0; i < 3; i++) {
            StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088"); /*URL*/
            urlBuilder.append("/" +  URLEncoder.encode("597a527a7168796537374a76444a58","UTF-8") ); /*인증키 (sample사용시에는 호출시 제한됩니다.)*/
            urlBuilder.append("/" +  URLEncoder.encode("json","UTF-8") ); /*요청파일타입 (xml,xmlf,xls,json) */
            urlBuilder.append("/" + URLEncoder.encode("bikeList","UTF-8")); /*서비스명 (대소문자 구분 필수입니다.)*/
            urlBuilder.append("/" + URLEncoder.encode(start[i],"UTF-8")); /*요청시작위치 (sample인증키 사용시 5이내 숫자)*/
            urlBuilder.append("/" + URLEncoder.encode(finish[i],"UTF-8")); /*요청종료위치(sample인증키 사용시 5이상 숫자 선택 안 됨)*/
            // 상위 5개는 필수적으로 순서바꾸지 않고 호출해야 합니다.
            URL url = new URL(urlBuilder.toString());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-type", "application/json");
            System.out.println("Response code: " + conn.getResponseCode()); /* 연결 자체에 대한 확인이 필요하므로 추가합니다.*/
            BufferedReader rd;

            // 서비스코드가 정상이면 200~300사이의 숫자가 나옵니다.
            if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }

            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line);
            }
            rd.close();
            conn.disconnect();
        }
        Map<String, Object> rMap = new ObjectMapper().readValue(sb.toString(), LinkedHashMap.class);
        Map<String, Object> rentBikeStatus = (Map<String, Object>) rMap.get("rentBikeStatus");

        List<Map<String, Object>> rowList = (List<Map<String, Object>>) rentBikeStatus.get("row");

        List<BicycleRowDTO> pList = new LinkedList<>();

        /**
         현재 좌표 값, API가 주는 좌표 값 비교하여
         3km 이내 거리의 값만 담을 예정
        * */

        double lat1 = Double.parseDouble(bDTO.getLat()); // 현재 내 위도
        double lon1 = Double.parseDouble(bDTO.getLon()); // 현재 내 경도

        for (Map<String, Object> rowMap : rowList) {
            String rackTotCnt = CmmUtil.nvl((String) rowMap.get("rackTotCnt")); // 거치대 개수
            String parkingBikeTotCnt = CmmUtil.nvl((String) rowMap.get("parkingBikeTotCnt")); // 실시간 자전거 개수
            String stationName = CmmUtil.nvl((String) rowMap.get("stationName"));
            String stationLatitude = CmmUtil.nvl((String) rowMap.get("stationLatitude"));
            String stationLongitude = CmmUtil.nvl((String) rowMap.get("stationLongitude"));


            /** 거리 구하기 start */
            double lat2 = Double.parseDouble(stationLatitude); // API 위도
            double lon2 = Double.parseDouble(stationLongitude); // API 경도

            double theta = lon1 - lon2;
            double dist = Math.sin(Math.toRadians(lat1)) * Math.sin(Math.toRadians(lat2)) + Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) * Math.cos(Math.toRadians(theta));
            dist = Math.acos(dist);
            dist = Math.toDegrees(dist);
            dist = dist * 60 * 1.1515;
            dist = dist * 1.609344;
            if(dist < 3) {
                /* 마커에 찍기 위해 DTO에 담기 */
                BicycleRowDTO brDTO = new BicycleRowDTO();
                brDTO.setRackTotCnt(rackTotCnt);
                brDTO.setParkingBikeTotCnt(parkingBikeTotCnt);
                brDTO.setStationName(stationName);
                brDTO.setStationLatitude(stationLatitude);
                brDTO.setStationLongitude(stationLongitude);

                // m로 변환
                double distM = dist*1000;
                brDTO.setDistance((int) distM);

                log.info("--------------------");
                log.info("stationName: "+stationName);
                log.info("dist: "+dist);
                log.info("parkingBikeTotCnt: "+parkingBikeTotCnt);
                log.info("rackTotCnt: "+rackTotCnt);
                log.info("--------------------");
                pList.add(brDTO);
                brDTO = null;
            }
            /* 거리 구하기 end */
        }

        /** 거리순 정렬 */
        // 점수(Double) 오름차순
        Collections.sort(pList, new Comparator<BicycleRowDTO>() {
            @Override
            public int compare(BicycleRowDTO o1, BicycleRowDTO o2) {
                Integer score1 = o1.getDistance();
                Integer score2 = o2.getDistance();
                return score1.compareTo(score2);
            }
        });

        BicycleDTO biDTO = new BicycleDTO();

        biDTO.setLat(bDTO.getLat());
        biDTO.setLon(bDTO.getLon());
        biDTO.setBicycleList(pList);

        log.info(this.getClass().getName()+".findBicycleInfo End!!");
        return biDTO;
    }
}
