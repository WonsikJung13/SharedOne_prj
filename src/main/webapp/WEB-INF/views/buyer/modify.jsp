<%--
  Created by IntelliJ IDEA.
  User: hyeonjong
  Date: 2022/12/31
  Time: 23:21
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
</head>
<body>
<div class="row">
    <div class="col-3">
        <my:header></my:header>
    </div>
    <div class="col">

        <h3 style="font-family: LINESeedKR-Bd">
            ${Buyer.m_buyer_id}
        </h3>
        <form method="post" id="modifyForm" style="margin-top: 30px">
            <input class="form-control" type="text" value="${Buyer.m_buyer_id}" readonly>
            <input class="form-control" type="text" name="m_buyer_name" value="${Buyer.m_buyer_name}">
            <input class="form-control" type="text" name="m_buyer_region" value="${Buyer.m_buyer_region}">
            <input class="form-control" type="text" name="m_buyer_address" value="${Buyer.m_buyer_address}">
            <input class="form-control" type="text" name="m_buyer_currency" value="${Buyer.m_buyer_currency}">
            <input class="form-control" type="text" name="m_buyer_number" value="${Buyer.m_buyer_number}">
            <input type="text" class="form-control form300" name="m_buyer_number" id="buyerIdInput"
                   value="${Buyer.m_buyer_number}">
            <p id="inputText"></p></th>
            <th>
                <button style="border-color: #0cc; font-family: LINESeedKR-Bd" id="buyerIdButton" class="btn"
                        type="button">중복확인
                </button>
                <input type="submit" class="btn btn-primary" value="수정하기" disabled id="register">
        </form>


        <div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 style="font-family: 'LINESeedKR-Bd'" class="modal-title fs-5" id="exampleModalLabel">수정
                            확인</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        수정하시겠습니까?
                    </div>
                    <div class="modal-footer">
                        <button style="font-family: 'LINESeedKR-Bd'" type="button" class="btn btn-secondary"
                                data-bs-dismiss="modal">취소
                        </button>
                        <button style="font-family: 'LINESeedKR-Bd'" id="modifyConfirmButton" type="button"
                                class="btn btn-ico">
                            확인
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

<script>
    document.querySelector("#modifyConfirmButton").addEventListener("click", function () {
        document.querySelector("#modifyForm").submit();
    });

    const ctx = "${pageContext.request.contextPath}";

    document.querySelector("#buyerIdButton").addEventListener("click", function () {
        checkedDoubleId = false;
        const insertBuyerNum = document.querySelector("#buyerIdInput").value;

        fetch(ctx + "/buyer/checkNum/" + insertBuyerNum)
            .then(res => res.json())
            .then(data => {
                document.querySelector("#inputText").innerText = data.message;
                $(function () {
                    $('#inputText').css("color", "red");
                })

                if (data.statusNum === 'not exist') {
                    $(function () {
                        $('#inputText').css("color", "black");
                    })
                    document.querySelector("#register").removeAttribute("disabled");
                }
            })
    })
</script>

</body>
</html>
