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
//    List<BicycleRowDTO> pList = ((BicycleDTO)request.getAttribute("bDTO")).getRowList();
//    if(pList == null) {
//        pList = null;
//    }
// test
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
                    <a href="/index"><img src="/images/Czero.png" style="width: 135px; height: 60px; margin-top: 5px" alt="로고"></a>
                </div>
                <div id="navbar-collapse-02" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="propClone"><a href="/market/market-list">Market</a></li>
                        <li class="propClone"><a href="/news/news">News</a></li>
                        <li class="propClone"><a href="/bicycle/bicycle">Bicycle</a></li>
                        <li class="propClone"><a href="/mypage/myinfo">Mypage</a></li>
                        <li class="propClone"><a href="/login/login">Login</a></li>
                        <li class="propClone"><a href="">Logout</a></li>
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


<%--        <div>--%>
<%--            <% for(BicycleRowDTO i : pList){ %>--%>
<%--                <div><%=i.getSta_loc()%></div>--%>
<%--                <div><%=i.getRent_nm()%></div>--%>
<%--                <div><%=i.getSta_lat()%></div>--%>
<%--                <div><%=i.getSta_long()%></div>--%>
<%--            <% } %>--%>
<%--        </div>--%>
    </div>
    <div id="edd_checkout_wrap" class="" style="margin-bottom: 100px;">
        <div id="clickLatlng"></div>
        <div id="map" style="width:100%; min-height:750px;"></div>
    </div>
    <div class="store_box">
        <div class="title_area">
            <h2>매장찾기</h2>
            <div class="btn_box">
                <a href="#" class="btn_condition">조건 설정</a>
                <a href="#" class="btn_here" id="location">현재 위치</a>
            </div>
        </div>
        <!-- 조건설정 -->
        <div class="condition_box">
            <ul>
                <li>
                    <input type="checkbox" id="chkall" name="chkall" class="check_style" value="1">
                    <label for="chkall" class="label_style2"><img src="/images/store/ico_tag_check_on.png" alt="all">모두선택</label>
                </li>
            </ul>
            <a href="javascript:void(0);" class="btn_srh" id="btnChkSearch">검색하기</a>
            <button class="btn_close"><img src="/images/btn/btn_close2.gif" alt="닫기 버튼"></button>
        </div>
        <!-- //조건설정 -->
        <div class="search_tab">
            <!-- 빠른검색 -->
            <h3 class="quick_srh on"><a href="#" id="quick_srh">빠른 검색</a></h3>
            <div class="cont">
                <div class="srh_box">
                    <input type="text" id="keyword" name="keyword" data-val="매장명 또는 주소를 입력하세요." value="" onkeydown="if (event.keyCode==13) searchStore();">
                    <button onclick="searchStore();void(0);"><img src="/images/sub/btn_quick_srh.gif" alt="조회하기"></button>
                </div>
            </div>
        </div>
        <!-- store_tab -->
        <div class="store_tab">
            <!-- STORE LOCATOR -->
            <h3 class="store_locator  on"><a href="#" id="store_local">STORE LOCATOR</a></h3>
            <div class="cont">
                <ul id="storeListUL">
                    <li data-lng="127.059475" data-lat="37.514524" data-no="31">
                        <div class="num">1</div>
                        <div class="store_txt">
                            <p class="name">
                                <span>삼성봉은사거리점<strong class="distance">33m</strong></span>
                                <a href="javascript:storePop2('31');void(0);" class="btn_style6">자세히보기</a>
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
    $.ajax({
        url: "/bicycle/getBicycle",
        type:"get",
        contentType: "application/json",
        success: function(data) {
            console.log(data);
            console.log(data.rowList[0].rent_nm);
            var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스

            /** 학교를 기본 위치로 잡음 -> 나중엔 내가 있는 위치를 기본으로 잡아보자! */
            var longitude = 126.84239510324666; // 경도
            var latitude = 37.549944383590336; // 위도

            // 마커를 표시할 위치와 title 객체 배열입니다
            var positions = new Array();

            for(var i = 0; i < data.rowList.length; i++){
                positions.push(
                    {
                        title: data.rowList[i].rent_nm,
                        latlng : new kakao.maps.LatLng(data.rowList[i].sta_lat, data.rowList[i].sta_long)
                    }
                )
            }

            console.log(positions);
            var options = { //지도를 생성할 때 필요한 기본 옵션
                center: new kakao.maps.LatLng(latitude, longitude), //지도의 중심좌표.
                level: 5 //지도의 레벨(확대, 축소 정도)
            };

            var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

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
        },
        error: function() {
            alert("error");
        }
    })


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