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
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
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
    <script>
        $(function () {
            $('thead').css('background', 'black').css('color', 'white');
        })
    </script>
</head>
<body>
<div class="row">
    <div class="col-3">
        <my:header></my:header>
    </div>
    <div class="col">

        <table class="table">
            <thead>
            <tr style="font-family: 'LINESeedKR-Bd'">
                <th>이름</th>
                <th>이메일</th>
                <th>직함</th>
                <th></th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${memberList }" var="member">
                <tr>
                    <td>
                            ${member.m_member_id }
                    </td>
                    <td>
                            ${member.m_member_email }
                    </td>
                    <td>${member.m_authority_grade }</td>
                    <td><c:url value="/member/modify" var="modifyLink">
                        <c:param value="${member.m_member_id }" name="m_member_id"/>
                    </c:url>
                        <a href="${modifyLink}" style="color: white">
                            <button class="btn btn-primary">정보 수정</button>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

</body>
</html>
