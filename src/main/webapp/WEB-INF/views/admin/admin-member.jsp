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
                        <a href="#">
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
        <table class="admMemberList w-11/12 mx-auto mt-4">
            <thead>
            <tr class="bg-gray-600 text-white grid-adm-members text-center font-bold py-2 px-1">
                <td>
                    <input type="checkbox">
                </td>
                <td>아이디</td>
                <td>이름</td>
                <td>닉네임</td>
                <td>권한</td>
                <td>탈퇴</td>
            </tr>
            </thead>
            <tbody class="shadow">
            <% for (int i = 0; i < uList.size(); i++) { %>
                <tr class="grid-adm-members py-2 px-1 text-center">
                    <td>
                        <input type="checkbox">
                        <input type="hidden" value="<%= uList.get(i).getUser_seq()%>">
                    </td>
                    <td><%= uList.get(i).getUser_id()%></td>
                    <td><%= uList.get(i).getUser_name()%></td>
                    <td><%= uList.get(i).getUser_id()%></td>
                    <td>
                        <% if(uList.get(i).getUser_type().equals("0")) {%>
                        <span>관리자</span>
                        <% } else {%>
                        <span>일반 회원</span>
                        <% } %>
                    </td>
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

</body>
</html>