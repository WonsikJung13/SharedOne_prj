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
    <title>거래처 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"
            integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@200;300;400;500&display=swap" rel="stylesheet">
    <style>

        .sidebar {
            z-index: 5;
        }
        body {
            font-family: 'Gothic A1', sans-serif;
            font-weight: 200;
            background-color: #eeeeee;
        }
        .table {
            --bs-table-bg: #fff;
        }

        .table.addList {
            --bs-table-bg: #5f7175;
            --bs-table-color: #fff;
            text-align: center;
            line-height: 39px;
            font-size: 16px;
        }

        tr {
            height: 55px;
        }

        h1 {
            font-size: 1.7em;
            margin: 30px 0;
        }

        h2 {
            font-size: 1.1em;
            margin: 20px 0 10px 0;
        }

        .addBtn {
            background-color: #5f7175;
            padding: 5px 30px;
            margin-left: 350px;
        }

        .addBtn:hover,
        .addBtn:focus, .storageBtn:hover, .storageBtn.focus {
            background-color: #505f62;
        }

        .storageBtn {
            background-color: #5f7175;
            padding: 5px 30px;
            margin-left: 280px;
        }

        .submitBtn {
            background-color: #598f9b;
            padding: 5px 30px;

        }

        .form-select {
            width: 250px;
        }

        .form-control {
            width: 400px;
        }

        .inputLength {
            width: 250px;
        }


        /*제품그룹 박스*/
        #groupSelect, #manufacturerSelect {
            position: absolute;
        }

        option {
            height: 30px;
            line-height: 30px;
        }

        .groupEditOption, .ManufacturerEditOption {
            position: relative;
        }
    </style>
</head>
<body>
<div class="row">
    <div class= "col-3 sidebar" style="max-width: 300px">
        <my:header></my:header>
    </div>
    <div class="col" style="margin: 0 auto;max-width:70%;min-width: 600px">
        <div class="">
            <h1><i class="fa-solid fa-pen-nib" style="margin-right: 10px;"></i>${Buyer.m_buyer_id} 바이어 수정</h1>

        <table class="table table-bordered" id="aaa">
            <tbody>
            <form action="" method="post" id="modifyForm">
                <tr>
                    <th class="table-active">거래처 명</th>
                    <th><input class="form-control form300" type="text" name="m_buyer_name" id="m_buyer_name" value="${Buyer.m_buyer_name}"></th>
                </tr>
                <tr>
                    <th class="table-active">거래처 국가</th>
                    <th><input class="form-control form300" type="text" name="m_buyer_region" id="m_buyer_region" value="${Buyer.m_buyer_region}"></th>
                </tr>
                <tr>
                    <th class="table-active">거래처 주소</th>
                    <th><input type="text" class="form-control form300" name="m_buyer_address" id="m_buyer_address" value="${Buyer.m_buyer_address}">
                    </th>
                </tr>
                <tr>
                    <th class="table-active">통화</th>
                    <th id="ddd"><input type="text" class="form-control form300" name="m_buyer_currency" value="${Buyer.m_buyer_currency}"
                                        id="m_buyer_currency">
                    </th>
                </tr>
                <tr>
                    <th class="table-active">사업자번호</th>
                    <th><input type="text" style="background-color: #e9ecef" class="form-control form300" name="m_buyer_number" id="buyerIdInput" value="${Buyer.m_buyer_number}" readonly>
                </tr>
            </form>
            </tbody>
        </table>
        <button class="btn btn-secondary" id="modifyBtn">거래처 수정</button>
    </div>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

<script>
    document.querySelector("#modifyBtn").addEventListener("click", function () {
        document.querySelector("#modifyForm").submit();
    });
</script>

</body>
</html>
