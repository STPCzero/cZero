<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>웹페이지 제목</title>

    <script src="/js/jquery-3.6.1.min.js"></script>
</head>
<body>
<div id = "byeongsin">

</div>
<script type="text/javascript">
    let html;
    $(document). ready(function test() {
        $.ajax({
            type : "get",
            url : "/admin/test2",
            /*async : 동기, 비동기 지정(boolean)*/
            dataType : "json",
            success(data){
               $.each(data,(index,obj)=>{

                   let userinfo = JSON.parse(obj);
                   let user_id = userinfo.user_id;
                   html += "<div>"+user_id+"</div>";
                   console.log(user_id);
               })
                $("#byeongsin").html(html);
            },error(){
                console.log("??")
            }

        })

    })
</script>

</body>


</html>