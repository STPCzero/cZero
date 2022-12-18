<%@ page import="jdk.nashorn.internal.scripts.JS" %>
<%@ page import="kopo.poly.dto.MypageDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.MarketDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kopo.poly.util.EncryptUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    MypageDTO iDTO = (MypageDTO) request.getAttribute("iDTO"); // user_info 개인정보
    if(iDTO == null) {
        iDTO = new MypageDTO();
    }
    int chk = (int) request.getAttribute("chk"); // user_info 개인정보
    String sessionNo = "1"; // (String) session.getAttribute("sessionNo");
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
    <link href='../js/lib/main.css' rel='stylesheet' />

    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>


    <script src="../js/jquery-.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/anim.js"></script>
    <script src='../js/lib/main.js'></script>
    <script src='../js/lib/locales/ko.js'></script>
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
            td-size: 16px;
            td-weight: 700;
            text-transform: uppercase;
        }

        /*플로팅*/
        .floating {
            background-color:#f9f9f9;
            border:2px solid #000;
            position: fixed;
            right: 50%;
            top: 380px;
            margin-right: -715px;
            text-align:center;
            width:70px;
            border-radius: 8px;
            -webkit-border-radius: 8px;
        }
    </style>
    <script src="https://unpkg.com/sweetalert@2.1.2/dist/sweetalert.min.js"></script>
    <script>

        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                headerToolbar: {
                    left: 'title',
                    center: 'checkButton',
                    right: 'prevYear,prev,next,nextYear'
                },
                navLinks: false, // can click day/week names to navigate views
                editable: false,
                locale: 'ko',
                selectable: false, // 날짜 클릭 가능하게 함
                customButtons: {
                    checkButton : {
                        text : "출석 체크",  // 버튼 내용
                        click : function() { // 버튼 클릭 시 이벤트 추가
                            var chk = "${chk}";
                            console.log("chk: "+chk);
                            if(chk > 0) {
                                swal("오늘은 이미 출석체크를 완료 하셨습니다!", '', "error")
                            } else {
                                $.ajax({
                                    url: "/mypage/insertCheck",
                                    type: "get",
                                    contentType: "application/json",
                                    success: function (data) {
                                        console.log("---------------------");
                                        swal(data.msg, '', "success").then(function(){
                                            location.href="/mypage/check-attendance";
                                        });
                                    }
                                });
                            }
                        }
                    }
                },
                events : [
                    $.ajax({
                        url: "/mypage/getCheckDays",
                        type: "get",
                        contentType: "application/json",
                        success: function (data) {
                            console.log("test ----");
                            console.log(data);
                            for (i = 0; i < data.length; i++) {
                                console.log(data[i])
                                calendar.addEvent({
                                    title: '출석체크완료!',
                                    start: data[i]['chk_date']
                                });
                            }
                        }
                    })
                ],
                // 달력 정보 가져오기
                eventSources: [
                    {

                        // ajax 통신으로 달력 정보 가져오기
                        // GET "/users/attendances" -> {dateList:[ date: "2016-03-21", ... ]}
                    }
                ]
            });
            calendar.render();
        });



    </script>
    <style>

        #calendar {
            max-width: 900px;
            margin: 0 auto;
        }

        .add-button {
            margin: 0 auto;
            background: red;
            border: 0;
            color: whitesmoke;
            border-radius: 30px;
            width: 150px;
        }
    </style>


</head>

<body>
<% if(sessionNo!=null) {%>
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
                        <% if (iDTO.getUser_type().equals("0")){%>
                        <li class="propClone"><a href="/admin/admin-member">Admin</a></li>
                        <% }%>
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
                            My Page
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
                <h1 class="text-center latestitems">출석 체크</h1>
            </div>
            <div class="wow-hr type_short">
			<span class="wow-hr-h">
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			</span>
            </div>
        </div>

        <div id='calendar'></div>

    </div>
</section>
<br />
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
<script src="https://unpkg.com/sweetalert@2.1.2/dist/sweetalert.min.js"></script>
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

        $('#withdrawal').click(function (){
            if (!confirm("정말 탈퇴하시겠습니까? \n" + "회원 정보는 즉시 삭제되며 돌이킬 수 없습니다.")) {
            } else {
                location.href = "/mypage/myinfo-withdrawal";
            }
        });
    });
</script>
<%} else { %>
<script>
    alert("로그인이 필요한 서비스입니다.");
    location.href = "/login/login";

</script>
<% }%>
</body>
</html>