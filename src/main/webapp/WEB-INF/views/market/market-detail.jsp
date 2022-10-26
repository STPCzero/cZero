<%@ page import="kopo.poly.dto.MarketDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.NoticeDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%
	MarketDTO dDTO = (MarketDTO)request.getAttribute("dDTO");

	// 상품 정보를 못불러왔다면, 객체 생성
	if (dDTO==null) {
		dDTO = new MarketDTO();

	}

	String ss_user_seq = CmmUtil.nvl((String) session.getAttribute("SESSION_USER_SEQ"));

	// 본인이 작성한 글만 수정 가능하도록 하기(1: 작성자 아님 / 2: 본인이 작성한 글 / 3: 로그인안함)
	int edit = 1;

	//로그인 안했다면
	if (ss_user_seq.equals("")){
		edit = 3;

		// 본인이 작성한 글이면 2가 되도록 변경
	} else if (ss_user_seq.equals(CmmUtil.nvl(dDTO.getUser_seq()))){
		edit = 2;

	}

	System.out.println("user_seq : " + CmmUtil.nvl(dDTO.getUser_seq()));
	System.out.println("ss_user_seq : " + ss_user_seq);

%>--%>
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

<%--
<script type="text/javascript">

	// 수정하기
	function doEdit() {
		if ("<%=edit%>==2") {
			location.href = "/market/MarketEditInfo?mSeq = <%= CmmUtil.nvl(dDTO.getMk_seq())%>";
		}
	} else if ("<%=edit%>"==3){
				alert("로그인 하시길 바랍니다.");

			}else {
				alert("본인이 작성한 글만 수정 가능합니다,");

			}

		}
		// 삭제하기
		function doDelete() {
			if ("<%=edit%>==2") {
				if (confirm("작성한 글만 삭제하시겠습니까?")) {
					location.href = "/market/MarketDelete?mSeq = <%= CmmUtil.nvl(dDTO.getMk_seq())%>";
				}
			}else if ("<%=edit%>"==3){
				alert("로그인 하시길 바랍니다.");

			}else {
				alert("본인이 작성한 글만 수정 가능합니다,");

			}
		}

		// 목록으로 이동
		function doList() {
			location.href = "market-list.jsp"
		}
	</script>
</script>
--%>

<%--<%@ page import="kopo.poly.dto.MarketDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.NoticeDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	NoticeDTO dDTO = (NoticeDTO)request.getAttribute("dDTO");

	// 상품 정보를 못불러왔다면, 객체 생성
	if (dDTO==null) {
		dDTO = new NoticeDTO();

	}

	String ss_user_name = CmmUtil.nvl((String) session.getAttribute("SESSION_USER_NAME"));

	// 본인이 작성한 글만 수정 가능하도록 하기(1: 작성자 아님 / 2: 본인이 작성한 글 / 3: 로그인안함)
	int edit = 1;

	//로그인 안했다면
	if (ss_user_name.equals("")){
		edit = 3;

		// 본인이 작성한 글이면 2가 되도록 변경
	} else if (ss_user_name.equals(CmmUtil.nvl(dDTO.getUser_name()))){
		edit = 2;

	}

	System.out.println("user_name : " + CmmUtil.nvl(dDTO.getUser_name()));
	System.out.println("ss_user_name : " + ss_user_name);

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

	<script type="text/javascript">

		// 수정하기
		function doEdit() {
			if ("<%=edit%>==2") {
				location.href = "/market/MarketEditInfo?mSeq = <%= CmmUtil.nvl(dDTO.getUser_name())%>";

			}else if ("<%=edit%>"==3){
				alert("로그인 하시길 바랍니다.");

			}else {
				alert("본인이 작성한 글만 수정 가능합니다,");

			}

		}
		// 삭제하기
		function doDelete() {
			if ("<%=edit%>==2") {
				if (confirm("작성한 글만 삭제하시겠습니까?")) {
					location.href = "/market/MarketDelete?mSeq = <%= CmmUtil.nvl(dDTO.getUser_name())%>";
				}
			}else if ("<%=edit%>"==3){
				alert("로그인 하시길 바랍니다.");

			}else {
				alert("본인이 작성한 글만 수정 가능합니다,");

			}
		}

		// 목록으로 이동
		function doList() {
			location.href = "market-list.jsp"
		}
	</script>--%>

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
				<li class="propClone"><a href="api">Bicycle</a></li>
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
	<div class="wrap-contact100">
		<form class="contact100-form">
				<span class="contact100-form-title">
					내 물건 올리기
				</span>

			<div class="wrap-input100">
				<input class="input100" type="text" name="name" placeholder="제목을 입력해 주세요">
				<span class="focus-input100"></span>
			</div>

			<div class="wrap-input100">
				<textarea class="input100" name="message" style="resize: none;" placeholder="물건 설명을 입력해 주세요"></textarea>
				<span class="focus-input100"></span>
			</div>
			<div>
				<label>사진 첨부</label>
				<input type="file" name="file" >
			</div>

			<div class="container-contact100-form-btn" style="margin-top: 20%">
				<button class="contact100-form-btn" style="margin-left: 10%; float: left">
					<a href="market-list">되돌리기</a>
				</button>
				<button class="contact100-form-btn" style="margin-left: 25%; float: left">
					<a href="market-list">물건 올리기</a>
				</button>
			</div>
		</form>
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