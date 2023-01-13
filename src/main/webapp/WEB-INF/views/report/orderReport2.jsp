<%--
  Created by IntelliJ IDEA.
  User: hyeonjong
  Date: 2022/12/30
  Time: 9:37
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
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #eeeeee;
        }

        .table {
            width: 1000px;
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

        .table td {
            /*--bs-table-bg: #fffff;*/
            background-color: #fff;
            color: #37393b;
            text-align: center;
            line-height: 39px;
            font-size: 16px;
            font-weight: bold;
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
            /*height: 672px;*/
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
            border: none;
        }

        .searchBox {
            background-color: white;
            width: 1000px;
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

        .selectBtn {
            width: 100px;
            height: 40px;
            margin: 5px 0px 5px 0px;
            --bs-btn-font-weight: 600;
            /*background-color: #658e99;*/
            border: none;
        }

        .page-item {
            background-color: #eeeeee;
        }
    </style>


</head>
<body>

<div class="row">
    <div class="col-3" style="position: relative; z-index: 2;">
        <my:header/>
    </div>
    <div class="col" style="position: relative; z-index: 1;">

        <div style="display: flex; justify-content : center;">
            <div style="display: flex;justify-content: space-between;width: 900px;">
                <div id="itemListTitle">
                    <h1 id="header">주문 현황</h1>
                </div>
            </div>
        </div>
        <div style="display: flex; justify-content : center;">
            <div class="searchBox">
                <form action="" role="search" id="searchForm">
                    <div class="input-group" style="float: none">
                        <%--                    <input class="form-select" name="m_buyer_region" type="text" list="groupList" id="regionInput"--%>
                        <%--                           onchange="changeValue(this)" style="width: 210px"/>--%>
                        <select class="selectBtn" id="groupList" name="searchNum" onchange="changeValue(this)">
                            <option class="non" name="m_buyer_id" value="all">전체</option>
                            <option class="non" name="m_buyer_id" value="m_buyer_id">거래처 번호</option>
                            <option class="non" name="m_buyer_name" value="m_buyer_name">거래처 명</option>
                            <option class="non" name="m_buyer_region" value="m_buyer_region">거래처 나라</option>
                            <option class="non" name="m_buyer_address" value="m_buyer_address">거래처 주소</option>
                            <option class="non" name="m_buyer_number" value="m_buyer_number">사업자 번호</option>
                            <option class="non" name="m_buyer_currency" value="m_buyer_currency">통화</option>
                        </select>
                        <input type="text" name="searchText" class="form-control">
                        <input class="btn btn-secondary searchBtn" type="button" value="검색" id="searchBtn"/>
                    </div>
                </form>
            </div>
        </div>

        <div style="display: flex; justify-content : center;">
            <div class="tableList">
                <table class="table addList table-striped table-bordered mainTable">
                    <thead>
                    <tr style="font-family: 'LINESeedKR-Bd'">
                        <th>오더 번호</th>
                        <%--            <th scope="col">담당자</th>--%>
                        <th>바이어</th>
                        <th>납품 요청일</th>
                        <th>오더 총 금액</th>
                        <th>승인 상태</th>
                    </tr>
                    </thead>
                    <c:forEach items="${report}" var="report">
                        <tbody>
                        <tr>
                            <th>${report.m_order_id}</th>
                                <%--            <td>Wonsik Jung</td>--%>
                            <td>${report.m_order_buyerName}</td>
                            <td>${report.m_order_inserted}</td>
                            <td>${report.m_order_sumPrice}</td>
                            <td>${report.m_order_status}</td>
                        </tr>
                        <tr>
                            <td colspan="5">
                                <table class="table">
                                    <thead style="text-align: center">
                                    <tr>
                                        <th>#</th>
                                        <th>판매부번</th>
                                        <th>제품명</th>
                                        <th>수량</th>
                                        <th>판매가</th>
                                    </tr>
                                    </thead>
                                    <c:forEach items="${report.orderItemDTOList}" var="items" varStatus="number">
                                        <tbody style="text-align: center">
                                        <tr>
                                            <th>${number.index + 1}</th>
                                            <td>${items.m_order_itemId}</td>
                                            <td>${items.m_order_itemName}</td>
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
        </div>
        <div class="row">
            <div class="col">
                <nav aria-label="Page navigation example">
                    <ul class="pagination" style="display: flex; justify-content : center;">

                        <%-- 맨앞 버튼( 1페이지가 아니면 생김) --%>
                        <c:if test="${buyerDto.currentPageNumber ne 1 }">
                            <c:url value="/buyer/list" var="listLink">
                                <c:param name="page" value="1"/>
                            </c:url>
                            <%-- 맨앞 버튼 --%>
                            <li class="page-item">
                                <a href="${listLink }" class="page-link">
                                    <i class="fa-solid fa-angles-left"></i>
                                </a>
                            </li>
                        </c:if>

                        <c:if test="${buyerDto.hasPrevButton }">
                            <c:url value="/buyer/list" var="listLink">
                                <c:param name="page" value="${buyerDto.jumpPrevPageNumber }"></c:param>
                            </c:url>
                            <li class="page-item">
                                <a href="${listLink }" class="page-link">
                                    <i class="fa-solid fa-angle-left"></i>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach begin="${buyerDto.leftPageNumber}" end="${buyerDto.rightPageNumber}"
                                   var="pageNumber">
                            <c:url value="/buyer/list" var="listLink">
                                <c:param name="page" value="${pageNumber }"/>
                            </c:url>
                            <li class="page-item

                  <%-- 현재페이지에 active 클래스 추가 --%>
                  ${buyerDto.currentPageNumber eq pageNumber ? 'active' : ''} }

                  "><a style="height: 30px" class="page-link" href="${listLink}">${pageNumber}</a>
                            </li>
                        </c:forEach>

                        <%-- 다음 버튼 --%>
                        <c:if test="${buyerDto.hasNextButton }">
                            <c:url value="/buyer/list" var="listLink">
                                <c:param name="page" value="${buyerDto.jumpNextPageNumber }"></c:param>
                            </c:url>
                            <li class="page-item">
                                <a href="${listLink }" class="page-link">
                                    <i class="fa-solid fa-angle-right"></i>
                                </a>
                            </li>
                        </c:if>

                        <%-- 맨뒤 버튼 --%>
                        <c:if test="${buyerDto.currentPageNumber ne buyerDto.lastPageNumber }">
                            <c:url value="/buyer/list" var="listLink">
                                <c:param value="${buyerDto.lastPageNumber }" name="page"/>
                            </c:url>
                            <li class="page-item">
                                <a href="${listLink }" class="page-link">
                                    <i class="fa-solid fa-angles-right"></i>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>


<c:url value="/buyer/register" var="registerLink">
</c:url>
<a href="${registerLink }" class="listHref">
    <i class="fa-sharp fa-solid fa-pen"></i>
</a>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

<script>
    const ctx = "${pageContext.request.contextPath}";


    const changeValue = (target) => {
        // 선택한 option의 value 값
        // console.log(target.value);

        // option의 text 값
        // console.log(target.options[target.selectedIndex].text);
        console.log(target)
        console.log(target.value)
        console.log(target.name)
    }

    document.querySelector("#searchBtn").addEventListener("click", function () {
        document.querySelector("#searchForm").submit();
    })
</script>

</body>
</html>
