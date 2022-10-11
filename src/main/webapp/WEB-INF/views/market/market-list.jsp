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
	<div class="row">
		<div class="col-md-4">
			<div class="productbox">
				<div class="fadeshop">
					<div class="captionshop text-center" style="display: none;">
						<h3>Item Name</h3>
						<p>
							 This is a short excerpt to generally describe what the item is about.
						</p>
						<p>
							<a href="#" class="learn-more detailslearn"><i class="fa fa-shopping-cart"></i> Purchase</a>
							<a href="#" class="learn-more detailslearn"><i class="fa fa-link"></i> Details</a>
						</p>
					</div>
					<span class="maxproduct"><img src="/images/product1-1.jpg" alt=""></span>
				</div>
				<div class="product-details">
					<a href="#">
					<h1>Calypso Theme</h1>
					</a>
					<span class="price">
					<span class="edd_price">$49.00</span>
					</span>
				</div>
			</div>
		</div>
		<!-- /.productbox -->
		<div class="col-md-4">
			<div class="productbox">
				<div class="fadeshop">
					<div class="captionshop text-center" style="display: none;">
						<h3>Item Name</h3>
						<p>
							 This is a short excerpt to generally describe what the item is about.
						</p>
						<p>
							<a href="#" class="learn-more detailslearn"><i class="fa fa-shopping-cart"></i> Purchase</a>
							<a href="#" class="learn-more detailslearn"><i class="fa fa-link"></i> Details</a>
						</p>
					</div>
					<span class="maxproduct"><img src="/images/product2.jpg" alt=""></span>
				</div>
				<div class="product-details">
					<a href="#">
					<h1>FastSell Theme</h1>
					</a>
					<span class="price">
					<span class="edd_price">$49.00</span>
					</span>
				</div>
			</div>
		</div>
		<!-- /.productbox -->
		<div class="col-md-4">
			<div class="productbox">
				<div class="fadeshop">
					<div class="captionshop text-center" style="display: none;">
						<h3>Item Name</h3>
						<p>
							 This is a short excerpt to generally describe what the item is about.
						</p>
						<p>
							<a href="#" class="learn-more detailslearn"><i class="fa fa-shopping-cart"></i> Purchase</a>
							<a href="#" class="learn-more detailslearn"><i class="fa fa-link"></i> Details</a>
						</p>
					</div>
					<span class="maxproduct"><img src="/images/product2-3.jpg" alt=""></span>
				</div>
				<div class="product-details">
					<a href="#">
					<h1>Biscaya Theme</h1>
					</a>
					<span class="price">
					<span class="edd_price">$49.00</span>
					</span>
				</div>
			</div>
		</div>
		<!-- /.productbox -->
	</div>
	<div class="row">
		<div class="col-md-4">
			<div class="productbox">
				<div class="fadeshop">
					<div class="captionshop text-center" style="display: none;">
						<h3>Item Name</h3>
						<p>
							 This is a short excerpt to generally describe what the item is about.
						</p>
						<p>
							<a href="#" class="learn-more detailslearn"><i class="fa fa-shopping-cart"></i> Purchase</a>
							<a href="#" class="learn-more detailslearn"><i class="fa fa-link"></i> Details</a>
						</p>
					</div>
					<span class="maxproduct"><img src="/images/product1.jpg" alt=""></span>
				</div>
				<div class="product-details">
					<a href="#">
					<h1>Expertum Theme</h1>
					</a>
					<span class="price">
					<span class="edd_price">$35.00</span>
					</span>
				</div>
			</div>
		</div>
		<!-- /.productbox -->
		<div class="col-md-4">
			<div class="productbox">
				<div class="fadeshop">
					<div class="captionshop text-center" style="display: none;">
						<h3>Item Name</h3>
						<p>
							 This is a short excerpt to generally describe what the item is about.
						</p>
						<p>
							<a href="#" class="learn-more detailslearn"><i class="fa fa-shopping-cart"></i> Purchase</a>
							<a href="#" class="learn-more detailslearn"><i class="fa fa-link"></i> Details</a>
						</p>
					</div>
					<span class="maxproduct"><img src="/images/product2-2.jpg" alt=""></span>
				</div>
				<div class="product-details">
					<a href="#">
					<h1>Serenity Theme</h1>
					</a>
					<span class="price">
					<span class="edd_price">$49.00</span>
					</span>
				</div>
			</div>
		</div>
		<!-- /.productbox -->
		<div class="col-md-4">
			<div class="productbox">
				<div class="fadeshop">
					<div class="captionshop text-center" style="display: none;">
						<h3>Item Name</h3>
						<p>
							 This is a short excerpt to generally describe what the item is about.
						</p>
						<p>
							<a href="#" class="learn-more detailslearn"><i class="fa fa-shopping-cart"></i> Purchase</a>
							<a href="#" class="learn-more detailslearn"><i class="fa fa-link"></i> Details</a>
						</p>
					</div>
					<span class="maxproduct"><img src="/images/product3.png" alt=""></span>
				</div>
				<div class="product-details">
					<a href="#">
					<h1>Hypnosa Theme</h1>
					</a>
					<span class="price">
					<span class="edd_price">$35.00</span>
					</span>
				</div>
			</div>
		</div>
		<!-- /.productbox -->
	</div>
</div>
</div>
	<form class="contact100-form">
	<div class="container-contact100-form-btn">
		<nav aria-label="...">
			<ul class="pagination">
				<li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
				<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
			</ul>
		</nav>
		<button class="contact100-form-btn">
			<a href="market-upload">물건 올리기</a>
		</button>
	</div>
	</form>
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