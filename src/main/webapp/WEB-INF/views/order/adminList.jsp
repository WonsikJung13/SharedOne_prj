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
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:400,300">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

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

        .table.addList {
            --bs-table-bg: #5f7175;
            --bs-table-color: #fff;
            text-align: center;
            line-height: 39px;
            font-size: 16px;
            width: 1000px;

        }

        tr {
            height: 55px;
            width: 1000px;

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
            width: 1000px;

        }

        .tableList {
            background-color: #fff;
            height: 672px;
            width: 1000px;
            /*margin-bottom: 100px;*/
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
            width: 1000px;

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

        .orderPage {
            width: 1000px;
        }

        .orderModal {
            width: 960px;
        }

        .orderItmeList {
            --bs-table-bg: #5f7175;
            --bs-table-color: #fff;
            text-align: center;
            line-height: 39px;
            font-size: 16px;
            width: 960px;
        }

        .tablePrice {
            width: 400px;
            line-height: 50px;
            text-align: center;
            font-size: 20px;
            font-weight: unset;
            color: white;
            --bs-table-bg: #5f7175;
        }

        textarea {
            height: 140px;
            width: 960px;
            background-color: #fff;
            border-color: #dee2e6;
        }

        .orderDetailBtn {
            text-decoration: underline;
        }

        .orderDetailBtn:hover {
            cursor: pointer;
        }

        .itemBox {
            line-height: 55px;
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
<div class="row">
    <div class="col-3">
        <my:header></my:header>
    </div>
    <div class="col">
        <div style="display: flex;justify-content: space-between;width: 1000px;">
            <div id="itemListTitle">
                <h1 id="header">주문 관리 및 등록</h1>
            </div>
            <div class="itemRegisterBtn">
                <c:url value="/order/register" var="registerLink"></c:url>
                <button type="button" class="btn btn-secondary" onclick="location.href='${registerLink}' ">주문 작성
                </button>
            </div>
        </div>

        <div class="searchBox">
        <c:url value="/order/adminList" var="listLink"></c:url>
            <form action="${listLink}" class="d-flex" role="search">
                <div class="input-group" style="float: none">
                    <select name="t" class="form-select">
                        <option value="all">전체</option>
                        <option value="orderId" ${param.t == 'orderId' ? 'selected' : '' }>주문번호</option>
                        <option value="buyerId" ${param.t == 'buyerId' ? 'selected' : '' }>거래처번호</option>
                        <option value="orderStatus" ${param.t == 'orderStatus' ? 'selected' : '' }>발주상태</option>
                    </select>
                    <input value="${param.q}" type="search" class="form-control" placeholder="Search"
                           aria-label="Search" name="q" style="width:450px">
                    <button class="btn btn-secondary searchBtn" type="submit" value="검색">검색</button>
                </div>
            </form>
        </div>

        <%--   삭제 버튼    --%>
        <div class="row justify-content-end" style="width: 1000px">
            <button style="width: 100px; margin-bottom: 10px;" data-bs-toggle="modal" type="button"
                   id="removeButton"
                   data-bs-target="#removeModal" value="삭제" class="btn btn-danger removeBtn" disabled>삭제
            </button>
        </div>



        <div class="tableList">
            <table class="table table-hover addList">
                <thead style="width: auto">
                <tr>
                    <th><input name="selectAll" type="checkbox" value="selectAll"
                               onclick="selectAll(this)"
                               style="position: relative;top: -14px;background-color: transparent;"></th>
                    <th>주문번호</th>
                    <th>거래처코드</th>
                    <th>거래처명</th>
                    <th>전체금액</th>
                    <th>발주상태</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${orderList }" var="orderList">
                    <tr>
                        <td>
                            <input class="itemBox" name="itemBox" type="checkbox" onclick="checkSelectAll(); activeBtn()" value="${orderList.m_order_id}" style="position: relative;top: 10px">
                        </td>
                        <td onclick="orderDetail(this)" data-value="${orderList.m_order_id}" data-bs-toggle="modal"
                            data-bs-target="#orderConfirm" class="orderDetailBtn">${orderList.m_order_id}</td>
                        <td>${orderList.m_buyer_id}</td>
                        <td>${orderList.m_order_buyerName}</td>
<%--                        <td>${orderList.m_order_buyerCurrency}&nbsp;${orderList.m_order_sumPrice}</td>--%>
                        <td id="${orderList.m_order_id}">${orderList.m_order_buyerCurrency}&nbsp;</td>
                        <td>${orderList.m_order_status}</td>
                        <td>
                            <c:url value="/order/modify" var="modifyLink" >
                                <c:param value="${orderList.m_order_id }" name="m_order_id"/>
                            </c:url>
                            <c:if test="${orderList.m_order_status == '생성중' || orderList.m_order_status == '승인취소'
                            || orderList.m_order_status == '승인반려'}">
                            <button class="btn" onclick="location.href='${modifyLink}' ">수정</button>
                            </c:if>
                            <c:if test="${orderList.m_order_status == '승인완료' || orderList.m_order_status == '승인요청' }">
                                <a class="btn btn-secondary disabled" role="button" aria-disabled="true">수정</a>
                            </c:if>
                        </td>
                    </tr>
                    <script>
                        document.getElementById(${orderList.m_order_id}).innerText += new Intl.NumberFormat().format(${orderList.m_order_sumPrice});
                    </script>
                </c:forEach>
                </tbody>
            </table>
        </div>
            <div class="row">
                <div class="col">
                    <nav aria-label="pagination-container" style="width: 1000px; background-color: #fff">
                        <div class="pagination">

                            <%-- 맨앞 버튼( 1페이지가 아니면 생김) --%>
                            <c:if test="${orderDto.currentPageNumber ne 1 }">
                                <c:url value="/order/adminList" var="listLink">
                                    <c:param name="page" value="1"/>
                                    <c:param name="q" value="${param.q }"/>
                                    <c:param name="t" value="${param.t }"/>
                                </c:url>
                                <a href="${listLink }" class="pagination-newer">
                                    <i class="bi bi-chevron-double-left"></i>
                                </a>
                            </c:if>

                            <%-- 이전 버튼--%>
                            <c:if test="${orderDto.hasPrevButton }">
                                <c:url value="/order/adminList" var="listLink">
                                    <c:param name="page" value="${orderDto.jumpPrevPageNumber }"></c:param>
                                    <c:param name="q" value="${param.q }"/>
                                    <c:param name="t" value="${param.t }"/>
                                </c:url>
                                <a href="${listLink }" class="pagination-newer">
                                    <i class="bi bi-chevron-left"></i>
                                </a>
                            </c:if>


                            <c:forEach begin="${orderDto.leftPageNumber}" end="${orderDto.rightPageNumber}" var="pageNumber">

                                <c:url value="/order/adminList" var="listLink">
                                    <c:param name="page" value="${pageNumber }"/>
                                    <c:param name="q" value="${param.q }"/>
                                    <c:param name="t" value="${param.t }"/>
                                </c:url>
                                <span class="pagination-inner">
                              <%-- 현재페이지에 active 클래스 추가 --%>
                                    <a class="${orderDto.currentPageNumber eq pageNumber ? 'pagination-active' : ''}"
                                       href="${listLink}">${pageNumber}</a>
                                </span>
                            </c:forEach>

                            <%-- 다음 버튼 --%>
                            <c:if test="${orderDto.hasNextButton }">
                                <c:url value="/order/adminList" var="listLink">
                                    <c:param name="page" value="${orderDto.jumpNextPageNumber }"></c:param>
                                    <c:param name="q" value="${param.q }"/>
                                    <c:param name="t" value="${param.t }"/>
                                </c:url>
                                <a href="${listLink }" class="pagination-older">
                                    <i class="bi bi-chevron-right"></i>
                                </a>
                            </c:if>

                            <%-- 맨뒤 버튼 --%>
                            <c:if test="${orderDto.currentPageNumber ne orderDto.lastPageNumber }">
                                <c:url value="/order/adminList" var="listLink">
                                    <c:param value="${orderDto.lastPageNumber }" name="page"/>
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

        <%--오더리스트 삭제하기--%>
        <c:url value="/order/remove" var="removeLink"/>
        <form id="removeForm" action="${removeLink }" method="post">
            <input type="hidden" id="removeInput" name="m_order_id" value="">
        </form>

        <div class="modal fade" id="removeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">삭제확인</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        삭제하시겠습니까?
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" data-bs-dismiss="modal">
                            취소
                        </button>
                        <button id="removeConfirmButton" class="btn btn-danger">
                            삭제
                        </button>
                    </div>
                </div>
            </div>
        </div>








        <%--주문서 확인하기--%>
        <div class="modal fade" id="orderConfirm" tabindex="-1" aria-labelledby="orderConfirmLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content orderPage">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="orderConfirmLabel">주문서 확인</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="" id="orderForm" method="post">
                            <input type="hidden" name="m_order_id" id="m_order_id">
                            <input type="hidden" name="m_order_status" id="m_order_status">

                            <h2>거래처</h2>
                            <table class="table table-bordered orderModal">
                                <tbody>
                                <tr>
                                    <td class="table-active">주문번호</td>
                                    <td class="orderId"></td>
                                    <td class="table-active">주문일</td>
                                    <td class="orderDate"></td>
                                </tr>
                                <tr>
                                    <td class="table-active">거래처</td>
                                    <td class="buyerName"></td>
                                    <td class="table-active">주소</td>
                                    <td class="buyerAddress"></td>
                                </tr>
                                <tr>
                                    <td class="table-active">국가</td>
                                    <td class="buyerRegion"></td>
                                    <td class="table-active">사업자등록번호</td>
                                    <td class="buyerNumber"></td>
                                </tr>
                                <tr>
                                    <td class="table-active">통화</td>
                                    <td class="buyerCurrency"></td>
                                    <td class="table-active">납품요청일</td>
                                    <td colspan="3" class="inserted"></td>
                                </tr>
                                </tbody>
                            </table>


                            <h2>주문 제품</h2>
                            <table class="table orderItmeList">
                                <thead>
                                <tr>
                                    <th scope="col">제품코드</th>
                                    <th scope="col">제품명</th>
                                    <th scope="col">제품품목</th>
                                    <th scope="col">제조사</th>
                                    <th scope="col">판매가격</th>
                                    <th scope="col">주문수량</th>
                                    <th scope="col">총 금액</th>
                                </tr>
                                </thead>
                                <tbody id="itemBody">

                                </tbody>
                            </table>


                            <table class="table table-bordered orderModal">
                                <tbody>
                                <tr>
                                    <th class="tablePrice">주문 총 금액</th>
                                    <td class="sumPrice"></td>
                                </tr>
                                </tbody>
                            </table>
                            <table class="table table-bordered orderModal">
                                <tbody id="requestMessage">
                                <tr>
                                    <th class="tablePrice">승인 요청 메세지</th>
                                    <td class="comment"></td>
                                </tr>
                                </tbody>
                            </table>
                        </form>
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
    const ctx = "${pageContext.request.contextPath}";

    function orderDetail(target) {
        const m_order_id = target.dataset.value;

        fetch(`\${ctx}/order/adminList/` + m_order_id, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            }
        })
            .then(res => res.json())
            .then(data => {

                document.querySelector(".buyerName").innerHTML = data.m_order_buyerName;
                document.querySelector(".buyerAddress").innerHTML = data.m_order_buyerAddress;
                document.querySelector(".buyerRegion").innerHTML = data.m_order_buyerRegion;
                document.querySelector(".buyerCurrency").innerHTML = data.m_order_buyerCurrency;
                document.querySelector(".buyerNumber").innerHTML = data.m_order_buyerNumber;
                document.querySelector(".inserted").innerHTML = data.m_order_inserted;
                // document.querySelector(".sumPrice").innerHTML = data.m_order_sumPrice;
                document.querySelector(".comment").innerHTML = data.m_order_comment;
                document.querySelector(".orderId").innerHTML = data.m_order_id;
                document.querySelector(".orderDate").innerHTML = data.m_order_date;

                let currency = data.m_order_buyerCurrency
                let sum = new Intl.NumberFormat().format(data.m_order_sumPrice);
                document.querySelector(".sumPrice").innerHTML = currency + " " + sum;

                // 승인권자 메세지 보여주기
                const memo = data.m_order_memo;
                if(data.m_order_status === '승인반려' || data.m_order_status === '승인완료'){
                    const i = `     <tr class="orderMemo">
                                        <th class="tablePrice">승인권자 메세지</th>
                                        <td class="memo">\${memo}</td>
                                    </tr>`
                    document.querySelector("#requestMessage").insertAdjacentHTML("beforeend", i);
                }

                if (document.getElementById('itemBody').childElementCount == 0) {
                    for (let i = 0; i < data.orderItemDTOList.length; i++) {
                        data.orderItemDTOList.at(i).m_order_price
                        let price = new Intl.NumberFormat().format(data.orderItemDTOList.at(i).m_order_price)
                        let totalPrice = new Intl.NumberFormat().format(data.orderItemDTOList.at(i).m_order_totalPrice)

                        let itemTR = document.createElement("tr")
                        itemTR.setAttribute("class", "orderItemLists")
                        let itemTD1 = document.createElement("td");
                        itemTD1.appendChild(document.createTextNode(data.orderItemDTOList.at(i).m_order_itemId + ""));
                        let itemTD2 = document.createElement("td");
                        itemTD2.appendChild(document.createTextNode(data.orderItemDTOList.at(i).m_order_itemName + ""));
                        let itemTD3 = document.createElement("td");
                        itemTD3.appendChild(document.createTextNode(data.orderItemDTOList.at(i).m_order_itemGroup + ""));
                        let itemTD4 = document.createElement("td");
                        itemTD4.appendChild(document.createTextNode(data.orderItemDTOList.at(i).m_order_itemManufacturer + ""));
                        let itemTD5 = document.createElement("td");
                        itemTD5.appendChild(document.createTextNode(price + ""));
                        let itemTD6 = document.createElement("td");
                        itemTD6.appendChild(document.createTextNode(data.orderItemDTOList.at(i).m_order_count + ""));
                        let itemTD7 = document.createElement("td");
                        itemTD7.appendChild(document.createTextNode(totalPrice + ""));

                        itemTR.appendChild(itemTD1);
                        itemTR.appendChild(itemTD2);
                        itemTR.appendChild(itemTD3);
                        itemTR.appendChild(itemTD4);
                        itemTR.appendChild(itemTD5);
                        itemTR.appendChild(itemTD6);
                        itemTR.appendChild(itemTD7);
                        itemBody.appendChild(itemTR);
                    }
                }


            })
    }


    // document.querySelector("#removeButton").addEventListener("click", remove);

    // 모달창 열기전에 오더 제품리스트 데이터 삭제
    $(document).ready(function(){
        $('#orderConfirm').on('hidden.bs.modal', function () {
            let a = document.querySelectorAll(".orderItemLists");

            for (let i = 0; i < a.length; i++) {
                const item = a.item(i)
                item.remove();

            }
        });

    });

    $(document).ready(function(){
        $('#orderConfirm').on('hidden.bs.modal', function () {
            let a = document.querySelector(".orderMemo");

                a.remove();

        });

    });

    // 삭제버튼 클릭
    document.querySelector("#removeConfirmButton").addEventListener("click", function () {
        remove();
        document.getElementById('removeForm').submit();
    })

    // 삭제 진행
    function remove() {
        var length = document.getElementsByName("itemBox").length;
        var removeIdList = [];
        for (var i = 0; i < length; i++) {
            var checkedBox = document.getElementsByName("itemBox")[i].checked
            if (checkedBox) {
                var selectId = document.getElementsByName("itemBox")[i].value;
                removeIdList.push(selectId);
            }
        }
        document.querySelector("#removeInput").value = removeIdList;
    }

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
        console.log(checked.length);
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
                console.log("selectId: " + selectId);
                removeIdList.push(selectId);
            }
        }
        console.log(removeIdList)
        document.querySelector("#removeInput").value = removeIdList;
        console.log(document.querySelector("#removeInput").value);
        document.getElementById('removeForm').submit();
    }
</script>
<script>

</script>
</body>
</html>
