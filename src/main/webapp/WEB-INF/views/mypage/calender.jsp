<%@ page import="jdk.nashorn.internal.scripts.JS" %>
<%@ page import="kopo.poly.dto.MypageDTO" %>
<%@ page import="kopo.poly.util.CmmUtil" %>
<%@ page import="kopo.poly.dto.MarketDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kopo.poly.util.EncryptUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    MypageDTO iDTO = (MypageDTO) request.getAttribute("iDTO"); // user_info 개인정보
    if(iDTO == null) {
        iDTO = new MypageDTO();
    }
    List<MarketDTO> mkList = (List<MarketDTO>)request.getAttribute("mkList"); // 내 market 정보
    if(mkList == null) mkList = new ArrayList<MarketDTO>(); // 게시판 조회 결과 보여주기
    boolean prev = (boolean) request.getAttribute("prev");
    boolean next = (boolean) request.getAttribute("next");
    int startPageNum = (int) request.getAttribute("startPageNum");
    int endPageNum = (int) request.getAttribute("endPageNum");
    int select = (int) request.getAttribute("select");

    String sessionNo = "1"; // (String) session.getAttribute("sessionNo");
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
    <link href='../js/lib/main.css' rel='stylesheet' />

    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>


    <script src="../js/jquery-.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/anim.js"></script>
    <script src='../js/lib/main.js'></script>
    <script src='../js/lib/locales/ko.js'></script>
    <script type="text/javascript">
    </script>

    <style>
        .pagination>li>a, .pagination>li>span {
            color : red;
        }
        .mypage-btn {
            width: 100%;
            padding: 14px 10px;
            background: #333;
            color: #fff;
            border: 1px solid #333;
            td-size: 16px;
            td-weight: 700;
            text-transform: uppercase;
        }

        /*플로팅*/
        .floating {
            background-color:#f9f9f9;
            border:2px solid #000;
            position: fixed;
            right: 50%;
            top: 380px;
            margin-right: -715px;
            text-align:center;
            width:70px;
            border-radius: 8px;
            -webkit-border-radius: 8px;
        }
        .floating div:nth-child(1){
            border:2px solid #ff3535;
            border-radius: 8px;
        }
        .floating div:nth-child(2){
            border:2px solid #ff3535;
            border-radius: 8px;
        }
        .floating  div:nth-child(3){
            border:2px solid #ff3535;
            border-radius: 8px;
        }
    </style>

    <script>

        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                headerToolbar: {
                    left: 'title',
                    center: 'addEventButton,dayGridMonth,dayGridWeek,dayGridDay,listWeek',
                    right: 'today,prevYear,prev,next,nextYear'
                },
                navLinks: true, // can click day/week names to navigate views
                editable: true,
                dayMaxEvents: true, // allow "more" link when too many events
                locale: 'ko',
                selectable: true, // 날짜 클릭 가능하게 함
                events: [
                    {
                        title: 'All Day Event',
                        start: '2022-12-01'
                    },
                    {
                        title: '시험기간(롱이벤트)',
                        start: '2022-12-07',
                        end: '2022-12-15'
                    },
                    {
                        groupId: 999,
                        title: 'Repeating Event',
                        start: '2022-12-09T16:00:00'
                    },
                    {
                        groupId: 999,
                        title: 'Repeating Event',
                        start: '2022-12-19T16:00:00'
                    },
                    {
                        title: 'Meeting',
                        start: '2022-12-29T16:00:00',
                        end: '2022-12-29T18:00:00'
                    },
                    {
                        title: '점심먹기 (단일 이벤트)',
                        start: '2022-12-12T12:30:00'
                    },
                    {
                        title: 'Meeting',
                        start: '2020-09-12T14:30:00'
                    },
                    {
                        title: 'Happy Hour',
                        start: '2020-09-12T17:30:00'
                    },
                    {
                        title: 'Dinner',
                        start: '2020-09-12T20:00:00'
                    },
                    {
                        title: 'Birthday Party',
                        start: '2022-11-13T07:00:00'
                    }
                ],
                eventClick: function(info) {
                    // alert('Event: ' + info.event.title);
                    // alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
                    // alert('View: ' + info.view.type);

                    // change the border color just for fun
                    info.el.style.borderColor = 'red';
                },
                dateClick: function(info) {
                    alert('Clicked on: ' + info.dateStr);
                    //alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
                    //alert('Current view: ' + info.view.type);
                    // change the day's background color just for fun
                    //info.dayEl.style.backgroundColor = 'red';
                },customButtons: {
                addEventButton: { // 추가한 버튼 설정
                    text : "일정 추가",  // 버튼 내용
                        click : function(){ // 버튼 클릭 시 이벤트 추가
                        $("#calendarModal").modal("show"); // modal 나타내기

                        $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시
                            var content = $("#calendar_content").val();
                            var start_date = $("#calendar_start_date").val();
                            var end_date = $("#calendar_end_date").val();

                            //내용 입력 여부 확인
                            if(content == null || content == ""){
                                alert("내용을 입력하세요.");
                            }else if(start_date == "" || end_date ==""){
                                alert("날짜를 입력하세요.");
                            }else if(new Date(end_date)- new Date(start_date) < 0){ // date 타입으로 변경 후 확인
                                alert("종료일이 시작일보다 먼저입니다.");
                            }else{ // 정상적인 입력 시
                                var obj = {
                                    "title" : content,
                                    "start" : start_date,
                                    "end" : end_date
                                }//전송할 객체 생성



                                console.log(obj); //서버로 해당 객체를 전달해서 DB 연동 가능
                            }
                        });
                    }
                }
            }
        });
            calendar.render();
        });

    </script>
    <style>

        #calendar {
            max-width: 1100px;
            margin: 0 auto;
        }

        .add-button {
            margin: 0 auto;
            background: red;
            border: 0;
            color: whitesmoke;
            border-radius: 30px;
            width: 150px;
        }
    </style>


