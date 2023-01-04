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
    <script>
        $(function() {
            $('thead').css('background', 'black').css('color','white');
        })
    </script>
</head>
<body>

<h1>list</h1>

<table class="table">
    <thead>
    <tr style="font-family: 'LINESeedKR-Bd'">
        <th>이름</th>
        <th>이메일</th>
        <th>직함</th>
        <th></th>
        <th></th>
    </tr>
    </thead>

    <tbody>
    <c:forEach items="${memberList }" var="member">
        <tr>
            <td>
                <c:url value="/member/get" var="infoLink">
                    <c:param value="${member.m_member_id }" name="m_member_id"/>
                </c:url>
                <a href="${infoLink }" class="listHref">
                        ${member.m_member_id  }
                </a>
            </td>
            <td>
                <form method="post" id="modifyForm">
                    <input type="hidden" value="${member.m_member_id}" name="m_member_id">
                    <input type="text" value="${member.m_member_email }" name="m_member_email">
                </form>
                <button style="font-family: 'LINESeedKR-Bd'" type="submit" class="btn btn-primary" data-bs-toggle="modal"
                        data-bs-target="#modifyModal">
                    수정하기
                </button>
            </td>
            <td>${member.m_authority_grade }</td>
            <td><c:url value="/member/modify" var="modifyLink">
                <c:param value="${member.m_member_id }" name="m_member_id"/>
            </c:url>
                <a href="${modifyLink}" style="color: white"><button class="btn btn-primary">비밀번호 변경</button></a>
            </td>
            <td>
                <c:url value="/member/remove" var="removeLink">
                    <c:param value="${member.m_member_id }" name="m_member_id"/>
                </c:url>
                <input class="btn btn-danger" type="submit" value="삭제하기" data-bs-toggle="modal"
                       data-bs-target="#removeModal">
                <form id="removeForm" action="${removeLink }" method="post">
                    <input type="hidden" name="replyName" value="${member.m_member_id }">
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div class="modal fade" id="removeModal" tabindex="-1" aria-labelledby="exampleModalLabell" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 style="font-family: 'LINESeedKR-Bd'" class="modal-title fs-5" id="exampleModalLabell">삭제 확인</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                삭제하시겠습니까?
            </div>
            <div class="modal-footer">
                <button style="font-family: 'LINESeedKR-Bd'" type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">취소
                </button>
                <button style="font-family: 'LINESeedKR-Bd'" id="removeConfirmButton" type="button"
                        class="btn btn-danger">확인
                </button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 style="font-family: 'LINESeedKR-Bd'" class="modal-title fs-5" id="exampleModalLabel">수정 확인</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                수정하시겠습니까?
            </div>
            <div class="modal-footer">
                <button style="font-family: 'LINESeedKR-Bd'" type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">취소
                </button>
                <button style="font-family: 'LINESeedKR-Bd'" id="modifyConfirmButton" type="button" class="btn btn-primary">
                    확인
                </button>
            </div>
        </div>
    </div>
</div>


<c:url value="/member/register" var="registerLink">
</c:url>
<a href="${registerLink }" class="listHref">
    <i class="fa-sharp fa-solid fa-pen"></i>
</a>

<script>
    document.querySelector("#removeConfirmButton").addEventListener("click", function () {
        document.querySelector("#removeForm").submit();
    })
</script>

<script>
    document.querySelector("#modifyConfirmButton").addEventListener("click", function () {
        document.querySelector("#modifyForm").submit();
    });
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

</body>
</html>
