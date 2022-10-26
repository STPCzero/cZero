<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.UserInfoDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="static org.apache.coyote.http11.Constants.a" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    List<UserInfoDTO> uList = (List<UserInfoDTO>) request.getAttribute("uList");
    if (uList == null) {
        uList = new ArrayList<>();
    }

%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원가입 페이지</title>

    <!-- CSS -->
    <link rel="stylesheet" href="http://tds.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/td-awesome/css/td-awesome.min.css">
    <link rel="stylesheet" href="../assets/css/form-elements.css">
    <link rel="stylesheet" href="../assets/css/style.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <script src="/js/jquery-3.6.1.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript">
        // function regUserCheck() {
        //     if ($("#f1-id".val().trim() === "") {
        //         alert "이름 입력하세요";
        //         return false;
        //     }
        //     if ($("#f1-id".val().trim() === "") {
        //         alert "아이디를 입력하세요";
        //         return false;
        //     }
        //     if ($("#f1-id".val().trim() === "") {
        //         alert "비밀번호를 입력하세요";
        //         return false;
        //     }
        //     if ($("#f1-id".val().trim() === "") {
        //         alert "비밀번호 확인을 입력하세요";
        //         return false;
        //     }
        //     if ($("#f1-id".val().trim() === "") {
        //         alert "이메일을 입력하세요";
        //         return false;
        //     }
        // }
        function doRegUserCheck() {

            console.log("fuck");
            if (f.user_id.value ===""){
                alert("아이디를 입력하세요.");
                f.user_id.focus();
                return false;
            }
            if (f.user_pw.value ===""){
                alert("아이디를 입력하세요.");
                f.user_pw.focus();
                return false;
            }
            if (f.check_pw.value ===""){
                alert("아이디를 입력하세요.");
                f.check_pw.focus();
                return false;
            }
            if (f.user_name.value ===""){
                alert("아이디를 입력하세요.");
                f.user_name.focus();
                return false;
            }
            if (f.user_email.value ===""){
                alert("아이디를 입력하세요.");
                f.user_email.focus();
                return false;
            }
            if (f.user_pw.value !== f.check_pw.value){
                alert("비밀번호 확인이 일치하지 않습니다.");
                f.user_email.focus();
                return false;
            }
        }

</script>
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


        <div class="row" style="margin-top: 10%">
            <div class="col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3 form-box">
                    <form role="form" method="post" class="f1" name="f" action="insertUserInfo">

                    <h3>저희 사이트를 방문해주셔서 감사합니다</h3>
                    <p>회원가입을 위해 정보를 입력해주세요</p>
                    <div class="f1-steps">
                        <div class="f1-progress">
                            <div class="f1-progress-line" data-now-value="25" data-number-of-steps="2"
                                 style="width:25%;"></div>
                        </div>
                        <div class="f1-step active">
                            <div class="f1-step-icon"><i class="fa fa-user"></i></div>
                            <p>sign up</p>
                        </div>
                        <div class="f1-step">
                            <div class="f1-step-icon"><i class="fa fa-desktop"></i></div>
                            <p>complete</p>
                        </div>
                    </div>

                    <fieldset>
                        <h4>정보를 입력해주세요</h4>
                        <div class="form-group">
                            <label class="sr-only" for="user_name">이름</label>
                            <input type="text" name="user_name" placeholder="이름" class="f1-first-name form-control"
                                   id="user_name">
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="user_id">아이디</label>
                            <input type="text" name="user_id" placeholder="아이디" class="f1-last-name form-control"
                                   id="user_id">
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="user_pw">비밀번호</label>
                            <input type="text" name="user_pw" placeholder="비밀번호" class="f1-last-name form-control"
                                   id="user_pw">
                        </div>
                        <div class="form-group">
                            <label class="sr-only" for="user_email">이메일</label>
                            <input type="text" name="user_email" placeholder="이메일" class="f1-last-name form-control"
                                   id="user_email">
                        </div>
                        <div class="f1-buttons">
                            <span>
                                <button type="button" class="btn" style="float: left"><a href="find-id">아이디/비밀번호 찾기</a></button>
                            </span>
                            <button type="button" class="btn"><a href="login">로그인</a></button>
                            <button type="submit" class="btn btn-next">다음</button>
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