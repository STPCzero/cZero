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
    <link href="../css/style.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
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
                            Carbon Neutral News
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- CONTENT =============================-->

<section class="hero-section">
    <div class="card-grid">

        <%
            for (int i = 0; i < 3; i++) {
                NewsDTO nDTO = nList.get(i);
        %>
        <a class="card" href="<%=nDTO.getNews_url()%>">
            <div class="card__background" style="background-image: url(https://images.unsplash.com/photo-1557187666-4fd70cf76254?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60)"></div>
            <div class="card__content">
                <p class="card__category"><%=CmmUtil.nvl(nDTO.getNews_site())%></p>
                <h6 class="card__heading"><%=CmmUtil.nvl(nDTO.getNews_title())%></h6>
                <p><%=nDTO.getNews_contents()%></p>
            </div>
        </a>
        <%
            }
        %>
        <%--<a class="card" href="#">
            <div class="card__background" style="background-image: url(https://images.unsplash.com/photo-1557187666-4fd70cf76254?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60)"></div>
            <div class="card__content">
                <p class="card__category">n</p>
                <h3 class="card__heading">Example Card Heading</h3>
            </div>
        </a>
        <a class="card" href="#">
            <div class="card__background" style="background-image: url(https://images.unsplash.com/photo-1556680262-9990363a3e6d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60)"></div>
            <div class="card__content">
                <p class="card__category">Category</p>
                <h3 class="card__heading">Example Card Heading</h3>
            </div>
        </a>
        <a class="card" href="#">
            <div class="card__background" style="background-image: url(https://images.unsplash.com/photo-1557004396-66e4174d7bf6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60)"></div>
            <div class="card__content">
                <p class="card__category">Category</p>
                <h3 class="card__heading">Example Card Heading</h3>
            </div>
        </a>--%>
    </div>
</section>
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