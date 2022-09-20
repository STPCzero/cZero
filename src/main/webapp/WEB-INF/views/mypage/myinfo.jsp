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
        .mypage-btn {
            width: 100%;
            padding: 14px 10px;
            background: #333;
            color: #fff;
            border: 1px solid #333;
            font-size: 16px;
            font-weight: 700;
            text-transform: uppercase;
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
                            My Page
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
                <h1 class="text-center latestitems">내 정보 수정</h1>
            </div>
            <div class="wow-hr type_short">
			<span class="wow-hr-h">
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			</span>
            </div>
        </div>
        <div id="edd_checkout_wrap" class="col-md-8 col-md-offset-2">
            <div id="edd_checkout_form_wrap" class="edd_clearfix">
                <form id="edd_purchase_form" class="edd_form" action="#" method="POST">
                    <fieldset id="edd_checkout_user_info">
                        <legend>Personal Info</legend>
                        <p id="edd-first-name-wrap">
                            <label class="edd-label" for="edd-first">
                                Name <span class="edd-required-indicator">*</span>
                            </label>
                            <input class="edd-input required" type="text" name="edd_first" placeholder="First name" id="edd-first" value="" required="">
                        </p>
                        <p id="edd-email-wrap">
                            <label class="edd-label" for="edd-email">
                                Email Address <span class="edd-required-indicator">*</span></label>
                            <input class="edd-input required" type="email" name="edd_email" placeholder="Email address" id="edd-email" value="">
                        </p>
                    </fieldset>
                    <input type="submit" id="submit" class="clearfix mypage-btn" value="수정하기">
                </form>
            </div>
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
</body>
</html>