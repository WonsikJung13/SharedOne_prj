<%--
  Created by IntelliJ IDEA.
  User: hyeonjong
  Date: 2022/12/30
  Time: 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />

</head>
<body>
<div>
    <div id="itemTitle">
        <h1 id="header">제품 등록</h1>
    </div>
    <div>
        <form id="itemRegisterForm" method="post">

            <div>
                <label>제품명</label>
                <input type="text" name="m_item_name" value="${getItem.m_item_name}">
            </div>

            <div>
                <label>제품그룹</label>
                <input type="text" name="m_item_group" value="${getItem.m_item_group}">
            </div>

            <div>
                <label>제조사</label>
                <input type="text" name="m_item_manufacturer" value="${getItem.m_item_manufacturer}">
            </div>

            <div>
                <label>단위</label>
                <input type="text" name="m_item_unit" value="${getItem.m_item_unit}">
            </div>
            <div id="inputItemId">
                <label>제품코드</label>
                <input type="text" name="m_item_id" value="${getItem.m_item_id}" disabled>
            </div>

            <div class="input group">
                <input class="btn" type="submit" id="submitButton1" value="제품 등록">

                <c:url value="/item/remove" var="removeLink"/>
                <form id="removeForm" action="${removeLink }" method="post">
                    <input type="hidden" name="m_item_id" value="${getItem.m_item_id }">
                </form>
                <input id="InputRemoveButton" class="btn btn-danger" type="submit" value="제품 삭제" data-bs-toggle="modal" data-bs-target="#removeModal">
            </div>
        </form>

    </div>

</div>
<!-- remove Modal -->
<div class="modal fade" id="removeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">삭제 확인</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                삭제하시겠습니까? 복구할 수 없습니다.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button id="removeConfirmButton" type="button" class="btn btn-danger">확인</button>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const itemId = document.querySelector("input[name='m_item_id']").value;
        if (itemId != 0) {
            document.getElementById("inputItemId").style.display = "block";
            document.getElementById("submitButton1").value="제품 수정";
            document.getElementById("header").innerHTML = "제품 수정"
        }
        else {
            document.getElementById("inputItemId").style.display = "none";
            document.getElementById("InputRemoveButton").style.display = "none";
        }
    });


</script>

<script>
    // 삭제하기
    document.querySelector("#removeConfirmButton").addEventListener("click", function () {
        document.querySelector("#removeForm").submit();
    });
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</html>
