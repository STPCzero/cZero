<%@ page import="jdk.nashorn.internal.scripts.JS" %>
<%@ page import="kopo.poly.dto.MypageDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.MarketDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kopo.poly.dto.BicycleRowDTO" %>
<%@ page import="kopo.poly.dto.BicycleDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String sessionNo = (String) session.getAttribute("sessionNo");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="">

    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:200,300,400,500,600,700" rel="stylesheet">
    <script src="../js/jquery-.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/anim.js"></script>
    <%--    <script type="text/javascript" src="../js/paging.js"></script>--%>
    <script type="text/javascript">
    </script>

    <!-- search -->
    <style>
        /* store */
        a {
        text-decoration : none;
        }
        .store_map{
            overflow: hidden;
            position: relative;
            top: 0;
            left: 0;
            height: 750px;
        }
        .store_box{
            position: absolute;
            top: 20px;
            bottom: 20px;
            right: 50%;
            width: 360px;
            margin-right: 200px;
            padding: 0 30px 0 30px;
            background: rgb(255,255,255);
            z-index: 1
        }
        .store_box .title_area{
            overflow: hidden;
            padding-top: 40px;
            margin-bottom: 35px;
            font-family: 'NanumBarunGothic';
        }
        .store_box .title_area > h2{
            float: left;
            font-size: 24px;
            color: rgb(47,28,17);
            font-weight:normal;
        }
        .store_box .title_area .btn_box{float: right}
        .store_box .title_area .btn_box a{
            float: left;
            display: block;
            width: 80px;
            padding-left: 15px;
            height: 40px;
            line-height: 40px;
            font-size: 12px;
        }
        .store_box .title_area .btn_condition.on{
            color: rgb(255,255,255);
            background: rgb(0,0,0);
        }
        .store_box .title_area .btn_here{
            color: #008000;
            font-weight: 700;
            background: #CFF09E;
            border-radius: 20px;
        }

        .store_box .title_area .btn_here.off{
            color: #008000;
            font-weight: 700;
            background: #d3d3d3;
            border-radius: 20px;
        }

        .condition_box{
            display: none;
            position: absolute;
            top: 100px;
            right: 50px;
            width: 170px;
            padding: 30px 0 25px 30px;
            border: 1px solid rgb(0,0,0);
            background: rgb(255,255,255);
            z-index: 998
        }
        .condition_box li{margin-bottom: 5px;}
        .condition_box li .label_style2{font-family: 'NanumBarunGothic';}
        .condition_box li .label_style2 img{width: 13px; margin-right: 5px;}

        .condition_box .btn_close{
            position: absolute;
            top: 15px;
            right: 15px;
            width: 13px;
            height: 13px;
            padding: 0;
            margin: 0;
        }
        .condition_box .btn_srh{
            display: block;
            width: 138px;
            margin-top: 15px;
            border: 1px solid rgb(0,0,0);
            line-height: 28px;
            font-size: 14px;
            text-align: center;
            color: rgb(0,0,0);
        }
        .search_tab{
            position: relative;
            margin-bottom: 40px;
            top: 0;
            left: 0;
            font-family: 'NanumBarunGothic';
            z-index: 997;
        }
        .search_tab > h3{
            position: absolute;
            top: 0;
            left: 0;
            font-size: 14px;
        }
        .search_tab > h3 a{color: rgb(47,28,17); font-weight:normal;}
        .search_tab > h3.on a{color: rgb(207,102,26)}

        .search_tab .cont{padding-top: 30px; height: 50px;}
        .search_tab .srh_box{ height: 50px; background: rgb(238,238,238);}
        .search_tab .srh_box input{
            float: left;
            width: 80%;
            height: 50px;
            padding-left: 20px;
            font-size: 14px;
            line-height: 50px;
            color: rgb(51,51,51);
            background: rgb(238,238,238);
            border:none;
        }
        .search_tab .srh_box button{
            padding: 0;
            float: right;
            width : 50px;
            height: 50px;
            border:none;
        }

        .store_tab{
            position: relative;
            top: 0;
            left: 0;
            bottom: 0;
            padding-top: 75px;
            z-index: 996
        }
        .store_tab > h3{
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            font-size: 14px;
            background: rgb(238,238,238);
        }
        .store_tab > h3 a{
            display: block;
            height: 38px;
            font-family: 'Archer-Semibold';
            line-height: 38px;
            text-align: center;
            color: rgb(47,28,17);
            background: rgb(238,238,238);
            border:1px solid rgb(222,222,222);
            border-right: 0
        }
        .store_tab .cont{
            height: 400px;
            overflow-y: scroll;
        }
        .store_tab ul{
            width: 100%;
        }
        .store_tab ul li{
            overflow: hidden;
            margin-bottom: 20px;
            padding-bottom: 25px;
            border-bottom: 1px solid rgb(238,238,238);
            font-size: 11px;
        }
        #storeListUL {
            list-style: none;
        }
        .num{
            width: 30px;
            height: 30px;
            margin-bottom: -20px;
            font-family: 'Archer-Semibold';
            font-size: 16px;
            line-height: 30px;
            text-align: center;
            color: #008000;
        }
        .store_tab .store_txt{
            float: left;
            padding-left: 45px;
            font-family: 'NanumBarunGothic';
            width: 100%;
        }
        .store_tab .store_txt .name{overflow: hidden; margin-bottom: 15px;}
        .store_tab .store_txt .name span{
            float: left;
            display: block;
            width: 100%;
            font-size: 14px;
            color: rgb(51,51,51)
        }
        .store_tab .store_txt .name span strong{
            display: inline-block;
            margin-left: 5px;
            font-family: 'Archer-Semibold';
            color: #008000;
            vertical-align: top;
        }
        .store_tab .store_txt .name a{
            float: right;
            font-size: 11px;
            padding: 2px 3px;
        }
        .store_tab .store_txt .tag{margin-bottom: 10px;}
        .store_tab .store_txt .tag span{
            display: inline-block;
            width: 30px;
            height: 30px;
            margin-right: 3px;
            margin-bottom: 5px;
            text-indent: -99999px;
        }
        .store_tab .store_txt .address span{
            display: block;
            margin-bottom: 5px;
            color: rgb(51,51,51)
        }
        .store_tab .store_txt .address .lot{color: rgb(51,51,51)}
        .store_tab .store_txt .tel a{color: rgb(51,51,51)}
        .store_wrap{
            width: 1200px;
            margin: 75px auto 90px
        }
        .store_wrap > h2{margin-bottom: 55px;}

        .store_tab .store_txt .etc span{display: block;margin-top: 20px;}

        @media screen and (min-width: 1112px) {
            .store_box {
                right: 50%;
            }
        }
        @media screen and (max-width: 1111px) {
            .store_box {
            }
        }
    </style>

    <!-- 커스텀 오버레이 CSS -->
    <style>
        .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
        .wrap * {padding: 0;margin: 0;}
        .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
        .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
        .info .title {padding: 5px 10px; height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
        .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
        .close:hover {cursor: pointer;}
        .info .body {position: relative;overflow: hidden;}
        .info .desc {position: relative;margin: 13px 0 0 13px;height: 75px;}
        .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
        .bikecnt {font-size: 20px;color: #888;margin-top: -2px;}
        .bikecnt span{color: #008000; font-weight: 700}
        .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
        .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
        .info .link {color: #5085BB;}
    </style>

    <style>
        .pagination>li>a, .pagination>li>span {
            color : red;
        }
        .mypage-btn {
            width: 100%;
            padding: 14px 10px;
            background: #333;
            color: #fff;
            border: 1px solid #333;
            font-size: 16px;
            font-weight: 700;
            text-transform: uppercase;
        }
    </style>

    <!-- Load JS here for greater good =============================-->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c85324bca7f70b8b98b21cf9f828ad54"></script>
</head>
<body>

<!-- HEADER =============================-->
<header class="item header margin-top-0">
    <div class="wrapper">
        <nav role="navigation" class="navbar navbar-white navbar-embossed navbar-lg navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button data-target="#navbar-collapse-02" data-toggle="collapse" class="navbar-toggle" type="button">
                        <i class="fa fa-bars"></i>
                        <span class="sr-only">Toggle navigation</span>
                    </button>
                    <a href="/index"><img src="/images/Czero.png" style="width: 135px; height: 60px; margin-top: 5px" alt="로고"></a>
                </div>
                <div id="navbar-collapse-02" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="propClone"><a href="/market/market-list">Market</a></li>
                        <li class="propClone"><a href="/news/news">News</a></li>
                        <li class="propClone"><a href="/bicycle/bicycle">Bicycle</a></li>
                        <li class="propClone"><a href="/mypage/myinfo">Mypage</a></li>
                        <% if(sessionNo!=null) {%>
                        <li class="propClone"><a href="/logout">Logout</a></li>
                        <%} else { %>
                        <li class="propClone"><a href="/login/login">Login</a></li>
                        <%} %>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="text-pageheader">
                        <div class="subtext-image" data-scrollreveal="enter bottom over 1.7s after 0.1s">
                            BICYCLE
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>


<!-- CONTENT =============================-->
<section class="item content">
    <div class="container toparea">
        <div class="underlined-title">
            <div class="editContent">
                <h1 class="text-center latestitems">서울시 공공 자전거 위치 안내</h1>
            </div>
            <div class="wow-hr type_short">
			<span class="wow-hr-h">
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			</span>
            </div>
        </div>
    </div>
    <div class="store_map container" style="margin-bottom: 50px;">
        <div id="edd_checkout_wrap" class="" style="margin-bottom: 100px;">
            <div id="clickLatlng"></div>
            <div id="map" style="width:100%; min-height:750px;"></div>
        </div>
        <div class="store_box">
            <div class="title_area">
                <h2>자전거 찾기</h2>
                <div class="btn_box">
                    <a class="btn_here" id="location">현재 위치</a>
                </div>
            </div>
            <div class="search_tab">
                <div class="srh_box">
                    <input type="text" id="keyword" name="keyword" data-val="자전거 정거장 위치를 입력해주세요." value="" onkeydown="if (event.keyCode==13) searchStore();">
                    <button onclick="searchStore();void(0);"><img style="width:32px; height: 32px;" src="../images/search.png" alt="조회하기"></button>
                </div>
            </div>
            <!-- store_tab -->
            <div class="store_tab">
                <!-- STORE LOCATOR -->
                <h3 class="store_locator  on"><a href="#" id="store_local">BICYCLE LOCATOR</a></h3>
                <div class="cont" id="ajaxHtml">
                    <ul id="storeListUL">

                    </ul>
                </div>
            </div>
            <!-- //store_tab -->
        </div>
    </div>



</section>
<!-- FOOTER =============================-->
<div class="footer text-center">
    <div class="container">
        <div class="row">
            <p class="">
                Thanks for visiting our Website.<br>
                Copyright ⓒ 2022. Team.CZero All rights reserved..
            </p>
        </div>
    </div>
</div>


<script>
    var markers = [];
    var overlay = [];

    var map = ""
    var lat = "37.549944383590336"; //y
    var lng = "126.84239510324666"; //x

    /** BICYCLE LIST */
    var html = '';

    /** overlayContent */
    var overlayContent = '<div class="wrap">' +
        '    <div class="info">' +
        '        <div class="title">' +
        '            <#StoreName#>' +
        '            <div class="close" onclick="resetOverlay()" title="닫기"></div>' +
        '        </div>' +
        '        <div class="body">' +
        '            <div class="desc">' +
        '                <div class="ellipsis"><#StoreAddress#></div>' +
        '                <div class="bikecnt ellipsis">실시간 자전거 개수 : '+
        '<span><#BikeCnt#></span></div>' +
        '            </div>' +
        '        </div>' +
        '    </div>' +
        '</div>';

    // var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    // var options = { //지도를 생성할 때 필요한 기본 옵션
    //     center: new kakao.maps.LatLng(37.549944383590336, 126.84239510324666), //지도의 중심좌표.
    //     level: 5 //지도의 레벨(확대, 축소 정도)
    // };
    // var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(pos) {
            var lat = pos.coords.latitude; // 위도
            var lon = pos.coords.longitude; // 경도

            // 마커와 인포윈도우를 표시합니다
            displayMarker(lat, lon);

        });
    } else {
        var lat = 37.549944383590336; // 위도
        var lon = 126.84239510324666; // 경도
        displayMarker(lat, lon);
    }


    //마커 및 인포윈도우 삭제 함수
    function resetDaumMap(){
        jQuery("#storeListUL").html('');
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
            //infowindow[i].close();
        }
        for (var i = 0; i < overlay.length; i++) {
            overlay[i].setMap(null);
        }
    }
    //인포윈도우 모두 삭제
    function resetInfowindow(){
        for (var i = 0; i < infowindow.length; i++) {
            infowindow[i].close();
        }
    }
    //오버레이 모두 삭제
    function resetOverlay(){
        for (var i = 0; i < overlay.length; i++) {
            overlay[i].setMap(null);
        }
    }

    $('#location').on("click",function(){
        $("#keyword").val("");
        $('#location').removeClass("off");
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(pos) {
                var lat = pos.coords.latitude; // 위도
                var lon = pos.coords.longitude; // 경도

                // 마커와 인포윈도우를 표시합니다
                displayMarker(lat, lon);

            });
        } else {
            var lat = 37.549944383590336; // 위도
            var lon = 126.84239510324666; // 경도
            displayMarker(lat, lon);
        }
    });

    //키워드로 데이터 로딩
    function searchStore() {
        var keyword = $("#keyword").val().trim();
        if (keyword == "") {
            alert("검색어를 입력해 주세요");
        } else {
            $.ajax({
                url: "/bicycle/getSearch",
                type: "get",
                data: {
                    searchWord: keyword
                },
                contentType: "application/json",
                success: function (data) {
                   $('#location').addClass("off");
                    //마커 데이터로 그리기
                    if(data.bicycleList.length < 1){
                        resetDaumMap();
                        jQuery("#storeListUL").html("<div style='width:100%;text-align:center;margin:50px 0px;'>검색된 자전거가 없습니다.</div>");
                    } else {
                    /** BICYCLE LIST 초기화 */
                    var html = '';

                    /** 기본 위치 잡기 */
                    var latitude = data.bicycleList[0].stationLatitude; // 내 위도
                    var longitude = data.bicycleList[0].stationLongitude; // 내 경도

                    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
                    var options = { //지도를 생성할 때 필요한 기본 옵션
                        center: new kakao.maps.LatLng(latitude, longitude), //지도의 중심좌표.
                        level: 5 //지도의 레벨(확대, 축소 정도)
                    };
                    var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

                    /** Marker에 데이터 집어넣기 */
                    var positions = new Array();
                    for (var i = 0; i < data.bicycleList.length; i++) {
                        var indexStart = data.bicycleList[i].stationName.indexOf(data.bicycleList[i].stationName.split(" ")[1]);
                        var statName = data.bicycleList[i].stationName.substring(indexStart);
                        positions.push(
                            {
                                parkingBikeTotCnt: data.bicycleList[i].parkingBikeTotCnt,
                                title: statName,
                                latlng: new kakao.maps.LatLng(data.bicycleList[i].stationLatitude, data.bicycleList[i].stationLongitude),
                                lat: data.bicycleList[i].stationLatitude,
                                lon: data.bicycleList[i].stationLongitude
                            }
                        )

                        html += '<li data-lng="' + data.bicycleList[i].stationLongitude +
                            '" data-lat="' + data.bicycleList[i].stationLatitude + '" data-no=' + i + ' >' +
                            '<div class="store_txt">' +
                            '<p class="name">' +
                            '<span>' + statName + '</span>' +
                            '</p>' +
                            '<div class="bikecnt ellipsis">실시간 자전거 개수 : ' +
                            '<span>' + data.bicycleList[i].parkingBikeTotCnt + '</span>' +
                            '</div>' +
                            '</div>' +
                            '</li>';
                    }


                    // 마커 이미지의 이미지 주소입니다
                    var imageSrc = "../images/location.png";
                    var imageSize = new kakao.maps.Size(35, 35);

                        // 커스텀 오버레이에 표시할 컨텐츠 입니다
                        // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
                        // 별도의 이벤트 메소드를 제공하지 않습니다
                        /** 마커 생성!!!!! */
                        for (var i = 0; i < positions.length; i++) {
                            var overTitle = positions[i].title;
                            // 마커 이미지를 생성합니다
                            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

                            // 마커를 생성합니다
                            markers[i] = new kakao.maps.Marker({
                                map: map, // 마커를 표시할 지도
                                position: positions[i].latlng, // 마커를 표시할 위치
                                title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                                image: markerImage // 마커 이미지
                            });

                            markers[i].index = i;
                            markers[i].no = positions[i].StoreNo;
                            markers[i].setMap(map);

                            //오버레이 설정 부분
                            var overlayContent_temp = "";
                            overlayContent_temp = overlayContent;
                            overlayContent_temp = overlayContent_temp.replace(/<#StoreNo#>/g, i);
                            overlayContent_temp = overlayContent_temp.replace(/<#StoreName#>/g, positions[i].title);
                            overlayContent_temp = overlayContent_temp.replace(/<#StoreAddress#>/g, positions[i].title);
                            overlayContent_temp = overlayContent_temp.replace(/<#StoreSort#>/g, "<img src='" + "/images/store/store_icon_" + positions[i].sort + ".png' width='80' >");
                            overlayContent_temp = overlayContent_temp.replace(/<#StoreLAT#>/g, positions[i].lat);
                            overlayContent_temp = overlayContent_temp.replace(/<#StoreLNG#>/g, positions[i].lon);
                            overlayContent_temp = overlayContent_temp.replace(/<#BikeCnt#>/g, positions[i].parkingBikeTotCnt);

                            overlay[i] = new daum.maps.CustomOverlay({
                                content: overlayContent_temp,
                                map: map
                            });

                            daum.maps.event.addListener(markers[i], "click", function () {
                                // 일단 오버레이를 모두 닫고
                                resetOverlay();
                                //센터로 이동

                                map.setCenter(markers[this.index].getPosition());
                                // 해당 인포윈도를 열어준다.
                                //infowindow[this.index].open(map, markers[this.index]);
                                //해당 오버레이를 열어준다
                                overlay[this.index].setMap(map);
                                overlay[this.index].setPosition(markers[this.index].getPosition());
                            });
                        }
                        /** HTML로 BICYCLE LOCATOR 출력 */
                        $("#storeListUL").html(html);
                    }
                }
            });
        }
    }




    // 지도에 마커와 인포윈도우를 표시하는 함수입니다
    function displayMarker(lat1, lon1) {
        $.ajax({
            url: "/bicycle/getBicycle",
            type:"get",
            data : {
                lat : 37.549944383590336, // pos.coords.latitude,
                lon : 126.84239510324666 //pos.coords.longitude
            },
            contentType: "application/json",
            success: function(data) {
                /** 내 위치 잡기 */
                var latitude = data.lat; // 내 위도
                var longitude = data.lon; // 내 경도

                var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
                var options = { //지도를 생성할 때 필요한 기본 옵션
                    center: new kakao.maps.LatLng(latitude, longitude), //지도의 중심좌표.
                    level: 5 //지도의 레벨(확대, 축소 정도)
                };
                var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

                var locPosition = new kakao.maps.LatLng(latitude, longitude);
                // 지도 중심좌표를 접속위치로 변경합니다
                map.setCenter(locPosition);

                /** 내 위치 마커를 생성합니다 */
                var myLocationMarker = new kakao.maps.Marker({
                    map: map,
                    position: locPosition,
                    image: new kakao.maps.MarkerImage("../images/my_location.gif", new kakao.maps.Size(35, 35)) // 마커 이미지
                });

                /** Marker에 데이터 집어넣기 */
                var positions = new Array();
                for(var i = 0; i < data.bicycleList.length; i++){
                    var indexStart = data.bicycleList[i].stationName.indexOf(data.bicycleList[i].stationName.split(" ")[1]);
                    var statName = data.bicycleList[i].stationName.substring(indexStart);
                    positions.push(
                        {
                            parkingBikeTotCnt : data.bicycleList[i].parkingBikeTotCnt,
                            title: statName,
                            latlng : new kakao.maps.LatLng(data.bicycleList[i].stationLatitude, data.bicycleList[i].stationLongitude),
                            lat : data.bicycleList[i].stationLatitude,
                            lon : data.bicycleList[i].stationLongitude
                        }
                    )

                    var dist = data.bicycleList[i].distance;
                    if(dist > 999) {
                        //km로 단위 변환
                        dist = (dist*0.001)+"";
                        dist = dist.substring(0,4)+"km";
                    } else {
                        dist = dist+"m";
                    }
                    /** sort 써서 거리 순으로 정렬 후 보여주자 */
                    html += '<li onclick="showLatlng(this)" data-lng="'+data.bicycleList[i].stationLongitude+
                        '" data-lat="'+data.bicycleList[i].stationLatitude+'" data-no='+i+' >'+
                        '<div class="store_txt">'+
                        '<p class="name">'+
                        '<span>'+statName+'<strong class="distance">'+dist+'</strong></span>'+
                        '</p>'+
                        '<div class="bikecnt ellipsis">실시간 자전거 개수 : ' +
                        '<span>' + data.bicycleList[i].parkingBikeTotCnt + '</span>' +
                        '</div>' +
                        '</div>'+
                        '</li>';
                }
                // 마커 이미지의 이미지 주소입니다
                var imageSrc = "../images/location.png";
                var imageSize = new kakao.maps.Size(35, 35);

                // 커스텀 오버레이에 표시할 컨텐츠 입니다
                // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
                // 별도의 이벤트 메소드를 제공하지 않습니다
                /** 마커 생성!!!!! */
                for (var i = 0; i < positions.length; i++) {
                    var overTitle = positions[i].title;
                    // 마커 이미지를 생성합니다
                    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

                    // 마커를 생성합니다
                    markers[i] = new kakao.maps.Marker({
                        map: map, // 마커를 표시할 지도
                        position: positions[i].latlng, // 마커를 표시할 위치
                        title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                        image: markerImage // 마커 이미지
                    });

                    markers[i].index = i;
                    markers[i].no = positions[i].StoreNo;
                    markers[i].setMap(map);

                    //오버레이 설정 부분
                    var overlayContent_temp = "";
                    overlayContent_temp = overlayContent;
                    overlayContent_temp = overlayContent_temp.replace( /<#StoreNo#>/g, i );
                    overlayContent_temp = overlayContent_temp.replace( /<#StoreName#>/g, positions[i].title );
                    overlayContent_temp = overlayContent_temp.replace( /<#StoreAddress#>/g, positions[i].title );
                    overlayContent_temp = overlayContent_temp.replace( /<#StoreSort#>/g, "<img src='" + "/images/store/store_icon_" + positions[i].sort + ".png' width='80' >" );
                    overlayContent_temp = overlayContent_temp.replace( /<#StoreLAT#>/g, positions[i].lat );
                    overlayContent_temp = overlayContent_temp.replace( /<#StoreLNG#>/g, positions[i].lon );
                    overlayContent_temp = overlayContent_temp.replace( /<#BikeCnt#>/g, positions[i].parkingBikeTotCnt);

                    overlay[i] = new daum.maps.CustomOverlay({
                        content: overlayContent_temp,
                        map: map
                    });

                    daum.maps.event.addListener(markers[i], "click", function() {
                        // 일단 오버레이를 모두 닫고
                        resetOverlay();
                        //센터로 이동

                        map.setCenter(markers[this.index].getPosition());
                        // 해당 인포윈도를 열어준다.
                        //infowindow[this.index].open(map, markers[this.index]);
                        //해당 오버레이를 열어준다
                        overlay[this.index].setMap(map);
                        overlay[this.index].setPosition(markers[this.index].getPosition() );
                    });

                    // var liclick = document.querySelectorAll("#storeListUL li");
                    // daum.maps.event.addListener(liclick, "click", function() {
                    //     // 일단 오버레이를 모두 닫고
                    //     resetOverlay();
                    //     //센터로 이동
                    //
                    //     map.setCenter(markers[this.index].getPosition());
                    //     // 해당 인포윈도를 열어준다.
                    //     //infowindow[this.index].open(map, markers[this.index]);
                    //     //해당 오버레이를 열어준다
                    //     overlay[this.index].setMap(map);
                    //     overlay[this.index].setPosition(markers[this.index].getPosition() );
                    // });

                    //리스트 클릭 이벤트 생성
                    // $("#storeListUL li").on("click",function(){
                    //     alert('test');
                    //     // 일단 오버레이를 모두 닫고
                    //     resetOverlay();
                    //     //센터로 이동
                    //     map.setCenter(new daum.maps.LatLng(jQuery(this).attr("data-lat"), jQuery(this).attr("data-lng")));
                    //     // 해당 인포윈도를 열어준다.
                    //     //infowindow[jQuery(this).index()].open(map, markers[jQuery(this).index()]);
                    //     //해당 오버레이를 열어준다
                    //     overlay[jQuery(this).index()].setMap(map);
                    //     overlay[jQuery(this).index()].setPosition(new daum.maps.LatLng(jQuery(this).attr("data-lat"), jQuery(this).attr("data-lng")) );
                    // });

                    //지도 센터 변경
                    // 지도 중심좌표를 접속위치로 변경합니다
                    // let showLatlng = element => {
                    //     var lat = element.getAttribute('data-lat');
                    //     var lng = element.getAttribute('data-lng');
                    //     var indexNo = element.getAttribute('data-no');
                    //
                    //     console.log('test');
                    //     resetOverlay();
                    //     var locPosition = new kakao.maps.LatLng(lat, lng);
                    //     // 지도 중심좌표를 접속위치로 변경합니다
                    //     map.setCenter(locPosition);
                    //
                    //     overlay[indexNo].setMap(map);
                    //     overlay[indexNo].setPosition(markers[indexNo].getPosition() );
                    //
                    // }

                }
                /** HTML로 BICYCLE LOCATOR 출력 */
                $("#storeListUL").html(html);
            }, // success End !!!
            error: function() {
                console.log("실패!");
            }
        })
    }
</script>
<script>
    //----HOVER CAPTION---//
    jQuery(document).ready(function ($) {

        $('.fadeshop').hover(
            function(){
                $(this).find('.captionshop').fadeIn(150);
            },
            function(){
                $(this).find('.captionshop').fadeOut(150);
            }
        );
    });
</script>
</body>
</html>