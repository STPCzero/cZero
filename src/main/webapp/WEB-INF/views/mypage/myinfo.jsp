<%@ page import="jdk.nashorn.internal.scripts.JS" %>
<%@ page import="kopo.poly.dto.MypageDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.MarketDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    MypageDTO iDTO = (MypageDTO) request.getAttribute("iDTO"); // user_info 개인정보
    if(iDTO == null) {
        iDTO = new MypageDTO();
    }
    List<MarketDTO> mkList = (List<MarketDTO>)request.getAttribute("mkList"); // 내 market 정보
    if(mkList == null) mkList = new ArrayList<MarketDTO>(); // 게시판 조회 결과 보여주기
    boolean prev = (boolean) request.getAttribute("prev");
    boolean next = (boolean) request.getAttribute("next");
    int startPageNum = (int) request.getAttribute("startPageNum");
    int endPageNum = (int) request.getAttribute("endPageNum");
    int select = (int) request.getAttribute("select");

    String sessionNo = (String) session.getAttribute("sessionNo");
%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="">

    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/td-awesome/4.6.3/css/td-awesome.min.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
    <link href="https://tds.googleapis.com/css?family=Dosis:200,300,400,500,600,700" rel="stylesheet">
    <link href="https://tds.googleapis.com/css?family=Roboto:200,300,400,500,600,700" rel="stylesheet">
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
            td-size: 16px;
            td-weight: 700;
            text-transform: uppercase;
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
                <h1 class="text-center latestitems">내 정보 수정</h1>
            </div>
            <div class="wow-hr type_short">
			<span class="wow-hr-h">
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			</span>
            </div>
        </div>
        <div id="edd_checkout_wrap" class="col-md-8 col-md-offset-2">
            <div id="edd_checkout_form_wrap" class="edd_clearfix">
                <form id="edd_purchase_form" class="edd_form" action="/mypage/myinfo-modify" method="post">
                    <fieldset id="edd_checkout_user_info">
                        <legend>Personal Info</legend>
                        <p id="edd-first-name-wrap">
                            <label class="edd-label" for="edd-first">
                                Name <span class="edd-required-indicator">*</span>
                            </label>
                            <input disabled class="edd-input " type="text" name="edd_first"
                                   placeholder="First name" id="edd-first" value="<%=CmmUtil.nvl(iDTO.getUser_name())%>" required="">
                        </p>
                        <p id="edd-email-wrap">
                            <label class="edd-label" for="edd-email">
                                Email Address <span class="edd-required-indicator">*</span></label>
                            <input disabled class="edd-input " type="email" name="edd_email" placeholder="Email address"
                                   id="edd-email" value="<%=CmmUtil.nvl(iDTO.getUser_email())%>">
                        </p>
                        <div style="text-align: right; margin-top: 10px;">
                            <a style="color : #999; td-size: 12px;">탈퇴하기</a>
                        </div>
                    </fieldset>
                    <input type="submit" id="submit" class="clearfix mypage-btn" value="수정하기">
                </form>
            </div>
            <br />
            <form id="edd_checkout_cart_form" method="post">
                <div id="edd_checkout_cart_wrap">
                    <table id="edd_checkout_cart" class="ajaxed">
                        <thead>
                        <tr class="edd_cart_header_row">
                            <th class="edd_cart_item_name">
                                내가 쓴 글
                            </th>
                            <th class="edd_cart_item_price">
                                가격
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                            <% for(int i = 0; i < mkList.size(); i++) {
                                MarketDTO rDTO = mkList.get(i);
                                if(rDTO == null) {
                                    rDTO = new MarketDTO();
                                }%>
                            <tr class="edd_cart_item" id="edd_cart_item_0_25" data-download-id="25">
                                <td class="edd_cart_item_name">
                                    <div style="display: inline-block;" class="edd_cart_item_image">
                                        <img width="55" height="55" src="../images/scorilo2-70x70.jpg" alt="">
                                    </div>
                                    <span class="edd_checkout_cart_item_title"><%=CmmUtil.nvl(rDTO.getTitle())%></span>
                                </td>
                                <td class="edd_cart_item_price">
                                    $11.99
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </form>
            <div style="text-align: center; margin-bottom: 50px;">
                <% if(prev == true) {%>
                <button type="button" class="btn btn-secondary">Prev</button>
                <%}%>
                <div class="btn-group " style="margin: 0 auto; display: inline-block;">
                    <% for (int i = startPageNum; i <= endPageNum; i++) {
                        if(select == i) {%>
                        <a style="color: red;" href="/mypage/myinfo?num=<%=i%>">
                        <button class="btn btn-secondary">
                            <%=i%>
                        </button></a>
                        <%} else {%>
                        <a style="" href="/mypage/myinfo?num=<%=i%>">
                        <button class="btn btn-secondary">
                            <%=i%>
                        </button></a>
                        <% }
                    } %>
                </div>
                <% if(next == true) {%>
                <button type="button" class="btn btn-secondary">Next</button>
                <% } %>
            </div>
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
<%} else { %>
<script>
    alert("로그인이 필요한 서비스입니다.");
    location.href = "/login/login";
</script>
<% }%>
</body>
</html>