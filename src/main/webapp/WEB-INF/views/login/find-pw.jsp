<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>비밀번호 찾기</title>

    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../assets/css/form-elements.css">
    <link rel="stylesheet" href="../assets/css/style.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">


</head>

<body>

<!-- Top menu -->
<nav class="navbar navbar-inverse navbar-no-bg" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="login.jsp"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->

    </div>
</nav>

<!-- Top content -->
<div class="top-content">
    <div class="container">


        <div class="row">
            <div class="col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3 form-box">
                <form role="form" action="" method="post" class="f1">

                    <h3>비밀번호 찾기</h3>
                    <p>회원가입시 입력하신 아이디와 이메일을 입력해주세요</p>



                    <fieldset>
                        <div class="form-group">
                            <label class="sr-only" for="user_id">아이디</label>
                            <input type="text" name="user_id" placeholder="아이디" class="f1-last-name form-control" id="user_id">
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="user_email">이메일</label>
                            <input type="text" name="user_email" placeholder="이메일" class="f1-last-name form-control" id="user_email">
                        </div>
                        <div class="f1-buttons">
                            <span>
                                <button type="button" class="btn" style="float: left"><a href="find-id">아이디 찾기</a></button>
                            </span>
                            <button type="button" class="btn btntext"><a href="register">로그인</a></button>
                            <button type="button" class="btn btn-next">다음</button>
                        </div>
                    </fieldset>


                </form>
            </div>
        </div>

    </div>
</div>


<!-- Javascript -->
<script src="../assets/js/jquery-1.11.1.min.js"></script>
<script src="../assets/bootstrap/js/bootstrap.min.js"></script>
<script src="../assets/js/jquery.backstretch.min.js"></script>
<script src="../assets/js/retina-1.1.0.min.js"></script>
<script src="../assets/js/scripts.js"></script>

<!--[if lt IE 10]>
<script src="../assets/js/placeholder.js"></script>
<![endif]-->

</body>

</html>