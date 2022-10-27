<%@ page import="java.util.List" %>
<%@ page import="kopo.poly.dto.NewsDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    List<NewsDTO> nList = (List<NewsDTO>) request.getAttribute("nList");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">\
<%--    <style>--%>
<%--        :hover {--%>

<%--            opacity:0.6;--%>

<%--            -webkit-transition: visibility 0s, opacity 0.3s;--%>

<%--            -moz-transition: visibility 0s, opacity 0.3s;--%>

<%--            transition: visibility 0s, opacity 0.3s;--%>

<%--        }--%>
<%--    </style>--%>

    @media (min-width: @screen-md-min) and (max-width: @screen-md-max) {

    }
</head>
<body>

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
                    <img src="/images/Czero.png" style="width: 135px; height: 60px; margin-top: 5px" alt="로고">
                </div>
                <div id="navbar-collapse-02" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="propClone"><a href="/index">Home</a></li>
                        <li class="propClone"><a href="/market/market-list">Market</a></li>
                        <li class="propClone"><a href="/news/news">News</a></li>
                        <li class="propClone"><a href="/bicycle/bicycle">Bicycle</a></li>
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
                            Carbon Neutral News
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- CONTENT =============================-->

<div class="container" style="border: 3px solid #dff0d8;border-radius: 4px; margin: 10px auto" >
    <div class="row" style="margin: 1em auto; display: flex; justify-content : center;">
        <div class="col-md-2" ><strong>Department</strong></div>
        <div class="col-md-9"><strong>Contents</strong></div>
        <div class="col-md-2"><strong>Date</strong></div>
    </div>
    <hr/>
    <%
        for (int i = 0; i < nList.size(); i++) {
            NewsDTO nDTO = nList.get(i);
    %>
    <div class="row" style="margin: 0.5em auto; display: flex; justify-content : center;">
    <div class="col-md-2"><%=CmmUtil.nvl(nDTO.getNews_Department())%></div>
    <div class="col-md-9"><%=CmmUtil.nvl(nDTO.getNews_title())%></div>
    <div class="col-md-2"><%=CmmUtil.nvl(nDTO.getNews_date())%></div>
    </div>
    <hr/>
    <%
        }
    %>
</div>

<!-- FOOTER =============================-->
<div class="footer text-center" style="width: 100%; position: -ms-device-fixed; bottom: 0;">
    <div class="container">
        <div class="row">
            <p class="">
                Thanks for visiting our Website.<br>
                Copyright ⓒ 2022. Team.CZero All rights reserved.
            </p>
        </div>
    </div>
</div>
</body>
</html>