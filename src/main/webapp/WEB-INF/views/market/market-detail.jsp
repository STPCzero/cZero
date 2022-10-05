<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

		$(function () {

			//목록 버튼
			$("#btnList").click(function () {
				location.href = "list.do";
			});


			//수정 버튼
			$("#btnUpdate").click(function () {
				if (confirm("수정하시겠습니까?")) {
					document.form1.action = "update.do";
					document.form1.submit();
				}
			});

//삭제 버튼
			$("#btnDelete").click(function () {
				if (confirm("삭제하시겠습니까?")) {
					document.form1.action = "delete.do";
					document.form1.submit();
				}
			});



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
			<!-- 게시물을 작성하기 위해 컨트롤러의 insert.do로 맵핑 -->
			<form id="form1" name="form1" method="post" action="${path}/board/insert.do">
				<div class="input-group input-group-sm container" role="group" style="text-align:left">
					<table class="table table-striped table-bordered">
						<tread>
							<tr>
								<c:forEach var="row" items="${map.list}">

							<tr>
								<td> 조회수 : ${dto.read_cnt}</td>
							</tr>
							<tr>
								<td>닉네임 : ${row.user_name}</td>
							</tr>

							<tr>
								<td>작성일자 : ${row.mk_date}</td>
							</tr>

							</tr>


							<tr>
								<td><input name="title" id="title" size="80"
										   value="${dto.title}"
										   placeholder="제목을 입력하세요" class="form-control" aria-describedby="basic-addon1">
								</td>
							</tr>

							<br><br>

							<!-- placeholder은 제목을 입력할 수 있도록 도움말을 출력함 -->
							<tr>
								<div style="width:800px;">
									<td><textarea class="form-control" style="height: 400px" id="content" name="content" rows="3" cols="80"
												  placeholder="내용을 입력하세요">${dto.content}</textarea></td>
								</div>
							</tr>
						</tread>
					</table>

				</div>

			</form>


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
			<div style="width:700px; text-align:center;">
				<!-- 수정, 삭제에 필요한 글번호를 hidden 태그에 저장한다. -->
				<input type="hidden" name="member_bno" value="${dto.member_bno }">

				<!-- 본인만 수정, 삭제 버튼을 표시한다. -->
				<c:if test="${sessionScope.user_id == dto.user_id or sessionScope.navername == dto.user_id or sessionScope.kakaonickname == dto.user_id or sessionScope.facebookname == dto.user_id}">
					<div class="btn-group btn-group-sm" role="group" aria-label="...">
						<div style="text-align:center;">

							<button type="submit" id="btnUpdate" class="btn btn-default">수정</button>
							<button type="button" id="btnDelete" class="btn btn-default">삭제</button>
							<!-- 글목록은 본인이 아니어도 확인 가능하게 한다. -->
							<button type="button" id="btnList" class="btn btn-default"><a href="market-list">목록</a></button>

						</div>
					</div>
				</c:if>


				<!-- 관리자에게는 삭제 버튼을 표시한다. -->
				<c:if test="${sessionScope.admin_id != null}">

					<div class="btn-group btn-group-sm" role="group" aria-label="...">
						<div style="text-align:center;">
							<button type="button" id="btnDelete" class="btn btn-default">삭제</button>
						</div>
					</div>
				</c:if>



			</div>

			<!-- 글목록은 본인이 아니어도 확인 가능하게 한다. -->

		</div>
		</form>
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