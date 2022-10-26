<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kopo.poly.dto.MarketDTO" %>
<%@ page import="kopo.poly.dto.UserInfoDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%
	MarketDTO rDTO = (MarketDTO)request.getAttribute("rDTO");
	/*UserInfoDTO uDTO = (UserInfoDTO)request.getAttribute("uDTO");*/

	// 마켓 정보를 못불러왔다면, 객체 생성
	if (rDTO == null) {
		rDTO = new MarketDTO();

	}

	String ss_user_name = CmmUtil.nvl((String)session.getAttribute("SESSION_USER_NAME"));

	// 본인이 작성한  글만 수정가능하도록 하기(1: 작성자 아님 / 2: 본인이 작성한 글 / 3: 로그인안함)
	int edit = 1;

	// 로그인 안했다면...
	if (ss_user_name.equals("")){
		edit = 3;

		//본인이 작성한 글이면 2가 되도록 변경
	} else if (ss_user_name.equals(CmmUtil.nvl(rDTO.getUser_name())));
	{
		edit = 2;
	}

	System.out.println("user_name : " + CmmUtil.nvl(rDTO.getUser_name()));
	System.out.println("ss_user_name : " + ss_user_name);
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

		// 수정하기
		function doEdit() {
			if ("<%=edit%>"==2) {
				location.href = "../market/market-modify?mk_seq=<%=CmmUtil.nvl(rDTO.getMk_seq())%>";

			} else if ("<%=edit%>"==3) {
				alert("로그인 하시길 바랍니다.");
			} else {
				alert("본인이 작성한 글만 수정 가능합니다.");
			}
		}

		// 삭제하기
		function doDelete() {
			if ("<%=edit%>"==2) {
				if (confirm("작성한 글을 삭제하시겠습니까?")) {
					location.href = "/market/deleteMarket?mk_seq=<%=CmmUtil.nvl(rDTO.getMk_seq())%>";
				}

			} else if ("<%=edit%>"==3) {
				alert("로그인 하시길 바랍니다.");
			} else {
				alert("본인이 작성한 글만 수정 가능합니다.");
			}
		}

		// 목록으로 이동
		function doList(){
			location.href = "/market/market-list"
		}


		/*$(function () {

			//목록 버튼
			$("#btnList").click(function () {
				location.href = "/market/market-list";
			});


			//수정 버튼
			$("#btnUpdate").click(function (<%--<%=edit%>--%>) {
				if (confirm("수정하시겠습니까?")) {
					document.form1.action = "/market/market-modify";
					document.form1.submit();
				}
			});


			//삭제 버튼
			$("#btnDelete").click(function (<%--<%=edit%>--%>) {
				if (confirm("삭제하시겠습니까?")) {
					document.form1.action = "deleteMarket";
					document.form1.submit();
				}
			});
		});*/



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

		.contact100-form-title {
			display: block;
			font-family: SourceSansPro-Bold;
			font-size: 30px;
			color: #333333;
			line-height: 1.2;
			text-align: left;
			padding-bottom: 34px;
		}

		.container {
			justify-content: center;
			max-width: 800px;
			margin: 0 auto;
			position: relative;
		}

		#contentForm {
			width: 40%;
			margin: 0 auto;
			padding-top: 12%;
		}

		.table > thead > tr > th, .table > tbody > tr > th {
			background-color: #e6ecff;
			text-align: center;
		}

		textarea {
			width: 100%;
			height: 6.25em;
			border: none;
			resize: none;
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
			<div class="wow-hr type_short">
			<span class="wow-hr-h">
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			</span>
			</div>
		</div>
		<div style="margin: 0 auto">
			<span class="contact100-form-title" style="text-align: center">
               게시물 보기
            </span>
			<form>
				<div class="input-group input-group-sm container" role="group" style="text-align:left">
					<table class="table table-striped table-bordered">
						<tread>
							<tr>
								<td align="center">제목</td>
								<td colspan="3"><%=CmmUtil.nvl(rDTO.getTitle())%>
								</td>
							</tr>
							<tr>
								<td align="center">작성일</td>
								<td><%=CmmUtil.nvl(rDTO.getMk_date())%>
								</td>
								<td align="center">조회수</td>
								<td><%=CmmUtil.nvl(rDTO.getRead_cnt())%>
								</td>
							</tr>
							<%--<tr>
                                <td colspan="4" height="300px" valign="top">
                                    <%=CmmUtil.nvl(mDTO.getContents()).replaceAll("\r\n", "<br/>") %>
                                </td>
                            <tr>--%>
							<div style="width:800px;">
								<td><textarea class="form-control" style="height: 400px" id="content" name="content"
											  rows="3" cols="80"
											  placeholder="내용을 입력하세요"><%=CmmUtil.nvl(rDTO.getContents()).replaceAll("\r\n", "<br/>") %></textarea>
								</td>
							</div>
						</tread>
					</table>

				</div>

			</form>
			<tr>
				<td align="center" colspan="4">
					<a href="javascript:doEdit();">[수정]</a>
					<a href="javascript:doDelete();">[삭제]</a>
					<a href="javascript:doList();">[목록]</a>
				</td>
			</tr>

			<!-- 마찬가지로 내용을 입력하도록 도움말을 출력함 -->
			<script>
				// ckeditor 적용
				//id가 content인 태그 (글의 내용을 입력하는 태그)를 ck에디터를 적용한다는 의미
				ClassicEditor.replace("content", {
					height: "300px"
				});

				ClassicEditor.replace("r_content", {
					height: "300px"
				});
			</script>
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
				function(){
					$(this).find('.captionshop').fadeIn(150);
				},
				function(){
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