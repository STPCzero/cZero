<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/td-awesome/4.6.3/css/td-awesome.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="https://tds.googleapis.com/css?family=Dosis:200,300,400,500,600,700" rel="stylesheet">
<link href="https://tds.googleapis.com/css?family=Roboto:200,300,400,500,600,700" rel="stylesheet">
</head>
<body>
<style>

</style>

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
			<%--<a href="index.jsp" class="navbar-brand brand"> SCORILO </a>--%>
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
				<div>
					<div class="text-homeimage maintext-image titletd" data-scrollreveal="enter top over 1.5s after 0.1s" >
						탄소중립이란?
					</div>
					<div class="text-homeimage2 subtext-image titletd2" data-scrollreveal="enter bottom over 1.7s after 0.3s" >
						 <strong>이산화탄소 배출량만큼 흡수량도 늘려 실질적인 <br>이산화탄소 배출량을 ‘0(zero)’으로 만든다는 개념</strong>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</header>


<!-- STEPS =============================-->
<div class="item content">
	<div class="container toparea">
		<div class="row text-center">
			<div class="col-md-4">
				<div class="col editContent">
					<span class="numberstep"><i class="fa "><img src="/images/market.png" style="width: 55%; height: 55%;"></i></span>
					<h3 class="numbertext">플리마켓</h3>
					<p>
						 <strong>여러가지 물품을 주고 사고파는 플리마켓을 통해 <br>환경을 지키고 소중한 추억도 쌓아보세요</strong>
					</p>
				</div>
				<!-- /.col-md-4 -->
			</div>
			<!-- /.col-md-4 col -->
			<div class="col-md-4 editContent">
				<div class="col">
					<span class="numberstep"><i class="fa"><img src="/images/list.png" style="width: 60%; height: 60%; margin-bottom: 5%"></i></span>
					<h3 class="numbertext">체크리스트</h3>
					<p>
						 <strong>매일매일 지키는 탄소중립 체크리스트로 <br>의미있는 하루를 보내세요</strong>
					</p>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.col-md-4 col -->
			<div class="col-md-4 editContent">
				<div class="col">
					<span class="numberstep"><i class="fa "><img src="/images/bicycle.png" style="width: 65%; height: 65%; margin-bottom: 8%; margin-left: 3%"></i></span>
					<h3 class="numbertext">공공 자전거</h3>
					<p>
						 <strong>도시 곳곳의 공공 자전거를 이용해 <br>탄소중립을 실천해보세요</strong>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- SCRIPTS =============================-->
<script src="js/jquery-.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/anim.js"></script>
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
	
</body>
</html>