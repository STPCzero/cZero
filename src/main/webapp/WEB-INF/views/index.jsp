<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
 String sessionNo = (String) session.getAttribute("sessionNo");
 String type = (String) session.getAttribute("type");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:200,300,400,500,600,700" rel="stylesheet">
</head>
<body>
<style>
</style>

<!-- HEADER =============================-->
<header class="item header margin-top-0">
    <div class="wrapper">
        <nav role="navigation" class="navbar navbar-white navbar-embossed navbar-lg navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button data-target="#navbar-collapse-02" data-toggle="collapse" class="navbar-toggle"
                            type="button">
                        <i class="fa fa-bars"></i>
                        <span class="sr-only">Toggle navigation</span>
                    </button>
                    <a href="/index"><img src="/images/Czero.png" style="width: 135px; height: 60px; margin-top: 5px;" alt="로고"></a>
                </div>
                <div id="navbar-collapse-02" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <% if (type == null){%>
                        <%} else if (type.equals("0")){ %>
                        <li class="propClone"><a href="/admin/admin-member">Admin</a></li>
                        <% }%>
                        <li class="propClone"><a href="/market/market-list">Market</a></li>
                        <li class="propClone"><a href="/news/news">News</a></li>
                        <li class="propClone"><a href="/bicycle/bicycle">Bicycle</a></li>
                        <li class="propClone"><a href="/mypage/myinfo">Mypage</a></li>
                        <% if(sessionNo != null) {%>
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
                    <div>
                        <div class="text-homeimage maintext-image titlefont"
                             data-scrollreveal="enter top over 1.5s after 0.1s">
                            탄소중립이란?
                        </div>
                        <div class="text-homeimage2 subtext-image titlefont2"
                             data-scrollreveal="enter bottom over 1.7s after 0.3s">
                            <strong>이산화탄소 배출량만큼 흡수량도 늘려 실질적인 <br>이산화탄소 배출량을 ‘0(zero)’으로 만든다는 개념</strong>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>


<!-- STEPS =============================-->
<div class="item content">
    <div class="container toparea">
        <div class="row text-center">
            <div class="col-md-4">
                <div class="col editContent">
                    <span class="numberstep"><a href="/market/market-list"><i class="fa"><img src="/images/market.png" style="width: 55%; height: 55%;"></i></a></span>
                    <h3 class="numbertext">플리마켓</h3>
                    <p>
                        <strong>여러가지 물품을 주고 사고파는 플리마켓을 통해 <br>환경을 지키고 소중한 추억도 쌓아보세요</strong>
                    </p>
                </div>
                <!-- /.col-md-4 -->
            </div>
            <!-- /.col-md-4 col -->
            <div class="col-md-4 editContent">
                <div class="col">
                    <span class="numberstep"><a href="/news/news"><i class="fa"><img src="/images/list.png" style="width: 60%; height: 60%; margin-bottom: 5%"></i></a></span>
                    <h3 class="numbertext">데일리뉴스</h3>
                    <p>
                        <strong>매일매일 알아보는 환경뉴스로<br>의미있는 하루를 시작하세요</strong>
                    </p>
                </div>
                <!-- /.col -->
            </div>
            <!-- /.col-md-4 col -->
            <div class="col-md-4 editContent">
                <div class="col">
                    <span class="numberstep"><a href="/bicycle/bicycle"><i class="fa"><img src="/images/bicycle.png" style="width: 65%; height: 65%; margin-bottom: 8%; margin-left: 3%"></i></a></span>
                    <h3 class="numbertext">공공 자전거</h3>
                    <p>
                        <strong>도시 곳곳의 공공 자전거를 이용해 <br>탄소중립을 실천해보세요</strong>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- SCRIPTS =============================-->
<script src="js/jquery-.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/anim.js"></script>
<script>
    //----HOVER CAPTION---//
    jQuery(document).ready(function ($) {
        $('.fadeshop').hover(
            function () {
                $(this).find('.captionshop').fadeIn(150);
            },
            function () {
                $(this).find('.captionshop').fadeOut(150);
            }
        );
    });
</script>

</body>
</html>