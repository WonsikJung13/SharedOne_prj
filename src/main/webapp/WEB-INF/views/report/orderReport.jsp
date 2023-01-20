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
        }

        .scrolltable {
            table-layout: fixed;
            border-collapse: collapse;
            border: 1px solid #888;
        }

        .scrolltable thead {
            background: #a88;
            color: #fff;
        }

        /* 행 장식 */
        .scrolltable th, .scrolltable td {
            padding: 10px;
            text-align: left;
            width: 100px;
            text-align: center;
            font-size: 0.875em;
        }

        .scrolltable tbody tr:nth-child(2n+1) {
            background-color: #f0f0f0;
        }

        .row {
            --bs-gutter-x: 0;
        }

        body {
            font-family: 'Noto Sans KR', sans-serif;
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

        .table tr {
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

        .table td {
            /*--bs-table-bg: #fffff;*/
            background-color: #fff;
            color: #37393b;
            text-align: center;
            line-height: 39px;
            font-size: 16px;
            font-weight: bold;
        }

        .tableList {
            background-color: #fff;
            height: auto;
            margin-bottom: 50px;
        }

        .table td a {
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
            border: none;
        }

        .searchBox {
            background-color: white;
            padding: 20px 80px 10px 80px;
            color: #212529;
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        form > * {
            background-color: white;
            position: relative;
        }

        form .form-control, .form-select {
            height: 40px;
            margin: 5px 0 5px 0;

        }

        .input-group {
            margin-bottom: 0;
        }

        .itemRegisterBtn {
            float: right;
            margin-top: 20px;
        }

        .itemRegisterBtn button {
            background-color: #658e99;
            text-align: center;
            width: 150px;
            height: 55px;
            color: #fff;
            line-height: 39px;
            --bs-btn-font-weight: 600;
            border: none;
        }

        form div div, label {
            background-color: white;
        }

        .searchBtn {
            width: 100px;
            height: 40px;
            margin: 5px 0px 5px 0px;
            --bs-btn-font-weight: 600;
            background-color: #658e99;
            border: none;
        }

        textarea {
            height: 140px;
            width: 960px;
            background-color: #fff;
            border-color: #dee2e6;
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
            <div id="orderListTitle">
                <h1 id="header">주문 현황</h1>
            </div>
            <div class="searchBox">
                <c:url value="/report/orderReport" var="listLink"/>
                <form action="${listLink}" role="search">
                    <div class="row" style="margin-bottom: 10px;">
                        <div style="margin-right: 10px" class="col-auto">
                            <label>시작일</label>
                            <input class="form-control" name="sd" id="startDate" type="date" style="width: 210px">
                        </div>
                        <div class="col-auto">
                            <label>종료일</label>
                            <input class="form-control" name="ed" id="endDate" type="date" style="width: 210px">
                        </div>
                    </div>
                    <div class="input-group  flex-nowrap" class="row">
                        <select name="t" class="form-select">
                            <option value="all">전체</option>
                            <option value="itemId" ${param.t == 'itemId' ? 'selected' : '' }>제품코드</option>
                            <option value="buyerId" ${param.t == 'buyerId' ? 'selected' : '' }>거래처코드</option>
                            <option value="memberId" ${param.t == 'memberId' ? 'selected' : '' }>담당자명
                            </option>
                            <option value="status" ${param.t == 'status' ? 'selected' : '' }>승인여부</option>
                        </select>
                        <input value="${param.q}" type="search" class="form-control" placeholder="Search"
                               aria-label="Search" name="q" style="width:450px">
                        <button class="btn btn-secondary searchBtn" type="submit" value="검색">검색</button>
                    </div>
                </form>
            </div>

            <div class="totalList" style="overflow:auto; height: 500px;  margin-bottom: 50px">
                <table class="table table-hover addList" style="width: 2000px">
                    <thead style="position: sticky; top: 0">
                    <tr>
                        <th>주문번호</th>
                        <th>승인요청일</th>
                        <th>승인여부</th>
                        <th>담당자명</th>
                        <th>납품요청일</th>
                        <th>거래처코드</th>
                        <th>거래처명</th>
                        <th>거래처 국가</th>
                        <th>거래처 주소</th>
                        <th>사업자등록번호</th>
                        <th>제품코드</th>
                        <th>제품명</th>
                        <th>제품그룹</th>
                        <th>제조사</th>
                        <th>거래 통화</th>
                        <th>주문 총 금액</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${report}" var="list">
                        <tr>
                            <td>${list.m_order_id}</td>
                            <td>${list.m_order_date}</td>
                            <td>${list.m_order_status}</td>
                            <td>${list.m_member_id}</td>
                            <td>${list.m_order_inserted}</td>
                            <td>${list.m_buyer_id}</td>
                            <td>${list.m_order_buyerName}</td>
                            <td>${list.m_order_buyerRegion}</td>
                            <td>${list.m_order_buyerAddress}</td>
                            <td>${list.m_order_buyerNumber}</td>
                            <td>${list.m_order_itemId}</td>
                            <td>${list.m_order_itemName}</td>
                            <td>${list.m_order_itemGroup}</td>
                            <td>${list.m_order_itemManufacturer}</td>
                            <td>${list.m_order_buyerCurrency}</td>
                            <td>${list.decimal}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <h2>월별 요약</h2>
            <div class="tableList">
                <table class="table addList">
                    <thead style="width: auto">
                    <tr>
                        <th style="width: 500px;">월별</th>
                        <th style="width: 500px;">총 주문수</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${sortedReport }" var="sortedReport">
                        <tr>
                            <td style="width: 500px;">${sortedReport.inserted}</td>
                            <td style="width: 500px;">${sortedReport.od_count}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <h2>거래처별 요약</h2>
            <div class="tableList">
                <table class="table addList">
                    <thead style="width: auto">
                    <tr>
                        <th style="width: 500px;">거래처별</th>
                        <th style="width: 500px;">총 주문수</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${buyerReport }" var="buyerReport">
                        <tr>
                            <td style="width: 500px;">${buyerReport.m_order_buyerName}</td>
                            <td style="width: 500px;">${buyerReport.m_order_id}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <h2>담당자별 요약</h2>
            <div class="tableList">
                <table class="table addList">
                    <thead style="width: auto">
                    <tr>
                        <th style="width: 500px;">담당자별</th>
                        <th style="width: 500px;">총 주문수</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${memberReport }" var="memberReport">
                        <tr>
                            <td style="width: 500px;">${memberReport.m_member_id}</td>
                            <td style="width: 500px;">${memberReport.count}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<script>
    const ctx = "${pageContext.request.contextPath}";
</script>
</body>
</html>
