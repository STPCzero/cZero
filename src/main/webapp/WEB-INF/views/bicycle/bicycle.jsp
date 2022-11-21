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
            color: rgb(255,255,255);
            background: rgb(238,119,19);
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
        .store_tab .num{
            width: 30px;
            height: 30px;
            margin-bottom: -20px;
            font-family: 'Archer-Semibold';
            font-size: 16px;
            line-height: 30px;
            text-align: center;
            color: rgb(255,255,255);
        }
        .store_tab .store_txt{
            float: left;
            padding-left: 45px;
            font-family: 'NanumBarunGothic';
            width: 325px;
        }
        .store_tab .store_txt .name{overflow: hidden; margin-bottom: 15px;}
        .store_tab .store_txt .name span{
            float: left;
            display: block;
            width: 250px;
            font-size: 14px;
            color: rgb(51,51,51)
        }
        .store_tab .store_txt .name span strong{
            display: inline-block;
            margin-left: 5px;
            font-family: 'Archer-Semibold';
            color: rgb(105,81,157);
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
                <h1 class="text-center latestitems">지도안에 자전거</h1>
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
                    <a href="#" class="btn_here" id="location">현재 위치</a>
                </div>
            </div>
            <div class="search_tab">
                <div class="srh_box">
                    <input type="text" id="keyword" name="keyword" data-val="매장명 또는 주소를 입력하세요." value="" onkeydown="if (event.keyCode==13) searchStore();">
                    <button onclick="searchStore();void(0);"><img style="width:32px; height: 32px;" src="../images/search.png" alt="조회하기"></button>
                </div>
            </div>
            <!-- store_tab -->
            <div class="store_tab">
                <!-- STORE LOCATOR -->
                <h3 class="store_locator  on"><a href="#" id="store_local">BICYCLE LOCATOR</a></h3>
                <div class="cont" id="ajaxHtml">
                    <ul id="storeListUL">
                        <li data-lng="127.059475" data-lat="37.514524" data-no="31">
                            <div class="num">1</div>
                            <div class="store_txt">
                                <p class="name">
                                    <span>삼성봉은사거리점<strong class="distance">33m</strong></span>
                                </p>
                                <p class="address">
                                    <span>서울시 강남구 영동대로 607 1,2층</span>
                                </p>
                            </div>
                        </li>
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
<!-- Load JS here for greater good =============================-->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c85324bca7f70b8b98b21cf9f828ad54"></script>


<script>
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

                /** 학교를 기본 위치로 잡음 -> 나중엔 내가 있는 위치를 기본으로 잡아보자! */
                console.log(data);
                var latitude = data.lat; // 내 위도
                var longitude = data.lon; // 내 경도
                var locPosition = new kakao.maps.LatLng(latitude, longitude);

                var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
                var options = { //지도를 생성할 때 필요한 기본 옵션
                    center: new kakao.maps.LatLng(latitude, longitude), //지도의 중심좌표.
                    level: 5 //지도의 레벨(확대, 축소 정도)
                };

                var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

                // 내 위치 마커를 생성합니다
                // 마커 이미지의 이미지 주소입니다
                var imageSrc2 = "../images/mylocation.png";
                var imageSize2 = new kakao.maps.Size(35, 35);
                var myLocationMarker = new kakao.maps.Marker({
                    map: map,
                    position: locPosition,
                    image: new kakao.maps.MarkerImage(imageSrc2, imageSize2) // 마커 이미지
                });
                // 지도 중심좌표를 접속위치로 변경합니다
                map.setCenter(locPosition);

                // 마커를 표시할 위치와 title 객체 배열입니다
                var positions = new Array();
                for(var i = 0; i < data.bicycleList.length; i++){
                    positions.push(
                        {
                            title: data.bicycleList[i].stationName,
                            latlng : new kakao.maps.LatLng(data.bicycleList[i].stationLatitude, data.bicycleList[i].stationLongitude)
                        }
                    )
                }

                console.log(positions);

                // 마커 이미지의 이미지 주소입니다
                var imageSrc = "../images/location.png";
                var imageSize = new kakao.maps.Size(35, 35);

                for (var i = 0; i < positions.length; i++) {
                    // 마커 이미지를 생성합니다
                    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

                    // 마커를 생성합니다
                    var marker = new kakao.maps.Marker({
                        map: map, // 마커를 표시할 지도
                        position: positions[i].latlng, // 마커를 표시할 위치
                        title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                        image: markerImage // 마커 이미지
                    });
                }

                /** HTML로 BICYCLE LOCATOR 출력 */

                var html = '<ul id="storeListUL">'+
                    '<li data-lng="127.059475" data-lat="37.514524" data-no="31">'+
                        '<div class="num">1</div>'+
                        '<div class="store_txt">'+
                            '<p class="name">'+
                                '<span>테스트점<strong class="distance">33m</strong></span>'+
                            '</p>'+
                        '</div>'+
                    '</li>'+
                '</ul>';
                /*

                <ul id="storeListUL">
                        <li data-lng="127.059475" data-lat="37.514524" data-no="31">
                            <div class="num">1</div>
                            <div class="store_txt">
                                <p class="name">
                                    <span>삼성봉은사거리점<strong class="distance">33m</strong></span>
                                </p>
                                <p class="address">
                                    <span>서울시 강남구 영동대로 607 1,2층</span>
                                </p>
                            </div>
                        </li>
                    </ul>

                */
                $("#ajaxHtml").html(html);
            },
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