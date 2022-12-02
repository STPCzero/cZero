<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="kopo.poly.dto.MarketDTO" %>
<%@ page import="kopo.poly.dto.UserInfoDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%
    MarketDTO rDTO = (MarketDTO) request.getAttribute("rDTO");
    UserInfoDTO uDTO = (UserInfoDTO) request.getAttribute("uDTO");

    // 마켓 정보를 못불러왔다면, 객체 생성
    if (rDTO == null) {
        rDTO = new MarketDTO();

    }
    if (uDTO == null) {
        uDTO = new UserInfoDTO();

    }

    String ss_user_id = CmmUtil.nvl((String) session.getAttribute("SESSION_USER_ID"));
    String sessionNo = (String) session.getAttribute("sessionNo");

    // 본인이 작성한  글만 수정가능하도록 하기(1: 작성자 아님 / 2: 본인이 작성한 글 / 3: 로그인안함)
    int edit = 1;

    // 로그인 안했다면...
    if (ss_user_id.equals("")) {
        edit = 3;

        //본인이 작성한 글이면 2가 되도록 변경
    } else if (ss_user_id.equals(CmmUtil.nvl(uDTO.getUser_id()))) ;
    {
        edit = 2;
    }

    System.out.println("user_id : " + CmmUtil.nvl(uDTO.getUser_id()));
    System.out.println("ss_user_id : " + ss_user_id);
