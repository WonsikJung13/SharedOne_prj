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
<my:header/>
<h1>오더 현황</h1>

<div class="bd-example tableWrapper">
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th scope="col">오더 번호</th>
            <%--            <th scope="col">담당자</th>--%>
            <th scope="col">바이어</th>
            <th scope="col">납품 요청일</th>
            <th scope="col">오더 총 금액</th>
            <th scope="col">승인 상태</th>
        </tr>
        </thead>
        <c:forEach items="${report}" var="report">
            <tbody>
            <tr>
                <th scope="row">${report.m_order_id}</th>
                    <%--            <td>Wonsik Jung</td>--%>
                <td>${report.m_order_buyerName}</td>
                <td>${report.m_order_inserted}</td>
                <td>${report.m_order_sumPrice}</td>
                <td>${report.m_order_status}</td>
            </tr>
            <tr>
                <td colspan="5">
                    <table class="table mb-0">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">판매부번</th>
                            <th scope="col">제품명</th>
                            <th scope="col">수량</th>
                            <th scope="col">판매가</th>
                        </tr>
                        </thead>
                        <c:forEach items="${report.reportItemDtoList}" var="items" varStatus="number">
                            <tbody>
                            <tr>
                                <th scope="row">${number.index + 1}</th>
                                <td>${items.m_order_itemId}</td>
                                <td>${items.m_orderItemName}</td>
                                <td>${items.m_order_count}</td>
                                <td>${items.m_order_totalPrice}</td>
                            </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                </td>
            </tr>
            </tbody>
        </c:forEach>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>
</html>