</head>

<body>
<% if(sessionNo!=null) {%>
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
                        <% if (iDTO.getUser_type().equals("0")){%>
                        <li class="propClone"><a href="/admin/admin-member">Admin</a></li>
                        <% }%>
                        <li class="propClone"><a href="/market/market-list">Market</a></li>
                        <li class="propClone"><a href="/news/news">News</a></li>
                        <li class="propClone"><a href="/bicycle/bicycle">Bicycle</a></li>
                        <li class="propClone"><a href="/mypage/myinfo">Mypage</a></li>
                        <% if(sessionNo!=null) {%>
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
                <h1 class="text-center latestitems">나의 캘린더</h1>
            </div>
            <div class="wow-hr type_short">
			<span class="wow-hr-h">
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			<i class="fa fa-star"></i>
			</span>
            </div>
        </div>

<%--        <div>--%>
<%--            <button class="add-button" type="button" onclick="click_add();">--%>
<%--                일정 추가--%>
<%--            </button>--%>
<%--        </div>--%>
        <div id='calendar'></div>
        <!-- modal 추가 -->
        <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="taskId" class="col-form-label">일정 내용</label>
                            <input type="text" class="form-control" id="calendar_content" name="calendar_content">
                            <label for="taskId" class="col-form-label">시작 날짜</label>
                            <input type="date" class="form-control" id="calendar_start_date" name="calendar_start_date">
                            <label for="taskId" class="col-form-label">종료 날짜</label>
                            <input type="date" class="form-control" id="calendar_end_date" name="calendar_end_date">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-warning" id="addCalendar">추가</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                id="sprintSettingModalClose">취소</button>
                    </div>

                </div>
            </div>
        </div>



        <div id="edd_checkout_wrap" class="col-md-8 col-md-offset-2">
            <div class="floating">
                <a href="/mypage/calender">
                    <div>캘린더</div>
                </a>
                <div>To do List</div>
                <div>탄소 계산기</div>
            </div>
            <div id="edd_checkout_form_wrap" class="edd_clearfix">
            </div>



            <br />

            <div style="text-align: center; margin-bottom: 50px;">
                <% if(prev == true) {%>
                <button type="button" class="btn btn-secondary">Prev</button>
                <%}%>
                <div class="btn-group " style="margin: 0 auto; display: inline-block;">
                    <% for (int i = startPageNum; i <= endPageNum; i++) {
                        if(select == i) {%>
                        <a style="color: red;" href="/mypage/myinfo?num=<%=i%>">
                        <button class="btn btn-secondary">
                            <%=i%>
                        </button></a>
                        <%} else {%>
                        <a style="" href="/mypage/myinfo?num=<%=i%>">
                        <button class="btn btn-secondary">
                            <%=i%>
                        </button></a>
                        <% }
                    } %>
                </div>
                <% if(next == true) {%>
                <button type="button" class="btn btn-secondary">Next</button>
                <% } %>
            </div>
        </div>
    </div>
</section>
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
<!-- Load JS here for greater good =============================-->
<script src="https://unpkg.com/sweetalert@2.1.2/dist/sweetalert.min.js"></script>
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

        $('#withdrawal').click(function (){
            if (!confirm("정말 탈퇴하시겠습니까? \n" + "회원 정보는 즉시 삭제되며 돌이킬 수 없습니다.")) {
            } else {
                location.href = "/mypage/myinfo-withdrawal";
            }
        });
    });
</script>
<%} else { %>
<script>
    alert("로그인이 필요한 서비스입니다.");
    location.href = "/login/login";

</script>
<% }%>
</body>
</html>