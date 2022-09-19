<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Dosis:200,300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto:200,300,400,500,600,700" rel="stylesheet">

	<script type="text/javascript" src="/js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="/js/paging.js"></script>
	<script type="text/javascript">
		/* 페이지 이동 ( 페이징 처리 callback 함수 ) */
		fncGoLink = function(currPage, pageSize, section){
			$("input[name='currPage']").val(currPage);
			$("input[name='pageSize']").val(pageSize);
			if(section === 'PC') $("#dev_nodeList").empty();
			fncListSearch();	// 목록 조회 함수 호출
		};

		/* 목록 조회 함수 */
		fncListSearch = function(){
			$.ajax({
				type   : 'POST',
				url    : 'searchUrl 세팅',
				data   : $('form').serialize(),
				success: function(data){
					// 페이징 처리 ( parameter : target, 리스트 전체 개수, 리스트 전체, 현재 페이지, callback 함수명 )
					customPaging('.paginate', data.totCnt, data.list, $("input[name='currPage']").val(), 'fncSearchLinkList');

					// 리스트 그리기 ...
					// .....
					$('.listBody').append('리스트 html');
				}
			});
		};
	</script>

	<style>
		.paginate {margin-top: 7px;}
		.paginate a.viewMore {display: block;cursor: pointer;text-align: center;padding: 12px;color: #3c63e0;}
		.paginate a.viewMore span {font-size: 14px;}
		.paginate a.viewMore span:after {display: inline-block;content:"";width: 11px;height:10px;margin: 0px 0 0 5px;vertical-align: middle;background:url(../images/common/common_sfix_icon.png) no-repeat -350px 0;}
		.paginate a.viewMore.open span:after {display: inline-block;content:"";width: 11px;height:10px;margin: 0px 0 0 5px;vertical-align: middle;background:url(../images/common/common_sfix_icon.png) no-repeat -400px 0;}

		.paginate.num {margin-top: 7px;text-align: center;}
		.paginate.num > a {display:inline-block;vertical-align:middle;overflow:hidden;width: 37px;height: 36px;font-size:0;text-indent:-120%;color:transparent;background: url("../images/common/common_sfix_icon.png");border: 1px solid #c8c8c8;}
		.paginate.num > a.first {background-position:-100px -350px;}
		.paginate.num > a.prev {background-position: -236px -188px;margin-right: -4px;border-right: none;}
		.paginate.num > a.next {background-position: -285px -188px;margin-left: -4px;border-left: none;}
		.paginate.num > a.last {background-position:-250px -350px;}
		.paginate.num > a.prev.inactive {background-position: -336px -188px;pointer-events: none;}
		.paginate.num > a.next.inactive {background-position: -385px -188px;pointer-events: none;}

		.paginate.num ol {display:inline-block;vertical-align:middle;}
		.paginate.num ol:after {display:block;content:"";clear:both;}
		.paginate.num ol li {float:left;margin-left: -1px;border-top: 1px solid #c8c8c8;border-bottom: 1px solid #c8c8c8;border-left: 1px solid #e7e7e7;border-right: 1px solid #e7e7e7;width: 37px;height: 36px;}
		.paginate.num ol li:first-child {margin-left:0;}
		.paginate.num ol li a {display:block;width: 100%;height: 100%;line-height: 33px;font-size: 15px;text-align: center;}
		.paginate.num ol li a:hover {text-decoration: none;}
		.paginate.num ol li.curpage {color: #ffffff;border: 1px solid #303030;background: #555555;}
		.paginate.num ol li.curpage a {color: #ffffff;}
		.paginate.num ol li.curpage + li {border-left: 1px solid #303030;}
		.paginate.num ol li:hover {color: #ffffff;border: 1px solid #303030;background: #555555;}
		.paginate.num ol li:hover + li {border-left: 1px solid #303030;}
		.paginate.num ol li:hover a {color: #ffffff;}
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
					<span class="maxproduct"><img src="images/product1-1.jpg" alt=""></span>
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
					<span class="maxproduct"><img src="images/product2.jpg" alt=""></span>
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
					<span class="maxproduct"><img src="images/product2-3.jpg" alt=""></span>
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
					<span class="maxproduct"><img src="images/product1.jpg" alt=""></span>
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
					<span class="maxproduct"><img src="images/product2-2.jpg" alt=""></span>
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
					<span class="maxproduct"><img src="images/product3.png" alt=""></span>
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

	<form>
		<input type="hidden" name="currPage" />
		<input type="hidden" name="pageSize" />
	</form>
	<div class="listHead">
		.... list head content ....
	</div>
	<div class="listBody">
		.... list body content ....
	</div>
	<div class="listFooter">
		<div class="paginate"></div>
	</div>
</section>

<!-- Load JS here for greater good =============================-->
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