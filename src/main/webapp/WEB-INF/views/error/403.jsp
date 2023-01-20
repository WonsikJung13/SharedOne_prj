<%--
  Created by IntelliJ IDEA.
  User: hyeonjong
  Date: 2023/01/18
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page isErrorPage = "true" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>$Title$</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
    body {
        background-color: #353535;;
    }
</style>
</head>
<body>

<div id="divTag" style="display: flex;justify-content : center;font-size: 100px; color: white">
    <div>접근 권한이 없습니다
        <br>
    5초뒤 로그아웃됩니다</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<script>
    const ctx = "${pageContext.request.contextPath}";
    const logout = ctx + "/logout";
    setTimeout(function (){
        location.href = logout;
    }, 4000)

</script>
</body>
</html>