%>


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

        // 수정하기
        function doEdit() {
            if ("<%=edit%>" == 2) {
                location.href = "../market/market-modify?mk_seq=<%=CmmUtil.nvl(String.valueOf(rDTO.getMk_seq()))%>";

            } else if ("<%=edit%>" == 3) {
                alert("로그인 하시길 바랍니다.");
            } else {
                alert("본인이 작성한 글만 수정 가능합니다.");
            }
        }

        // 삭제하기
        function doDelete() {
            if ("<%=edit%>" == 2) {
                if (confirm("작성한 글을 삭제하시겠습니까?")) {
                    location.href = "/market/deleteMarketInfo?mk_seq=<%=CmmUtil.nvl(String.valueOf(rDTO.getMk_seq()))%>";
                }

            } else if ("<%=edit%>" == 3) {
                alert("로그인 하시길 바랍니다.");
            } else {
                alert("본인이 작성한 글만 수정 가능합니다.");
            }
        }

        // 목록으로 이동
        function doList() {
            location.href = "/market/market-list"
        }

    </script>

    <style>
        button {
            outline: none !important;
            border: none;
            background: transparent;
        }

        button:hover {
            cursor: pointer;
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

        .tablecolor {
            background-color: #ffffff !important;
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
                    <button data-target="#navbar-collapse-02" data-toggle="collapse" class="navbar-toggle"
                            type="button">
                        <i class="fa fa-bars"></i>
                        <span class="sr-only">Toggle navigation</span>
                    </button>
                    <a href="/index"><img src="/images/Czero.png" style="width: 135px; height: 60px; margin-top: 5px"
                                          alt="로고"></a>
                </div>
                <div id="navbar-collapse-02" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="propClone"><a href="/market/market-list">Market</a></li>
                        <li class="propClone"><a href="/news/news">News</a></li>
                        <li class="propClone"><a href="/bicycle/bicycle">Bicycle</a></li>
                        <li class="propClone"><a href="/mypage/myinfo">Mypage</a></li>
                        <% if (sessionNo != null) {%>
                        <li class="propClone"><a href="/logout">Logout</a></li>
                        <%} else { %>
                        <li class="propClone"><a href="/login/login">Login</a></li>
                        <%} %>
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
                <h1 class="text-center latestitems">상품내용</h1>
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
            </span>
            <form>
                <div class="input-group input-group-sm container" role="group" style="text-align:left">
                    <table class="table table-striped table-bordered">
                        <tr class="tablecolor">
                            <td align="center" style="width: 20%; padding: 10px"><strong>제목</strong></td>
                            <td style="padding: 10px"><%=CmmUtil.nvl(rDTO.getTitle())%></td>

                            <td align="center" style="width: 20%; padding: 10px"><strong>가격</strong></td>
                            <td style="padding: 10px"><%=CmmUtil.nvl(String.valueOf(rDTO.getPrice()))%>원</td>
                        </tr>

                        <tr style="border-bottom: solid 1px #dddddd">
                            <td align="center" style="width: 20%; padding: 10px"><strong>작성일</strong></td>
                            <td style="padding: 10px"><%=CmmUtil.nvl(rDTO.getMk_date())%>
                            </td>
                            <td align="center" style="width: 20%; padding: 10px"><strong>조회수</strong></td>
                            <td style="padding: 10px"><%=CmmUtil.nvl(String.valueOf(rDTO.getRead_cnt()))%></td>

                        </tr>


                        <div style="width:800px;">
                            <td colspan="4"
                                style="height: 500px; padding: 20px"><%=CmmUtil.nvl(rDTO.getContents()).replaceAll("\r\n", "<br/>") %>
                            </td>
                        </div>
                    </table>

                </div>

            </form>
            <tr>
                <td>
                    <% if (sessionNo != null) {%>
                    <button type="button" class="btn btn-primary"
                            style="width: 7%; font-weight: bold; margin-left: 2%" onclick="doEdit()">수정
                    </button>
                    <%} else { %>
                    <%} %>
                    <% if (sessionNo != null) {%>
                    <button type="button" class="btn btn-primary"
                            style="width: 7%; font-weight: bold" onclick="doDelete()">삭제
                    </button>
                    <%} else { %>
                    <%} %>
                    <button type="button" class="btn btn-primary"
                            style="width: 7%; font-weight: bold; float:right; margin-right: 2%" onclick="doList()">목록
                    </button>
                </td>
            </tr>


            <form action="" style="margin-top: 10%">
                <fieldset>
                    <div>
                        <div><%=ss_user_id%></div>


                        <input type="hidden" id="replyer"
                        name = "replyer" value="<%=ss_user_id%>"
                        >
                        <input type="hidden" id="bno"
                        name = "bno" value="<%=rDTO.getMk_seq()%>"
                        >

                        <textarea name="reply" id="reply" cols="30" rows="10" placeholder="내용을 입력하세요"
                                  style="border-radius: 10px 10px 10px 10px; border: 2px solid rgb(213, 194, 194); outline-color: #00bba7; resize: none; "></textarea>
                        <button type="button" id= "insert" style="width: 100%; background-color: #00bba7; border-radius: 10px 10px 10px 10px" >등록</button>

                    </div>
                </fieldset>
            </form>

            <br><br>
            <div style="border: 1px solid grey; height : 50px;" id="replyList" class="replyList">

            </div>


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
        </div>
    </div>
</section>

<!-- Load JS here for greater good =============================-->
<script src="../js/jquery-3.6.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/anim.js"></script>
<script>
    //----HOVER CAPTION---//
    jQuery(document).ready(function ($) {
        let bno = <%=rDTO.getMk_seq()%>;

        $("#insert").click(Insertreply)
        $('.fadeshop').hover(
            function () {
                $(this).find('.captionshop').fadeIn(150);
            },
            function () {
                $(this).find('.captionshop').fadeOut(150);
            }
        )
        getList();
        function getList(){
            $.ajax({
                type : "get",
                url : "/replies/reply",
                dataType : "Json",
                data : {bno:bno},
                error(){
                    console.log("에러 나가 죽어라 최여진");
                },
                success(data){
                    let reply = JSON.parse(data[0]);
                    let time = reply.replyDate;
                    let replyer = reply.replyer;
                    let content = reply.reply;
                    console.log(time, replyer, content);

                }
            })
        }
        function Insertreply(){
            let replyer = document.querySelector("#replyer").value;
            let reply = document.querySelector("#reply").value;
            let bno = document.querySelector("#bno").value;
            $.ajax({
                type : "post",
                url : "/replies/new",
                data : {replyer:replyer, bno:bno, reply:reply},
                error(){
                    console.log("에러 나가 죽어라 최여진");
                },
                success(data){
                    getList();
                }
            })
        }
    });








</script>

<br><br>

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