<%--
  Created by IntelliJ IDEA.
  User: hyeonjong
  Date: 2022/12/31
  Time: 23:15
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
</head>
<body>
<h1>get</h1>

<h3 style="font-family: LINESeedKR-Bd">
    ${Buyer.m_buyer_id}
</h3>
<input class="form-control" type="text" value="${Buyer.m_buyer_id}" readonly>
<input class="form-control" type="text" value="${Buyer.m_buyer_name}" readonly>
<input class="form-control" type="text" value="${Buyer.m_buyer_region}" readonly>
<input class="form-control" type="text" value="${Buyer.m_buyer_address}" readonly>
<input class="form-control" type="text" value="${Buyer.m_buyer_number}" readonly>
<input class="form-control" type="text" value="${Buyer.m_buyer_currency}" readonly>
<br>

<c:url value="/buyer/modify" var="modifyLink">
    <c:param name="m_buyer_id" value="${Buyer.m_buyer_id}"></c:param>
</c:url>

<c:url value="/buyer/remove" var="removeLink">
    <c:param name="m_buyer_id" value="${Buyer.m_buyer_id}"></c:param>
</c:url>

<form id="removeForm" action="${removeLink }" method="post">
    <input type="hidden" name="replyName" value="${Buyer.m_buyer_id }">
</form>

<div style="font-family: LINESeedKR-Bd">
    <a class="btn btn-ico " href="${modifyLink}">수정하기</a>
    <input class="btn btn-danger" type="submit" value="삭제하기" data-bs-toggle="modal"
           data-bs-target="#removeModal">
</div>

<div class="modal fade" id="removeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 style="font-family: 'LINESeedKR-Bd'" class="modal-title fs-5" id="exampleModalLabel">삭제 확인</h1>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

<script>
    document.querySelector("#removeConfirmButton").addEventListener("click", function () {
        document.querySelector("#removeForm").submit();
    })

    const ctx = "${pageContext.request.contextPath}";
</script>
</body>
</html>
