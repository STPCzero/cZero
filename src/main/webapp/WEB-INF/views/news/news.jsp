<%@ page import="java.util.List" %>
<%@ page import="kopo.poly.dto.NewsDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    List<NewsDTO> nList = (List<NewsDTO>) request.getAttribute("nList");
    String sessionNo = (String) session.getAttribute("sessionNo");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
    @media (min-width: @screen-md-min) and (max-width: @screen-md-max) {
    }
    <style type="text/css">
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
            font-weight: Bold;
            font-style: normal;
        }

        .border {
            border: 3px solid #dff0d8;
            border-radius: 4px;
            margin: 10px auto
        }

        .center {
            margin: 1em auto;
            display: flex;
            justify-content: center;
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
                            Carbon Neutral News
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- CONTENT =============================-->
<br/>
<div class="container border">    <!-- 구글 -->
    <div class="row center"> <!-- 로고 -->
        <a href="https://www.google.com/search?q=탄소중립+뉴스&sxsrf=ALiCzsai04-5qNMIZPXm4fuv1qFoP5EsvA:1668563949506&source=lnms&tbm=nws&sa=X&ved=2ahUKEwj86fqLzbH7AhVQz2EKHfz_Ba8Q_AUoAXoECAEQAw&biw=1920&bih=969&dpr=1">
            <img src="../images/google_logo.png" style="width: 200px">
        </a>
    </div>
    <div class="row center">
        <div class="col-md-2"><strong>Department</strong></div>
        <div class="col-md-9"><strong>Title</strong></div>
        <div class="col-md-10"><strong>Contents</strong></div>
        <div class="col-md-2"><strong>Date</strong></div>
    </div>
    <hr/>
    <%
        for (int i = 0; i < 3; i++) {
            NewsDTO nDTO = nList.get(i);
    %>
    <div class="row center">
        <div class="col-md-2">
            <%=CmmUtil.nvl(nDTO.getNews_department())%>
        </div>
        <div class="col-md-9">
            <a href="<%=CmmUtil.nvl(nDTO.getNews_url())%>">
                <%=CmmUtil.nvl(nDTO.getNews_title())%>
            </a>
        </div>
        <div class="col-md-10">
            <%=CmmUtil.nvl(nDTO.getNews_contents())%>
        </div>
        <div class="col-md-2">
            <%=CmmUtil.nvl(nDTO.getNews_date())%>
        </div>
    </div>
    <hr/>
    <%
        }
    %>
</div>
<br/>

<div class="container border"> <!-- 네이버 -->
    <div class="row center">
        <a href="https://search.naver.com/search.naver?where=news&query=%ED%83%84%EC%86%8C%EC%A4%91%EB%A6%BD%20%EB%89%B4%EC%8A%A4&sm=tab_opt&sort=0&photo=0&field=0&pd=0&ds=&de=&docid=&related=0&mynews=0&office_type=0&office_section_code=0&news_office_checked=&nso=so%3Ar%2Cp%3Aall&is_sug_officeid=0">
            <img src="../images/naver_logo.png" style="width: 200px">
        </a>
    </div>
    <div class="row center">
        <div class="col-md-2"><strong>Department</strong></div>
        <div class="col-md-9"><strong>Title</strong></div>
        <div class="col-md-10"><strong>Contents</strong></div>
        <div class="col-md-2"><strong>Date</strong></div>
    </div>
    <hr/>
    <%
        for (int i = 3; i < 6; i++) {
            NewsDTO nDTO = nList.get(i);
    %>
    <div class="row center">
        <div class="col-md-2">
            <%=CmmUtil.nvl(nDTO.getNews_department())%>
        </div>
        <div class="col-md-9">
            <a href="<%=CmmUtil.nvl(nDTO.getNews_url())%>">
                <%=CmmUtil.nvl(nDTO.getNews_title())%>
            </a>
        </div>
        <div class="col-md-10">
            <%=CmmUtil.nvl(nDTO.getNews_contents())%>
        </div>
        <div class="col-md-2">
            <%=CmmUtil.nvl(nDTO.getNews_date())%>
        </div>
    </div>
    <hr/>
    <%
        }
    %>
</div>
<br/>

<div class="container border"> <!-- 탄소중립 뉴스 -->
    <a href="https://www.gihoo.or.kr/netzero/user/board/pressRelease/nv_carbonNtrlNewsList.do">
        <div class="row center">
            <span style="font-size: 25px; font-weight: 700; color: #00bba7; font-family: 'GmarketSansMedium'; ">2050탄소중립뉴스</span>
        </div>
        <div class="row center"> <!-- 로고 -->

            <img src="/images/netZero_logo.png" style="width: 150px">
            <img src="/images/logo.png" style="width: 200px">
        </div>
    </a>
    <div class="row center">
        <div class="col-md-2"><strong>Department</strong></div>
        <div class="col-md-9"><strong>Title</strong></div>
        <div class="col-md-2"><strong>Date</strong></div>
    </div>
    <hr/>
    <%
        for (int i = 6; i < 11; i++) {
            NewsDTO nDTO = nList.get(i);
    %>
    <div class="row center">
        <div class="col-md-2">
            <%=CmmUtil.nvl(nDTO.getNews_department())%>
        </div>
        <div class="col-md-9">
            <a href="<%=CmmUtil.nvl(nDTO.getNews_url())%>">
                <%=CmmUtil.nvl(nDTO.getNews_title())%>
            </a>
        </div>
        <div class="col-md-2">
            <%=CmmUtil.nvl(nDTO.getNews_date())%>
        </div>
    </div>
    <hr/>
    <%
        }
    %>
</div>
<br/>

<div class="container border"> <!-- 탄소중립 소식 -->
    <a href="https://www.gihoo.or.kr/netzero/user/board/pressRelease/nv_carbonNtrlWordList.do">
        <div class="row center">
            <span style="font-size: 25px; font-weight: 700; color: #00bba7; font-family: 'GmarketSansMedium'; ">2050탄소중립소식</span>

        </div>
        <div class="row center"> <!-- 로고 -->
            <img src="/images/netZero_logo.png" style="width: 150px">
            <img src="/images/logo.png" style="width: 200px">
        </div>
    </a>
    <div class="row center">
        <div class="col-md-2"><strong>Department</strong></div>
        <div class="col-md-9"><strong>Title</strong></div>
        <div class="col-md-2"><strong>Date</strong></div>
    </div>
    <hr/>
    <%
        for (int i = 11; i < 16; i++) {
            NewsDTO nDTO = nList.get(i);
    %>
    <div class="row center">
        <div class="col-md-2">
            <%=CmmUtil.nvl(nDTO.getNews_department())%>
        </div>
        <div class="col-md-9">
            <a href="<%=CmmUtil.nvl(nDTO.getNews_url())%>">
                <%=CmmUtil.nvl(nDTO.getNews_title())%>
            </a>
        </div>
        <div class="col-md-2">
            <%=CmmUtil.nvl(nDTO.getNews_date())%>
        </div>
    </div>
    <hr/>
    <%
        }
    %>
</div>
<br/>

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