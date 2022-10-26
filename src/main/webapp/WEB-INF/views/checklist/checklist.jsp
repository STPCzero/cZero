<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		@media screen and (width: 500px) {
			fieldset div{
				max-width: 70em;margin-left: 50px;;
			}
		}
	</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:200,300,400,500,600,700" rel="stylesheet">
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
							Check List
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
			<h1 class="text-center latestitems">To DO List</h1>
		</div>
		<div class="wow-hr type_short">
			<span class="wow-hr-h">
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			</span>
		</div>
	</div>
	<form>
		<form >
			<fieldset class="form-group">
				<div style="max-width: 500px;margin-left: auto; margin-right: auto">
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="1" id="01">
					<label class="form-check-label" for="01">
						여름엔 26℃ 이상, 겨울엔 20℃ 이하로 유지하기.
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="" id="02">
					<label class="form-check-label" for="02">
						가전제품 플러그를 뽑아 두기.
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="" id="03">
					<label class="form-check-label" for="03">
						걷기 > 자전거 타기 > 대중교통 이용을 생활화하기.
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="" id="04">
					<label class="form-check-label" for="04">
						장바구니를 이용하기.
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="" id="05">
					<label class="form-check-label" for="05">
						설거지통 이용하기.
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="" id="06">
					<label class="form-check-label" for="06">
						퇴근 시 전기 플러그를 뽑기.
					</label>
				</div>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="" id="07">
					<label class="form-check-label" for="07">
						계단 이용하기.
					</label>
				</div>
				<div class="wow-hr type_short">
					<span class="wow-hr-h">
					</span>
				</div>
				<div class="col-md-4">
					<input type="submit" class="btn btn-buynow" style="" value="SAVE" id="00">
				</div>
				</div>
			</fieldset>
		</form>
	</form>
</div>
</section>

<!-- FOOTER =============================-->
<div class="footer text-center" style="width: 100%; position: fixed; bottom: 0;">
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
<script src="js/jquery-.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/anim.js"></script>

</body>
</html>