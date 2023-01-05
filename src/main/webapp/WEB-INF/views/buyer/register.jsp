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
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        .form300 {
            width: 60%;
        }
    </style>
</head>
<body>
<h1>register</h1>

<table class="table">
    <tbody>
    <form action="" method="post" enctype="multipart/form-data">
        <tr>
            <th>거래처 명</th>
            <th><input class="form-control form300" type="text" name="m_buyer_name"></th>
        </tr>
        <tr>
            <th>거래처 국가</th>
            <th><input class="form-control form300" type="text" name="m_buyer_region"></th>
        </tr>
        <tr>
            <th>거래처 주소</th>
            <th><input type="text" class="form-control form300" name="m_buyer_address"></th>
        </tr>
        <tr>
            <th>사업자번호</th>
            <th><input type="text" class="form-control form300" name="m_buyer_number" id="buyerIdInput"></th>
            <th>
                <button style="border-color: #0cc; font-family: LINESeedKR-Bd" id="buyerIdButton" class="btn"
                        type="button">중복확인
                </button>
            </th>
        </tr>
        <tr>
            <th>통화</th>
            <th><input type="text" class="form-control form300" name="m_buyer_currency"></th>
        </tr>
    </form>
    </tbody>
</table>
<button class="btn btn-primary" id="register" disabled>등록</button>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

<script>
    document.querySelector("#buyerIdButton").addEventListener("click", function () {
        debugger;
        checkedDoubleId = false;
        const insertBuyerNum = document.querySelector("#buyerIdInput").value;

        fetch(ctx + "/buyer/checkNum/" + insertBuyerNum)
            .then(res => res.json())
            .then(data => {
                document.querySelector("#buyerIdInput").innerText = "";
                document.querySelector("#buyerIdInput").focus().style("background",'red');

                if (data.statusId == "not exist") {
                    buyerIdInput.removeAttribute("style");
                    document.querySelector("#register").enable();
                }
            })
    })
</script>
</body>
</html>
