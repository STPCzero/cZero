<%@ page import="kopo.poly.dto.MarketDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.UserInfoDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    session.setAttribute("SESSION_USER_ID", "USER01"); //세션 강제 적용, 로그인된 상태로 보여주기 위함

    List<MarketDTO> mList = (List<MarketDTO>) request.getAttribute("mList");
    List<UserInfoDTO> uList = (List<UserInfoDTO>) request.getAttribute("uList");


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
            location.href = "/market/market-detail?mk_Seq=" + seq;
        }

    </script>

    <style>
        .wrap-contact100 {
            width: 800px;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            padding: 72px 150px 25px 150px;

            box-shadow: 0 3px 20px 0px rgba(0, 0, 0, 0.1);
            -moz-box-shadow: 0 3px 20px 0px rgba(0, 0, 0, 0.1);
            -webkit-box-shadow: 0 3px 20px 0px rgba(0, 0, 0, 0.1);
            -o-box-shadow: 0 3px 20px 0px rgba(0, 0, 0, 0.1);
            -ms-box-shadow: 0 3px 20px 0px rgba(0, 0, 0, 0.1);
        }

        .container-contact100-form-btn {
            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding-top: 10px;
            padding-bottom: 43px;
        }

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
            padding: 0 20px;
            min-width: 160px;
            height: 42px;
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
        .mkupload{
            width: 10%;
            margin: auto;
            display: block;
        }
        span {
            display: inline-block;

            padding: 10px;
        }
        .mklist{
            width: 33%;
            float: left;
            position: relative;
            min-height: 1px;
            padding-right: 15px;
            padding-left: 15px;
        }
        .mkstar {
            position:relative;
            font-size:0;
            text-align:center;
            margin:auto;
            margin-top:2%;
            margin-bottom:3%;
            width:50%;
            padding:2px 0;
            overflow:hidden;
            clear:both;
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
				<li class="propClone"><a href="index.jsp">Home</a></li>
				<li class="propClone"><a href="market-list.jsp">Market</a></li>
				<li class="propClone"><a href="product.jsp">Checklist</a></li>
				<li class="propClone"><a href="checkout.jsp">Api</a></li>
				<li class="propClone"><a href="contact.jsp">Mypage</a></li>
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
        <span class="row">
            <%
                for (int i = 0; i < mList.size(); i++) {
                    MarketDTO mDTO= mList.get(i);

                    if (mDTO == null) {
                        mDTO = new MarketDTO();
                    }


            %><%--
            <p>
                <%
            if (CmmUtil.nvl(mDTO.getNotice_yn()).equals("1")) {
                out.print("<b>[공지]</b>");

            } else {
                out.print(CmmUtil.nvl(mDTO.getMk_seq()));

            }
                %>
            </p>--%>
            <% UserInfoDTO uDTO = (UserInfoDTO) request.getAttribute("uDTO"); %>


                <div class="mklist" >
                    <div class="productbox">
                        <div class="fadeshop">
                            <div class="captionshop text-center" style="display: none;">
                                <h3><%=CmmUtil.nvl(mDTO.getTitle()) %>
                                </h3>
                                <p>
                                    <%=CmmUtil.nvl(mDTO.getContents()) %>
                                </p>
                                <p>
                                    <%--<a href="#" class="learn-more detailslearn"><i class="fa fa-shopping-cart"></i>
                                        Purchase</a>--%>
                                    <a href="javascript:doDetail('<%=CmmUtil.nvl(mDTO.getMk_seq())%>');" class="learn-more detailslearn"><i class="fa fa-link"></i>Details
                                        </a>
                                    <p>조회수 : <%=CmmUtil.nvl(mDTO.getRead_cnt()) %>
                            </p>
                                <p>닉네임 : <%=CmmUtil.nvl(mDTO.getUser_name()) %></p>
                                <p>등록일 : <%=CmmUtil.nvl(mDTO.getMk_date()) %></p>
                                </p>
                            </div>
                            <span class="maxproduct"><img src="/images/mk_soap.jpg" alt=""></span>
                        </div>
                        <div class="product-details">
                            <a href="#">
                                <h1><%=CmmUtil.nvl(mDTO.getTitle()) %></h1>
                            </a>
                            <span class="price">
								<span class="edd_price">가격 : <%=CmmUtil.nvl(mDTO.getPrice()) %>원</span>
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
    <div class="container" style="text-align: center">
        <span class="row" style="clear: both; text-align: center;" >
            <button class="contact100-form-btn" style="margin: 1px; display: inline-block; float: left;">
                <a href="/market/market-upload" style="color:#ffffff;"><strong>물건 올리기</strong></a>
            </button>
        </span>
    </div>
    <%--<form class="contact100-form">
        <div class="container-contact100-form-btn">
            <nav aria-label="..." style="width: 10%; margin: auto;">
                <ul class="pagination">
                    <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
                    </li>
                    <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a>
                    </li>
                </ul>
            </nav>
        </div>
    </form>--%>
    <div style="text-align: center; margin-bottom: 50px;">

        <div class="btn-group " style="margin: 0 auto; display: inline-block;">

            <a style="color: red;" href="/market/marketlist?num=1">
                <button class="btn btn-secondary">
                    1
                </button></a>

            <a style="" href="/market/marketlist?num=2">
                <button class="btn btn-secondary">
                    2
                </button></a>

        </div>

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