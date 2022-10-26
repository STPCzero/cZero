<%@ page import="static javax.servlet.http.MappingMatch.PATH" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="generator" content="">
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
	<link href="../css/style.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Roboto:200,300,400,500,600,700" rel="stylesheet">

    <script type="text/javascript">

        function doOnload() {
            //전송시 유효성 체크
            function doSubmit(f) {
                if (f.title.value == "") {
                    alert("제목을 입력하시기 바랍니다.");
                    f.title.focus();
                    return false;
                }

                if (f.contents.value == "") {
                    alert("내용을 입력하시기 바랍니다.");
                    f.contents.focus();
                    return false;
                }
            }
        }
    </script>
	<style>
		.wrap-contact100 {
			width: 104%;
			background: #fff;
			border-radius: 10px;
			overflow: hidden;
			padding: 7% 15% 5%;

			box-shadow: 0 3px 20px 0px rgba(0, 0, 0, 0.1);
			-moz-box-shadow: 0 3px 20px 0px rgba(0, 0, 0, 0.1);
			-webkit-box-shadow: 0 3px 20px 0px rgba(0, 0, 0, 0.1);
			-o-box-shadow: 0 3px 20px 0px rgba(0, 0, 0, 0.1);
			-ms-box-shadow: 0 3px 20px 0px rgba(0, 0, 0, 0.1);
		}


		.contact100-form {
			width: 100%;
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

		button {
			outline: none !important;
			border: none;
			background: transparent;
		}

		button:hover {
			cursor: pointer;
		}

		.wrap-input100 {
			width: 100%;
			position: relative;
			background-color: #fff;
			border-radius: 20px;
			margin-bottom: 30px;
		}

		.input100 {
			display: block;
			width: 100%;
			background: transparent;
			font-family: SourceSansPro-Bold;
			font-size: 16px;
			color: #4b2354;
			line-height: 1.2;
			outline: none;
		}


		.focus-input100 {
			display: block;
			position: absolute;
			width: 100%;
			height: 100%;
			top: 0;
			left: 0;
			pointer-events: none;
			border-radius: 20px;
			box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.05);
			-moz-box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.05);
			-webkit-box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.05);
			-o-box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.05);
			-ms-box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.05);

			-webkit-transition: all 0.4s;
			-o-transition: all 0.4s;
			-moz-transition: all 0.4s;
			transition: all 0.4s;
		}

		.input100:focus + .focus-input100 {
			box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.15);
			-moz-box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.15);
			-webkit-box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.15);
			-o-box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.15);
			-ms-box-shadow: 0 5px 20px 0px rgba(0, 0, 0, 0.15);
		}

		input.input100 {
			height: 62px;
			padding: 0 20px 0 23px;
		}


		textarea.input100 {
			min-height: 350px;
			padding: 19px 20px 0 23px;
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


		input {
			outline: none;
			border: none;
		}

		textarea {
			outline: none;
			border: none;
		}

		.container {
			justify-content: center;
			max-width: 800px;
			margin: 0 auto;
			position: relative;
		}

		.ck-editor__editable {
			height: 400px;
		}

		body {
			box-sizing: border-box;
			margin: 0px;
			font-family: Consolas, monospace;
		}

		.jb-container {
			display: flex;
			justify-content: center;
			align-items: center;
		}

	</style>


</head>
<body onload="doOnload();">

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
				<li class="propClone"><a href="index">Home</a></li>
				<li class="propClone"><a href="market-list">Market</a></li>
				<li class="propClone"><a href="product">Checklist</a></li>
				<li class="propClone"><a href="checkout">Api</a></li>
				<li class="propClone"><a href="contact">Mypage</a></li>
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
            <span class="contact100-form-title" style="text-align: center">
               내 상품 등록하기
            </span>

				<%--   <div class="wrap-input100">
                      <input class="input100" type="text" name="name" placeholder="제목을 입력해 주세요">
                      <span class="focus-input100"></span>
                   </div>
          --%>
				<%--<div class="wrap-input100 ck-editor__editable">
                   <textarea class="input100" name="text" id="editor" style="resize: none;" placeholder="물건 설명을 입력해 주세요"></textarea>
                   <span class="focus-input100"></span>
                </div>
                <div>
                   <label>사진 첨부</label>
                   <input type="file" name="file" >
                </div>--%>
				<%--<form action="" method="POST">
                   <textarea name="text" id="editor"></textarea>
                   <p><input type="submit" value="전송"></p>
                </form>--%>

				<script src="../js/ckeditor/ckeditor.js"></script>

                <form name="f" method="post" action="/market/marketInsert" target= "ifrPrc" onsubmit="return doSubmit(this);">
				<div class="container" >
					<div class="content" style="width: 70%;">

						<div class="row justify-content-md-center jb-container">
							<div class="col_c" style="margin-bottom: 30px">
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<label class="input-group-text">제목</label>
									</div>
									<input type="text" class="form-control" name="title" id="title"
										   style="width: 325%; "
										   value="${MarketDTO.title}"
										   placeholder="제목을 입력하세요" class="form-control" aria-describedby="basic-addon1">
								</div>
								<hr>
								<div class="input-group">
									<textarea class="form-control" value="${MarketDTO.contents}" placeholder="내용을 입력하세요" id="editor" name="content"></textarea>
									<%--<script type="text/javascript"> CKEDITOR.replace('p_content',
                                            {
                                                height: 500 }) </script>--%>
									<script>
										ClassicEditor.create(document.querySelector('#editor', {
											height: 500, width: 600
										}));
									</script>
								</div>
							</div>
						</div>
						<div class="row justify-content-md-center">
							<button type="submit" class="btn btn-outline-secondary"
									style="width: 20%; font-weight: bold">
								<a href="market-list">뒤로가기</a>
							</button>
							<%--<button type="submit" class="btn btn-outline-secondary"
									style="width: 20%; font-weight: bold">
								<a href="market-list">등록</a>
							</button>--%>
							<input type="submit" value="등록" class="btn btn-outline-secondary" style="width: 20%; font-weight: bold" />
						</div>
					</div>
				</div>
                </form>
                <!-- 프로세스 처리용 iframe / form 태그에서 target을 iframe으로 한다. -->
                <iframe name="ifrPrc" style="display:none"></iframe>


				<%--<div class="container-contact100-form-btn" style="margin-top: 20%">
                    <button class="contact100-form-btn" style="margin-left: 10%; float: left">
                        <a href="market-list">되돌리기</a>
                    </button>
                    <button class="contact100-form-btn" style="margin-left: 25%; float: left">
                        <a href="market-list">물건 올리기</a>
                    </button>
                </div>--%>
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
				function () {
					$(this).find('.captionshop').fadeIn(150);
				},
				function () {
					$(this).find('.captionshop').fadeOut(150);
				}
		);
	});
</script>
<br>
<br>
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