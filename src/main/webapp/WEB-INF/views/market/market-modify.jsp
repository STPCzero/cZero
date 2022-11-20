<%@ page import="static javax.servlet.http.MappingMatch.PATH" %>
<%@ page import="kopo.poly.dto.MarketDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.UserInfoDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    MarketDTO mDTO = (MarketDTO)request.getAttribute("mDTO");
    UserInfoDTO uDTO = (UserInfoDTO)request.getAttribute("uDTO");

//공지글 정보를 못불러왔다면, 객체 생성
    if (uDTO==null){
        uDTO = new UserInfoDTO();

    }

    int access = 1; //(작성자 : 2 / 다른 사용자: 1)

    if (CmmUtil.nvl((String)session.getAttribute("SESSION_USER_SEQ")).equals(
            CmmUtil.nvl(uDTO.getUser_seq()))){
        access = 2;
    }
%>
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
            <a href="/index"><img src="/images/Czero.png" style="width: 135px; height: 60px; margin-top: 5px" alt="로고"></a>
        </div>
        <div id="navbar-collapse-02" class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="propClone"><a href="/market/market-list">Market</a></li>
                <li class="propClone"><a href="/news/news">News</a></li>
                <li class="propClone"><a href="/bicycle/bicycle">Bicycle</a></li>
                <li class="propClone"><a href="/mypage/myinfo">Mypage</a></li>
                <li class="propClone"><a href="/login/login">Login</a></li>
                <li class="propClone"><a href="">Logout</a></li>
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
            <span class="contact100-form-title" style="text-align: center">
               내 상품 수정하기
            </span>
                <form class="contact100-form" name="f" method="post" action="marketUpdate" onsubmit="return doSubmit(this);" enctype="multipart/form-data" >

                    <script src="../js/ckeditor/ckeditor.js"></script>

                    <input type="hidden" name="mk_seq" value="<%=CmmUtil.nvl(request.getParameter("mk_seq")) %>" />
                <div class="container" >
                    <div class="content" style="width: 70%; display: flex; text-align: center">

                        <div class="row justify-content-md-center jb-container">
                            <div class="col_c" style="margin-bottom: 30px">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text">제목</label>
                                    </div>
                                    <input type="text" class="form-control" name="title" id="title"
                                           style="width: 325%; "
                                           value="<%=CmmUtil.nvl(mDTO.getTitle()) %>"
                                           class="form-control" aria-describedby="basic-addon1">
                                    <br><br>
                                    <div class="input-group-prepend">
                                        <label class="input-group-text">가격</label>
                                    </div>
                                    <input type="text" class="form-control" name="price" id="price"
                                           style="width: 75%; "
                                           value="<%=CmmUtil.nvl(String.valueOf(mDTO.getPrice())) %>"
                                           class="form-control" aria-describedby="basic-addon1">
                                </div>
                                <hr>
                                <div class="input-group">
                                    <textarea class="form-control" id="contents" name="contents"><%=CmmUtil.nvl(mDTO.getContents()) %></textarea>

                                    <script>
                                        CKEDITOR.replace('contents',
                                            {height: 500, width: 600,
                                                filebrowserUploadUrl:'/image/upload'
                                            });
                                    </script>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                    <button type="button" class="btn btn-outline-secondary"
                            style="width: 20%; font-weight: bold" onclick="location='market-list'">
                        뒤로가기
                    </button>
                    <button type="submit"  class="btn btn-primary"  style="width: 20%; font-weight: bold">
                        등록하기</button>
                </form>


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
<script type="text/javascript">

    //작성자 여부체크
    function doOnload(){

        if ("<%=access%>"=="1"){
            alert("작성자만 수정할 수 있습니다.");
            location.href="/market/market-list";

        }
    }

    //전송시 유효성 체크
    function doSubmit(f){
        if(f.title.value == ""){
            alert("제목을 입력하시기 바랍니다.");
            f.title.focus();
            return false;
        }

        if(calBytes(f.title.value) > 200){
            alert("최대 200Bytes까지 입력 가능합니다.");
            f.title.focus();
            return false;
        }

        if(f.price.value == ""){
            alert("가격을 입력하시기 바랍니다.");
            f.price.focus();
            return false;
        }

        // 입력 내용 받기 = CKEDITOR.instances.textarea태그의id.getData();
        if(CKEDITOR.instances.contents.getData() ==''
            || CKEDITOR.instances.contents.getData().length ==0){
            alert("내용을 입력해주세요.");
            $("#contents").focus();
            return false;
        }

    }


    //글자 길이 바이트 단위로 체크하기(바이트값 전달)
    function calBytes(str){

        var tcount = 0;
        var tmpStr = new String(str);
        var strCnt = tmpStr.length;

        var onechar;
        for (i=0;i<strCnt;i++){
            onechar = tmpStr.charAt(i);

            if (escape(onechar).length > 4){
                tcount += 2;
            }else{
                tcount += 1;
            }
        }

        return tcount;
    }

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