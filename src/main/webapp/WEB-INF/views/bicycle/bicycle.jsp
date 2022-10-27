<%@ page import="jdk.nashorn.internal.scripts.JS" %>
<%@ page import="kopo.poly.dto.MypageDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.MarketDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

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
                    <img src="/images/Czero.png" style="width: 135px; height: 60px; margin-top: 5px" alt="로고">
                </div>
                <div id="navbar-collapse-02" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="propClone"><a href="/index">Home</a></li>
                        <li class="propClone"><a href="/market/market-list">Market</a></li>
                        <li class="propClone"><a href="/checklist/checklist">Checklist</a></li>
                        <li class="propClone"><a href="api">Bicycle</a></li>
                        <li class="propClone"><a href="/mypage/myinfo">Mypage</a></li>
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
        <div id="edd_checkout_wrap" class="col-md-8 col-md-offset-2" style="margin-bottom: 100px;">
            <p><em>지도를 클릭해주세요!</em></p>
            <div id="clickLatlng"></div>
            <div id="map" style="width:100%; min-height:500px;"></div>
        </div>
    </div>
</section>
<!-- FOOTER =============================-->
<div class="footer text-center">
    <div class="container">
        <div class="row">
            <p class="">
                Thanks for visiting our Website.<br>
                Copyright ⓒ 2022. Team.CZero All rights reserved.
            </p>
        </div>
    </div>
</div>
<!-- Load JS here for greater good =============================-->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c85324bca7f70b8b98b21cf9f828ad54"></script>
<script>
    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스

    /** 학교를 기본 위치로 잡음 -> 나중엔 내가 있는 위치를 기본으로 잡아보자! */
    var longitude = 126.84239510324666; // 경도
    var latitude = 37.549944383590336; // 위도

    var options = { //지도를 생성할 때 필요한 기본 옵션
        center: new kakao.maps.LatLng(latitude, longitude), //지도의 중심좌표.
        level: 5 //지도의 레벨(확대, 축소 정도)
    };

    var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴


    function getInfo() {
        // 지도의 현재 중심좌표를 얻어옵니다
        var center = map.getCenter();

        // 지도의 현재 레벨을 얻어옵니다
        var level = map.getLevel();

        // 지도타입을 얻어옵니다
        var mapTypeId = map.getMapTypeId();

        // 지도의 현재 영역을 얻어옵니다
        var bounds = map.getBounds();

        // 영역의 남서쪽 좌표를 얻어옵니다
        var swLatLng = bounds.getSouthWest();

        // 영역의 북동쪽 좌표를 얻어옵니다
        var neLatLng = bounds.getNorthEast();

        // 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
        var boundsStr = bounds.toString();


        var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
        message += '경도 ' + center.getLng() + ' 이고 <br>';
        message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
        message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
        message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', ' + swLatLng.getLng() + ' 이고 <br>';
        message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', ' + neLatLng.getLng() + ' 입니다';

        // 개발자도구를 통해 직접 message 내용을 확인해 보세요.
        console.log(message);
    }
    //getInfo();

    /** marker */
    // 지도를 클릭한 위치에 표출할 마커입니다
    var marker = new kakao.maps.Marker({
            // 지도 중심좌표에 마커를 생성합니다
            position: map.getCenter()
        });
    // 지도에 마커를 표시합니다
    marker.setMap(map);

    // 지도에 클릭 이벤트를 등록합니다
    // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

        // 클릭한 위도, 경도 정보를 가져옵니다
        var latlng = mouseEvent.latLng;

        // 마커 위치를 클릭한 위치로 옮깁니다
        marker.setPosition(latlng);

        var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
        message += '경도는 ' + latlng.getLng() + ' 입니다';

        var resultDiv = document.getElementById('clickLatlng');
        resultDiv.innerHTML = message;
        console.log(message);
    });

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