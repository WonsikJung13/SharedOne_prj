<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>list</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:400,300">
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
        .itemRegisterBtn {
            position: relative;
        }

        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #eeeeee;
        }

        .table {
            /*width: 1000px;*/
            --bs-table-bg: #fff;
        }

        .table.addList {
            --bs-table-bg: #5f7175;
            --bs-table-color: #fff;
            text-align: center;
            line-height: 39px;
            font-size: 16px;
            height: 616px;
            /*width: 1000px;*/

        }

        tr {
            max-height: 55px;
            /*width: 1000px;*/

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
            /*width: 1000px;*/
            padding: 6px;
        }

        .tableList {
            background-color: #fff;
            height: 672px;
            overflow: auto;
        }

        td a {
            color: #37393b;
            background-color: #fff;
            text-decoration: none;
        }

        .table button {
            color: #fff;
            /*border-radius: 0;*/
            width: 60px;
            --bs-btn-font-weight: 600;
            border: none;
        }

        .searchBox {
            background-color: white;
            padding: 20px 80px 5px 80px;
            color: #212529;
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        form > * {
            background-color: white;
            position: relative;
        }

        form .form-control, .form-select {
            height: 40px;
            margin: 5px 0 5px 0;
            /*width: 1000px;*/

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

        th {
            width: 15%;
        }

        /*페이지네이션*/
        .pagination {
            position: relative;
            justify-content: center;
            height: 50px;
            /*right: 10%;*/
        }

        .pagination a {
            z-index: 2;
            position: relative;
            display: inline-block;
            color: #2c3e50;
            text-decoration: none;
            /*font-size: 1.2rem;*/
            padding: 9px 15px 4px;
            font-family: 'Open Sans', sans-serif;
        }

        .pagination a:before {
            z-index: -1;
            position: absolute;
            height: 100%;
            width: 100%;
            content: "";
            top: 0;
            left: 0;
            background-color: #2c3e50;
            border-radius: 24px;
            transform: scale(0);
            transition: all 0.2s;
        }

        .pagination a:hover,
        .pagination a .pagination-active {
            color: #fff;
        }

        .pagination a:hover:before,
        .pagination a .pagination-active:before {
            transform: scale(1);
        }

        .pagination .pagination-active {
            color: #fff;
        }

        .pagination .pagination-active:before {
            transform: scale(1);
        }

        .pagination-newer, .pagination-older {
            border-style: solid;
            border-width: 0;
            border-radius: 20px;
            padding: 9px 10px !important;
            margin-bottom: 13px;
        }
        .btnStyle{
            background-color: #598f9b;
        }

        .btnStyle:hover{
            background-color: #52727b;
            color : white;
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
            <div class="row justify-content-between">
            <div class="col-4">
                <h1 id="header"><i class="fa-solid fa-layer-group" style="margin-right: 10px;"></i>판매가 관리 및 등록</h1>
                <%--      <h2>제품 검색</h2>--%>
            </div>
            <div class="itemRegisterBtn col-auto">
                <c:url value="/price/register" var="registerLink"></c:url>
                <button type="button" class="btn btn-secondary" onclick="location.href='${registerLink}' ">판매가 등록
                </button>
            </div>
        </div>

        <div class="searchBox">
            <c:url value="/price/list" var="listLink"></c:url>
            <form action="${listLink}" class="" role="search" style="margin-bottom: 16px;   ">
<%--                조회 기간--%>
<%--                <div class="input-group" style="float: none">--%>
<%--                    <select name="t" class="form-select">--%>
<%--                        <option value="all">전체</option>--%>
<%--                        <option value="m_price_startPeriod" ${param.t == 'm_price_startPeriod' ? 'selected' : '' }>시작일</option>--%>
<%--                        <option value="m_price_lastPeriod" ${param.t == 'm_price_lastPeriod' ? 'selected' : '' }>종료일</option>--%>
<%--                    </select>--%>

<%--                    <input value="${param.q}" type="date" class="form-control" placeholder=""--%>
<%--                           aria-label="Search" name="q" style="width:450px">--%>
<%--                    <button class="btn btn-secondary searchBtn" type="submit" value="검색">검색</button>--%>
<%--                </div>--%>
                <div  class="input-group flex-nowrap" style="float: none">
                    <select name="t" class="form-select">
                        <option value="all">전체</option>
                        <option value="m_item_id" ${param.t == 'm_item_id' ? 'selected' : '' }>제품코드</option>
                        <option value="m_item_name" ${param.t == 'm_item_name' ? 'selected' : '' }>제품명</option>
                        <option value="m_buyer_id" ${param.t == 'm_buyer_id' ? 'selected' : '' }>거래처코드</option>
                        <option value="m_buyer_name" ${param.t == 'm_buyer_name' ? 'selected' : '' }>거래처명</option>
                        <option value="m_price_startPeriod" ${param.t == 'm_price_startPeriod' ? 'selected' : '' }>시작일</option>
                        <option value="m_price_lastPeriod" ${param.t == 'm_price_lastPeriod' ? 'selected' : '' }>종료일</option>
                    </select>

                    <input value="${param.q}" type="search" class="form-control" placeholder="Search"
                           aria-label="Search" name="q" style="width:450px">
                    <button class="btn btn-secondary searchBtn" type="submit" value="검색">검색</button>
                </div>
            </form>
        </div>
        <div style="display: flex;background-color: transparent;">
            <c:url value="/price/remove" var="removeLink"/>
            <form id="removeForm" action="${removeLink }" method="post">
                <input type="hidden" id="removeInput" name="m_price_id" value="">
            </form>
            <button class="btn btn-danger" id="checkRemove" style="margin-left: auto;margin-bottom: 10px;" data-bs-toggle="modal"
                    data-bs-target="#removeModal" value="삭제" disabled="disabled">선택삭제
            </button>
        </div>
        <div class="tableList">

            <table style="table-layout: fixed;" class="table addList">
                <thead style="width: auto">
                <tr>
                    <th style="width: 6%; padding-left: 10px">
                        <input type='checkbox' name='allPriceBox' onclick='selectAll(this)'/>
                    </th>
                    <th>제품코드</th>
                    <th>제품명</th>
                    <th style="min-width:94px;width: 16%">거래처코드</th>
                    <th>거래처명</th>
                    <th style="min-width:105px;width: 17%">시작일</th>
                    <th style="width: 17%">종료일</th>
                    <th style="min-width:40px;width: 8%">통화</th>
                    <th style="width: 11%">할인율</th>
                    <th>금액</th>
                    <th>최종금액</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${priceList }" var="priceList" varStatus="status">
                    <tr>
                        <td style="padding-left: 10px">
                            <input name="priceBox" type="checkbox" onclick="checkSelectAll()" value="${priceList.m_price_id}">
                        </td>
                        <td>${priceList.m_item_id }</td>
                        <td>${priceList.m_item_name }</td>
                        <td>${priceList.m_buyer_id }</td>
                        <td>${priceList.m_buyer_name }</td>
                        <td>${priceList.m_price_startPeriod }</td>
                        <td>${priceList.m_price_lastPeriod }</td>
                        <td>${priceList.m_price_currency }</td>
                        <td>${priceList.m_price_discount }%</td>
<%--                        <td>${priceList.m_price_price }</td>--%>
<%--                        <td>${priceList.m_price_lastPrice }</td>--%>
                        <td id="${status.index}price"></td>
                        <td id="${status.index}last"></td>
                        <td>
                            <c:url value="/price/modify" var="modifyLink">
                                <c:param value="${priceList.m_price_id }" name="m_price_id"/>
                            </c:url>
                            <button type="button" class="btn btnStyle" onclick="location.href='${modifyLink}' ">수정</button>
                        </td>
                    </tr>
                    <script>
                        var pric = new Intl.NumberFormat().format(${priceList.m_price_price })
                        var lastpric = new Intl.NumberFormat().format(${priceList.m_price_lastPrice })
                        document.getElementById('${status.index}price').innerText = pric;
                        document.getElementById('${status.index}last').innerText = lastpric;
                    </script>
                </c:forEach>
                </tbody>
            </table>
        </div>


        <div class="row">
            <div class="col">
                <nav aria-label="pagination-container" style="background-color: #fff">
                    <div class="pagination">

                        <%-- 맨앞 버튼( 1페이지가 아니면 생김) --%>
                        <c:if test="${priceDto.currentPageNumber ne 1 }">
                            <c:url value="/price/list" var="listLink">
                                <c:param name="page" value="1"/>
                                <c:param name="q" value="${param.q }"/>
                                <c:param name="t" value="${param.t }"/>
                            </c:url>
                            <a href="${listLink }" class="pagination-newer">
                                <i class="bi bi-chevron-double-left"></i>
                            </a>
                        </c:if>

                        <%-- 이전 버튼--%>
                        <c:if test="${priceDto.hasPrevButton }">
                            <c:url value="/price/list" var="listLink">
                                <c:param name="page" value="${priceDto.jumpPrevPageNumber }"></c:param>
                                <c:param name="q" value="${param.q }"/>
                                <c:param name="t" value="${param.t }"/>
                            </c:url>
                            <a href="${listLink }" class="pagination-newer">
                                <i class="bi bi-chevron-left"></i>
                            </a>
                        </c:if>

                        <c:forEach begin="${priceDto.leftPageNumber}" end="${priceDto.rightPageNumber}" var="pageNumber">
                            <c:url value="/price/list" var="listLink">
                                <c:param name="page" value="${pageNumber }"/>
                                <c:param name="q" value="${param.q }"/>
                                <c:param name="t" value="${param.t }"/>
                            </c:url>
                            <span class="pagination-inner">
                                <%-- 현재페이지에 active 클래스 추가 --%>
                                <a class="${priceDto.currentPageNumber eq pageNumber ? 'pagination-active' : ''} }" href="${listLink}">${pageNumber}</a>
                            </span>
                        </c:forEach>

                        <%-- 다음 버튼 --%>
                        <c:if test="${priceDto.hasNextButton }">
                            <c:url value="/price/list" var="listLink">
                                <c:param name="page" value="${priceDto.jumpNextPageNumber }"></c:param>
                                <c:param name="q" value="${param.q }"/>
                                <c:param name="t" value="${param.t }"/>
                            </c:url>
                            <a href="${listLink }" class="pagination-older">
                                <i class="bi bi-chevron-right"></i>
                            </a>
                        </c:if>

                        <%-- 맨뒤 버튼 --%>
                        <c:if test="${priceDto.currentPageNumber ne priceDto.lastPageNumber }">
                            <c:url value="/price/list" var="listLink">
                                <c:param value="${priceDto.lastPageNumber }" name="page"/>
                                <c:param name="q" value="${param.q }"/>
                                <c:param name="t" value="${param.t }"/>
                            </c:url>
                            <a href="${listLink }" class="pagination-older">
                                <i class="bi bi-chevron-double-right"></i>
                            </a>
                        </c:if>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</div>
<!-- remove Modal -->
<div class="modal fade" id="removeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 style="font-family: 'LINESeedKR-Bd'" class="modal-title fs-5" id="exampleModalLabel">삭제
                    확인</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                삭제하시겠습니까? 복구할 수 없습니다.
            </div>
            <div class="modal-footer">
                <button style="font-family: 'LINESeedKR-Bd'" type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">취소
                </button>
                <button style="font-family: 'LINESeedKR-Bd'" id="removeButton" type="submit"
                        class="btn btn-danger">확인
                </button>
            </div>
        </div>
    </div>
</div>
</div>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous">
</script>
<script>

    // 체크박스 선택 삭제
    function remove() {
        var length = document.getElementsByName("priceBox").length;
        var removeIdList = [];
        for (var i = 0; i < length; i++) {
            var checkedBox = document.getElementsByName("priceBox")[i].checked
            if (checkedBox) {
                var selectId = document.getElementsByName("priceBox")[i].value;
                removeIdList.push(selectId);
            }
        }
        document.querySelector("input[name='m_price_id']").value = removeIdList;
        document.getElementById('removeForm').submit();
    }

    document.querySelector("#removeButton").addEventListener("click", remove);

    // 체크 박스 하나라도 체크 해제시 전체 선택 해제
    function checkSelectAll()  {
        // 전체 체크박스
        const checkboxes
            = document.querySelectorAll('input[name="priceBox"]');
        // 선택된 체크박스
        const checked
            = document.querySelectorAll('input[name="priceBox"]:checked');
        // select all 체크박스
        const selectAll
            = document.querySelector('input[name="allPriceBox"]');

        // 체크박스 선택 시 삭제버튼 활성화
        if (checked.length > 0) {
            document.querySelector("#checkRemove").disabled = false;
        } else {
            document.querySelector("#checkRemove").disabled = true;
        }

        if(checkboxes.length === checked.length)  {
            selectAll.checked = true;
        }else {
            selectAll.checked = false;
        }

    }

    // 체크박스 전체 선택
    function selectAll(selectAll)  {
        const checkboxes = document.getElementsByName('priceBox');
        const checked = document.querySelectorAll('input[name="priceBox"]:checked');

        checkboxes.forEach((checkbox) => {
            checkbox.checked = selectAll.checked;
        })

        // 전체 체크박스 선택 시 삭제버튼 활성화
        if (checkboxes.length === 10 && checked.length === 10) {
            document.querySelector("#checkRemove").disabled = true;
        } else {
            document.querySelector("#checkRemove").disabled = false;
        }
    }


</script>

</html>