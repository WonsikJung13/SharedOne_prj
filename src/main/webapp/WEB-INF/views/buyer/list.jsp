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
    <title>거래처 관리 및 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"
            integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style>
        .row {
            --bs-gutter-x: 0;
        }

        .itemRegisterBtn {
            position: relative;
        }

        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #eeeeee;
        }

        .table {
            width: 1000px;
            --bs-table-bg: #fff;
        }

        .table.addList, label {
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
            border: none;
        }

        .searchBox {
            background-color: white;
            width: 1000px;
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

    </style>


</head>
<body>
<c:url value="/buyer/remove" var="removeLink"/>
<div class="row">
    <div class="col-3">
        <my:header></my:header>
    </div>
    <div class="col">

<%--        <div style="display: flex; justify-content : center;">--%>
            <div style="display: flex;justify-content: space-between;width: 900px;">
                <div id="itemListTitle">
                    <h1 id="header">거래처 관리 및 등록</h1>
                </div>
                <div class="itemRegisterBtn">
                    <c:url value="/buyer/register" var="registerLink"></c:url>
                    <button type="button" class="btn btn-secondary" onclick="location.href='${registerLink}' ">거래처 등록
                    </button>
                    <form id="removeForm" action="${removeLink }" method="post">
                        <input type="hidden" id="removeInput" name="m_buyer_id" value="">
                    </form>
                </div>
            </div>
<%--        </div>--%>
<%--        <div style="display: flex; justify-content : center;">--%>
            <div class="searchBox">
                <form action="" class="d-flex" role="search" id="searchForm">
                    <div class="input-group" style="float: none">
                        <select class="selectBtn form-select" id="groupList" name="searchNum" onchange="changeValue(this)" style="max-width: 200px">
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
<%--        </div>--%>

<%--        <div style="display: flex; justify-content : center;">--%>
    <div style="display: flex;background-color: transparent;width:1000px">


        <button class="btn btn-danger removeBtn" style="margin-left: auto;margin-bottom: 10px;"
                data-bs-toggle="modal"
                data-bs-target="#removeModal" value="삭제" disabled>선택삭제
        </button>
    </div>
            <div class="tableList">
                <table class="table addList">
                    <tbody>
                    <tr style="font-family: 'LINESeedKR-Bd'">
                        <th style="width: 50px"><input name="selectAll" type="checkbox" value="selectAll"
                                                       onclick="selectAll(this)"
                                                       style="position: relative;top: 14px;background-color: transparent;">
                        </th>
                        <th>거래처 번호</th>
                        <th>거래처명</th>
                        <th>거래처 나라</th>
                        <th>거래처 주소</th>
                        <th>사업자 번호</th>
                        <th>통화</th>
                        <th></th>
                    </tr>
                    <c:forEach items="${buyerList }" var="buyer">
                        <tr>
                            <td>
                                <input name="itemBox" type="checkbox" value="${buyer.m_buyer_id}"
                                       onclick='checkSelectAll(); activeBtn()' style="position: relative;top: 10px">
                            </td>
                            <td id="id">
                                    ${buyer.m_buyer_id  }
                            </td>
                            <td>${buyer.m_buyer_name }</td>
                            <td>${buyer.m_buyer_region }</td>
                            <td>${buyer.m_buyer_address }</td>
                            <td>${buyer.m_buyer_number }</td>
                            <td>${buyer.m_buyer_currency}</td>
                            <td>
                                <c:url value="/buyer/modify" var="modifyLink">
                                    <c:param value="${buyer.m_buyer_id }" name="m_buyer_id"/>
                                </c:url>
                                <button type="button" class="btn" onclick="location.href='${modifyLink}' ">수정</button>


                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
<%--        </div>--%>
        <div class="row">
            <div class="col">
                <nav aria-label="pagination-container" style="width: 1000px; background-color: #fff">
                    <div class="pagination">

                        <%-- 맨앞 버튼( 1페이지가 아니면 생김) --%>
                        <c:if test="${buyerDto.currentPageNumber ne 1 }">
                            <c:url value="/buyer/list" var="listLink">
                                <c:param name="page" value="1"/>
                                <c:param name="q" value="${param.q }"/>
                                <c:param name="t" value="${param.t }"/>
                            </c:url>
                            <a href="${listLink }" class="pagination-newer">
                                <i class="bi bi-chevron-double-left"></i>
                            </a>
                        </c:if>

                        <%-- 이전 버튼--%>
                        <c:if test="${buyerDto.hasPrevButton }">
                            <c:url value="/buyer/list" var="listLink">
                                <c:param name="page" value="${buyerDto.jumpPrevPageNumber }"></c:param>
                                <c:param name="q" value="${param.q }"/>
                                <c:param name="t" value="${param.t }"/>
                            </c:url>
                            <a href="${listLink }" class="pagination-newer">
                                <i class="bi bi-chevron-left"></i>
                            </a>
                        </c:if>

                        <c:forEach begin="${buyerDto.leftPageNumber}" end="${buyerDto.rightPageNumber}" var="pageNumber">
                            <c:url value="/buyer/list" var="listLink">
                                <c:param name="page" value="${pageNumber }"/>
                                <c:param name="q" value="${param.q }"/>
                                <c:param name="t" value="${param.t }"/>
                            </c:url>
                            <span class="pagination-inner">
                              <%-- 현재페이지에 active 클래스 추가 --%>
                                <a class="${buyerDto.currentPageNumber eq pageNumber ? 'pagination-active' : ''}" href="${listLink}">${pageNumber}</a>
                        </span>
                        </c:forEach>

                        <%-- 다음 버튼 --%>
                        <c:if test="${buyerDto.hasNextButton }">
                            <c:url value="/buyer/list" var="listLink">
                                <c:param name="page" value="${buyerDto.jumpNextPageNumber }"></c:param>
                                <c:param name="q" value="${param.q }"/>
                                <c:param name="t" value="${param.t }"/>
                            </c:url>
                            <a href="${listLink }" class="pagination-older">
                                <i class="bi bi-chevron-right"></i>
                            </a>
                        </c:if>

                        <%-- 맨뒤 버튼 --%>
                        <c:if test="${buyerDto.currentPageNumber ne buyerDto.lastPageNumber }">
                            <c:url value="/buyer/list" var="listLink">
                                <c:param value="${buyerDto.lastPageNumber }" name="page"/>
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
<script>
    $('.pagination-inner a').on('click', function () {
        $(this).siblings().removeClass('pagination-active');
        $(this).addClass('pagination-active');
    })
</script>

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

    document.querySelector("#searchBtn").addEventListener("click", function () {
        document.querySelector("#searchForm").submit();
    })

    // 전체선택 풀기
    function checkSelectAll() {
        const selectAll = document.querySelector('input[name="selectAll"]');
        const checkboxes = document.querySelectorAll('input[name="itemBox"]');
        const checked = document.querySelectorAll('input[name="itemBox"]:checked');

        if (checkboxes.length === checked.length) {
            selectAll.checked = true;
        } else {
            selectAll.checked = false;
        }
    }

    // 전체선택 하기
    function selectAll(selectAll) {
        const checkboxes = document.getElementsByName('itemBox');
        const checked = document.querySelectorAll('input[name="itemBox"]:checked');

        checkboxes.forEach((checkbox) => {
            checkbox.checked = selectAll.checked
        })
        // 전체선택 시 삭제버튼 활성화
        if (checkboxes.length === 10 && checked.length === 10) {
            document.querySelector(".removeBtn").disabled = true;
        } else {
            document.querySelector(".removeBtn").disabled = false;
        }
    }

    // 삭제버튼 활성화
    function activeBtn() {
        const checked = document.querySelectorAll('input[name="itemBox"]:checked');
        if (checked.length > 0) {
            document.querySelector(".removeBtn").disabled = false;
        } else {
            document.querySelector(".removeBtn").disabled = true;
        }
    }

    // 삭제 진행
    function remove() {
        const length = document.getElementsByName("itemBox").length;
        const removeIdList = [];
        for (let i = 0; i < length; i++) {
            const checkedBox = document.getElementsByName("itemBox")[i].checked;

            if (checkedBox) {
                const selectId = document.getElementsByName("itemBox")[i].value;
                removeIdList.push(selectId);
            }
        }
        document.querySelector("#removeInput").value = removeIdList;
        document.getElementById('removeForm').submit();
    }

    // 삭제버튼 클릭 시
    document.querySelector("#removeButton").addEventListener("click", remove);

    setTimeout(function (){
        history.go(1)
    }, 4000)
</script>

</body>
</html>
