<%@ page import="kopo.poly.dto.MarketDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.UserInfoDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    session.setAttribute("SESSION_USER_ID", "USER01"); //세션 강제 적용, 로그인된 상태로 보여주기 위함

    List<UserInfoDTO> uList = (List<UserInfoDTO>) request.getAttribute("uList");
    if (uList == null) {
        uList = new ArrayList<>();
    }
    List<MarketDTO> mList = (List<MarketDTO>) request.getAttribute("mList");

    boolean prev = (boolean) request.getAttribute("prev");
    boolean next = (boolean) request.getAttribute("next");
    int startPageNum = (int) request.getAttribute("startPageNum");
    int endPageNum = (int) request.getAttribute("endPageNum");
    int select = (int) request.getAttribute("select");
    String search = (String) request.getAttribute("search");

    String sessionNo = (String) session.getAttribute("sessionNo");
//게시판 조회 결과 보여주기
    if (mList == null) {
        mList = new ArrayList<MarketDTO>();
    }

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="">

    <script type="text/javascript" src="../js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="../js/paging.js"></script>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:200,300,400,500,600,700" rel="stylesheet">


    <script type="text/javascript">

        //상세보기 이동
        function doDetail(seq) {
            location.href = "/market/market-detail?mk_seq=" + seq;
        }

    </script>

    <style>
        button {
            outline: none !important;
            border: none;
            background: transparent;
        }

        button:hover {
            cursor: pointer;
        }

        .contact100-form-btn {
            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: flex;
            justify-content: center;
            align-items: center;
            min-width: 160px;
            height: 36px;
            background-color: #00bba7;
            border-radius: 21px;

            /*font-family: JosefinSans-Bold;*/
            font-size: 14px;
            color: #fff;
            line-height: 1.2;
            text-transform: uppercase;
            padding-top: 5px;

            -webkit-transition: all 0.4s;
            -o-transition: all 0.4s;
            -moz-transition: all 0.4s;
            transition: all 0.4s;

        }

        span:not(.not) {
            display: inline-block;

            padding: 10px;
        }

        .not {
            padding: 10px;
        }

        .mklist {
            float: left;
            position: relative;
            min-height: 1px;
            padding-right: 15px;
            padding-left: 15px;
        }

        .mkstar {
            position: relative;
            font-size: 0;
            text-align: center;
            margin: auto;
            margin-top: 2%;
            margin-bottom: 3%;
            width: 50%;
            padding: 2px 0;
            overflow: hidden;
            clear: both;
        }

        .wrap {
            width: 400px;
            left: 50%;
        }

        .search {
            width: 100%;
            display: flex;
        }

        .searchTerm {
            width: 80%;
            border: 3px solid #00bba7;
            border-right: none;
            padding: 5px;
            height: 36px;
            border-radius: 5px 0 0 5px;
            outline: none;
            color: #9DBFAF;
        }

        .searchTerm:focus {
            color: #00bba7;
        }

        .searchButton {
            width: 40px;
            height: 36px;
            border: 1px solid #00bba7;
            background: #00bba7;
            text-align: center;
            color: #fff;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
            font-size: 20px;
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
                    <a href="/index"><img src="/images/Czero.png" style="width: 135px; height: 60px; margin-top: 5px"
                                          alt="로고"></a>
                </div>
                <div id="navbar-collapse-02" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="propClone"><a href="/market/market-list">Market</a></li>
                        <li class="propClone"><a href="/news/news">News</a></li>
                        <li class="propClone"><a href="/bicycle/bicycle">Bicycle</a></li>
                        <li class="propClone"><a href="/mypage/myinfo">Mypage</a></li>
                        <% if (sessionNo != null) {%>
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
                            Market
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
                <h1 class="text-center latestitems">OUR PRODUCTS</h1>
            </div>
            <div class="mkstar type_short">
			<span class="wow-hr-h">
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			</span>
            </div>
        </div>
        <div>
            <div style="float: left; width: 50%;">
        <span class="row" style="clear: both; text-align: center;">
            <button class="contact100-form-btn"
                    style="display: inline-block; float: left; margin-left: 13%; margin-top: 3%">
                <a href="/market/market-upload" style="color:#ffffff;">
                    <strong>물건 올리기</strong>
                </a>
            </button>
        </span>
            </div>
            <form action="/market/market-list" method="get" style="display: inline-block; ">
                <div style="float: right; margin-top: 3.5%;position: relative; left: 46%;">
                    <div class="wrap">
                        <div class="search">
                            <input type="text" class="searchTerm" name="search" value="<%=search%>"
                                   placeholder="Search">
                            <button class="searchButton">
                                <i class="fa fa-search"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <span class="row not">
            <%
                for (int i = 0; i < mList.size(); i++) {
                    MarketDTO mDTO = mList.get(i);

                    if (mDTO == null) {
                        mDTO = new MarketDTO();
                    }


            %>
                <div class="mklist">
                    <div class="productbox" style="width: 350px; height: 450px;">
                        <div class="fadeshop">
                            <div class="captionshop text-center" style="display: none;">
                                <h3><%=CmmUtil.nvl(mDTO.getTitle()) %>
                                </h3>
                                <p>
                                    <a href="javascript:doDetail('<%=CmmUtil.nvl(String.valueOf(mDTO.getMk_seq()))%>');"
                                       class="learn-more detailslearn">
                                        <i class="fa fa-link"></i>상세보기
                                        </a>
                                    <p>조회수 : <%=CmmUtil.nvl(String.valueOf(mDTO.getRead_cnt())) %>
                            </p>
                                <p>등록일 : <%=mList.get(i).getMk_date() %></p>
                                </p>
                            </div>
                            <span class="maxproduct">
                                <img alt="test" src="<%=CmmUtil.nvl(mDTO.getThumbnail()) %>"
                                     style="height: auto; width: 600px"/>
                            </span>
                        </div>
                        <div class="product-details" style=" position:absolute; bottom: 5%; left: 10%; right: 10%;">
                            <a href="#">
                                <h1><%=CmmUtil.nvl(mDTO.getTitle()) %></h1>
                            </a>
                            <span class="price">
								<span class="edd_price">가격 : <%=CmmUtil.nvl(String.valueOf(mDTO.getPrice())) %>원</span>
							</span>
                        </div>
                    </div>
                </div>
            </a>
            <%
                }
            %>
        </span>

    </div>

    <div style="text-align: center; margin: 50px 0;">
        <% if (prev == true) {%>
        <button type="button" class="btn btn-secondary">Prev</button>
        <%}%>
        <div class="btn-group " style="margin: 0 auto; display: inline-block;">
            <% for (int i = startPageNum; i <= endPageNum; i++) {
                if (select == i) {%>
            <a style="color: red;" href="/market/market-list?num=<%=i%>&search=<%=search%>">
                <button class="btn">
                    <%=i%>
                </button>
            </a>
            <%} else {%>
            <a style="" href="/market/market-list?num=<%=i%>&search=<%=search%>">
                <button class="btn">
                    <%=i%>
                </button>
            </a>
            <% }
            } %>
        </div>
        <% if (next == true) {%>
        <button type="button" class="btn btn-secondary">Next</button>
        <% } %>

    </div>
</section>


<!-- Load JS here for greater good =============================-->
<script src="../js/jquery-.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/anim.js"></script>
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

</body>
</html>