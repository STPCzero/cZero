<%@ page import="java.util.List" %>
<%@ page import="kopo.poly.dto.UserInfoDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<UserInfoDTO> uList = (List<UserInfoDTO>) request.getAttribute("uList");
    if(uList == null) uList = new ArrayList<>();
%>
<!DOCTYPE html>
<html>
<head>
    <style>
        .grid-adm-members{
            display:grid;
            grid-template-columns:10% 20% 20% 20% 20% 10%;
        }

        .admMemberList > tbody > tr{
            border-top:1px solid #ddd;
            box-sizing:border-box;
        }

        .admMemberList > tbody > tr:first-child{
            border-top:0px;
        }


        @import url(https://fonts.googleapis.com/css?family=Open+Sans);

        body {
            background: #f2f2f2;
            font-family: 'Open Sans', sans-serif;
        }

        .search {
            width: 100%;
            display: flex;
        }

        .searchTerm {
            width: 80%;
            border: 3px solid #4B5563;
            border-right: none;
            padding: 5px;
            height: 2.25rem;
            border-radius: 5px 0 0 5px;
            outline: none;
            color: #9DBFAF;
        }

        .searchTerm:focus {
            color: #4B5563;
        }

        .searchButton {
            width: 40px;
            height: 36px;
            border: 1px solid #4B5563;
            background: #4B5563;
            text-align: center;
            color: #fff;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
            font-size: 20px;
        }

        /*Resize the wrap to see the search bar change!*/
        .wrap {
            width: 400px;
            left: 50%;
        }


    </style>
    <meta charset="utf-8">
    <title>회원 관리 페이지 - 관리자</title>
</head>
<body>

<!-- 테일윈드 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">

<!-- 데이지UI -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/daisyui/1.14.2/full.css">

<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 반응형 메타태그 -->
<meta name="viewport" content="width=device-width,initial-scale=1">

<div class="flex container mx-auto pt-2">
    <div class="adm-side-bar">
        <aside class="w-44 flex flex-col rounded-xl bg-gray-600 text-gray-100">
            <div class="h-12 flex justify-center items-center p-4 text-lg font-bold border-b box-border">
                <span>메뉴</span>
            </div>
            <div class="font-bold flex justify-center">
                <ul class="flex flex-col">
                    <li class="p-2">
                        <a href="index">
                            메인페이지
                        </a>
                    </li>
                    <li class="p-2">
                        <a href="/admin/admin-market">
                            게시물 관리
                        </a>
                    </li>
                    <li class="p-2">
                        <a href="/admin/admin-member">
                            회원 관리
                        </a>
                    </li>
                </ul>
            </div>
        </aside>
    </div>
    <div class="shadow-xl border border-gray-200 rounded-xl w-full min-h-screen ml-2 mb-4">

        <div style="text-align: center; margin-top: 1%"><strong>회원관리</strong></div>

        <%--Search bar--%>
        <div style="float: right; margin-top: 1%; margin-bottom: 2%; margin-right: 1.5%;">
            <div class="wrap">
                <div class="search">
                    <input type="text" class="searchTerm" placeholder="Search">
                    <button type="submit" class="searchButton">
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </div>
        </div>


        <table class="admMemberList w-11/12 mx-auto mt-4" id="inventory">
            <thead>
            <tr class="bg-gray-600 text-white grid-adm-members text-center font-bold py-2 px-1">
                <th>
                    <input type="checkbox">
                </th>
                <th style="cursor: pointer;">아이디</th>
                <th style="cursor: pointer;">이름</th>
                <th style="cursor: pointer;">닉네임</th>
                <th style="cursor: pointer;">권한</th>
                <th style="cursor: pointer;">탈퇴</th>
            </tr>
            </thead>
            <tbody class="shadow">
            <% for (int i = 0; i < uList.size(); i++) { %>
                <tr class="grid-adm-members py-2 px-1 text-center">
                    <td>
                        <input type="checkbox">
                    </td>
                    <td><%= uList.get(i).getUser_id()%></td>
                    <td><%= uList.get(i).getUser_name()%></td>
                    <td></td>
                    <td></td>
                    <%--<td>
                        <% if(uList.get(i).getUser_type().equals("0")) {%>
                        <span>관리자</span>
                        <% } else {%>
                        <span>일반 회원</span>
                        <% } %>
                    </td>--%>
                    <td>
                        <a href="#">
                            <i class="fas fa-user-times"></i>
                        </a>
                    </td>
                </tr>
           <% }%>
            </tbody>
        </table>
    </div>
</div>

<script type="text/javascript">

    $(document).ready(function(){
        $('#inventory th').each(function (column) {
            $(this).click(function() {
                if($(this).is('.asc')) {		// 현재 오름차순인 경우
                    $(this).removeClass('asc');
                    $(this).addClass('desc');	// 내림차순으로 변경
                    $(this).children().attr('src', "resources/img.png");	// 이미지 src 수정
                    sortdir=-1;

                } else {	// 현재 오름차순 아닌 경우
                    $(this).addClass('asc');	// 오름차순으로 변경
                    $(this).removeClass('desc'); sortdir=1;
                    $(this).children().attr('src', "resources/img.png");	// 이미지 src 수정
                }

                $(this).siblings().removeClass('asc');
                $(this).siblings().removeClass('desc');

                var rec = $('#inventory').find('tbody>tr').get();

                rec.sort(function (a, b) {
                    var val1 = $(a).children('td').eq(column).text().toUpperCase();
                    var val2 = $(b).children('td').eq(column).text().toUpperCase();
                    return (val1 < val2)?-sortdir:(val1>val2)?sortdir:0;
                });

                $.each(rec, function(index, row) {
                    $('#inventory tbody').append(row);
                });
            });
        });
    });
</script>

</body>
</html>