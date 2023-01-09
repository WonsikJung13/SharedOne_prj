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
    <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
            rel="stylesheet">
    <style>
        <style>
        .itemRegisterBtn {
            position: relative;
        }

        * {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #eeeeee ;
        }
        .table{
            width: 1000px;
            --bs-table-bg:#fff;
        }
        .table.addList{
            --bs-table-bg:#5f7175;
            --bs-table-color:#fff;
            text-align: center;
            line-height: 39px;
            font-size: 16px;
            width: 1000px;

        }
        tr{
            height: 55px;
            width: 1000px;

        }
        h1{
            font-size:1.7em;
            margin: 30px 0;
        }
        h2{
            font-size: 1.1em;
            margin: 20px 0 10px 0;
        }
        .table td{
            /*--bs-table-bg: #fffff;*/
            background-color: #fff;
            color: #37393b;
            text-align: center;
            line-height: 39px;
            font-size: 16px;
            font-weight: bold;
            width: 1000px;

        }
        .tableList {
            background-color: #fff;
            height: 672px;
            width: 1000px;
        }
        td a {
            color: #37393b;
            background-color: #fff;
            text-decoration: none;
        }
        .table button {
            background-color: #757575;
            color: #fff;
            /*border-radius: 0;*/
            width: 100px;
            --bs-btn-font-weight: 600;
            border:none;
        }

        .searchBox {
            background-color: white;
            width: 1000px;
            padding: 20px 80px 10px 80px;
            color: #212529;
            font-size:16px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        form > * {
            background-color: white;
            position: relative;
        }
        form .form-control, .form-select {
            height:40px;
            margin: 5px 0 5px 0;
            width: 1000px;

        }
        .input-group {
            margin-bottom: 0;
        }

        .itemRegisterBtn {
            float:right;
            margin-top: 20px;
        }
        .itemRegisterBtn button {
            background-color: #658e99;
            text-align: center;
            width: 150px;
            height:55px;
            color: #fff;
            line-height:39px;
            --bs-btn-font-weight: 600;
            border:none;
        }

        form div div, label{
            background-color: white;
        }

        .searchBtn {
            width: 100px;
            height: 40px;
            margin: 5px 0px 5px 0px;
            --bs-btn-font-weight: 600;
            background-color: #658e99;
            border:none;
        }
    </style>
    </style>
</head>
<body>

<div class="row">
    <div class="col-3">
        <my:header></my:header>
    </div>
    <div class="col">
<h1>오더관리</h1>
<input class="btn btn-danger" type="submit" value="삭제하기" data-bs-toggle="modal"
       data-bs-target="#removeModal">

<table class="table">
    <tbody>
    <tr style="font-family: 'LINESeedKR-Bd'">
        <th>오더코드</th>
        <th>바이어코드</th>
        <th>바이어명</th>
        <th>전체금액</th>
        <th>발주상태</th>
        <th></th>
    </tr>
        <tr>
            <td>001001</td>
            <td>001001</td>
            <td>바이어명</td>
            <td>전체금액</td>
            <td>발주상태</td>
            <td>
                <a class="btn btn-primary" href="">수정하기</a>
            </td>
        </tr>
    </tbody>
</table>

<form id="removeForm" action="${removeLink }" method="post">
    <input type="hidden" name="replyName" value="${Buyer.m_buyer_id }">
</form>
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
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<script>
</script>
</body>
</html>
