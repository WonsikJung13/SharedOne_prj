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
        /*.tableWrapper {*/
        /*    !*width: 400px;*!*/
        /*    !*height: 300px;*!*/
        /*    !*background-color: lightgreen;*!*/
        /*    overflow: auto;*/
        /*}*/

        /*#userListTable {*/
        /*    !*width: 500px;*!*/
        /*    border: 0px;*/
        /*    border-collapse: collapse;*/
        /*}*/

        /*#userListTable th {*/
        /*    position: sticky;*/
        /*    top: 0px;*/
        /*    !*background-color: gray !important;*!*/
        /*}*/
    </style>
</head>
<body>
<h1>오더 현황</h1>

<div class="bd-example tableWrapper">
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th scope="col">오더 번호</th>
            <th scope="col">담당자</th>
            <th scope="col">바이어</th>
            <th scope="col">납품 요청일</th>
            <th scope="col">승인 상태</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th scope="row">1</th>
            <td>Wonsik Jung</td>
            <td>삼성전자</td>
            <td>2023-01-01</td>
            <td>승인요청</td>
        </tr>
        <tr>
            <td colspan="5">
                <table class="table mb-0">
                    <thead>
                    <tr>
                        <th scope="col">아이템 번호</th>
                        <th scope="col">판매부번</th>
                        <th scope="col">수량</th>
                        <th scope="col">단위</th>
                        <th scope="col">할인율</th>
                        <th scope="col">판매가</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>001001</td>
                        <td>10</td>
                        <td>EA</td>
                        <td>10%</td>
                        <td>10,000</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>001001</td>
                        <td>10</td>
                        <td>EA</td>
                        <td>10%</td>
                        <td>10,000</td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>001001</td>
                        <td>10</td>
                        <td>EA</td>
                        <td>10%</td>
                        <td>10,000</td>
                    </tr>
                    </tbody>
                </table>
            </td>
        </tr>

        <tr>
            <th scope="row">2</th>
            <td>Chaeun Lim</td>
            <td>LG전자</td>
            <td>2023-06-01</td>
            <td>승인완료</td>
        </tr>
        <tr>
            <td colspan="5">
                <table class="table mb-0">
                    <thead>
                    <tr>
                        <th scope="col">아이템 번호</th>
                        <th scope="col">판매부번</th>
                        <th scope="col">수량</th>
                        <th scope="col">단위</th>
                        <th scope="col">할인율</th>
                        <th scope="col">판매가</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>001001</td>
                        <td>10</td>
                        <td>EA</td>
                        <td>10%</td>
                        <td>10,000</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>001001</td>
                        <td>10</td>
                        <td>EA</td>
                        <td>10%</td>
                        <td>10,000</td>
                    </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>
</html>