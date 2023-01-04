<%--
  Created by IntelliJ IDEA.
  User: hyeonjong
  Date: 2023/01/02
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"
            integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>

기존비번<input type="text" id="oldPassword">
<div style="color: red" id="oldPasswordText"></div>
새비번<input type="text" id="newPassword1">
<div style="color: red" id="newPassword1Text"></div>
<form method="post" enctype="multipart/form-data" action="" id="changePassword">
    새비번확인<input type="text" id="newPassword2" name="m_member_password">
    <div style="color: red" id="newPassword2Text"></div>
    <button type="submit" id="submitBtn">전송</button>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

<script>
    var oldPassword = document.getElementById("oldPassword").value;
    var newPassword1 = document.getElementById("newPassword1").value;
    var newPassword2 = document.getElementById("newPassword2").value;

    document.querySelector("#submitBtn").addEventListener("click", function () {

        if (oldPassword == ${member.m_member_password}) {
            if (newPassword1 != newPassword2) {
                $(function () {
                    newPassword2Text.innerText = "비밀번호가 일치하지 않습니다"
                    document.querySelector('#newPassword2').focus();
                })
            } else {
                document.querySelector("#changePassword").submit;
            }
        } else {
            $(function () {
                oldPasswordText.innerText = "비밀번호가 일치하지 않습니다."
                document.querySelector("#oldPassword").focus();
            })
        }
    })

</script>

</body>
</html>
