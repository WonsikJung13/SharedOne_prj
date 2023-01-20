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
            --bs-table-bg: #fff;
        }

        .table.addList {
            --bs-table-bg: #5f7175;
            --bs-table-color: #fff;
            text-align: center;
            line-height: 39px;
            font-size: 16px;

        }

        .orderPage {
            width: 1000px;
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

        .modal-content {
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

        .modal {
            --bs-modal-width: 50%;
        }
        .table-active{
            width: 180px;
        }
        .tableTd{
            width:299.5px;
        }
        .statusBtn{
            margin: 0 auto;
        }
        .modal-footer{
            border-top:none;
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
        <div>
            <div>
                <h1><i class="fa-solid fa-layer-group" style="margin-right: 10px;"></i>주문 관리 및 승인</h1>
            </div>
        </div>

        <div class="searchBox">
            <c:url value="/order/list" var="listLink"></c:url>
            <form action="${listLink}" class="d-flex" role="search">
                <div class="input-group flex-nowrap" style="float: none">
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

        <div class="tableList">
            <table class="table table-hover addList">
                <thead style="width: auto">
                <tr>
                    <th>주문번호</th>
                    <th>거래처코드</th>
                    <th>거래처명</th>
                    <th>전체금액</th>
                    <th>발주상태</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${orderList }" var="orderList">
                    <c:if test="${orderList.m_order_status == '승인요청' || orderList.m_order_status == '승인완료'}">
                        <tr onclick="orderDetail(this)" data-value="${orderList.m_order_id}" data-bs-toggle="modal"
                            data-bs-target="#orderConfirm" value="" style="cursor: pointer;">
                            <td>${orderList.m_order_id}</td>
                            <td>${orderList.m_buyer_id}</td>
                            <td>${orderList.m_order_buyerName}</td>
<%--                            <td>${orderList.m_order_buyerCurrency}&nbsp;${orderList.m_order_sumPrice}</td>--%>
                            <td id="${orderList.m_order_id}">${orderList.m_order_buyerCurrency}&nbsp;</td>
                            <td class="orderStatusValue">${orderList.m_order_status}</td>
                        </tr>
                    </c:if>
                    <script>
                        document.getElementById(${orderList.m_order_id}).innerText += new Intl.NumberFormat().format(${orderList.m_order_sumPrice});
                    </script>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <%-- 페이지네이션   --%>
        <div class="row">
            <div class="col">
                <nav aria-label="pagination-container" style="background-color:#fff">
                    <div class="pagination">

                        <%-- 맨앞 버튼( 1페이지가 아니면 생김) --%>
                        <c:if test="${orderDto.currentPageNumber ne 1 }">
                            <c:url value="/order/list" var="listLink">
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
                            <c:url value="/order/list" var="listLink">
                                <c:param name="page" value="${OrderDto.jumpPrevPageNumber }"></c:param>
                                <c:param name="q" value="${param.q }"/>
                                <c:param name="t" value="${param.t }"/>
                            </c:url>
                            <a href="${listLink }" class="pagination-newer">
                                <i class="bi bi-chevron-left"></i>
                            </a>
                        </c:if>

                        <c:forEach begin="${orderDto.leftPageNumber}" end="${orderDto.rightPageNumber}"
                                   var="pageNumber">
                            <c:url value="/order/list" var="listLink">
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
                            <c:url value="/order/list" var="listLink">
                                <c:param name="page" value="${OrderDto.jumpNextPageNumber }"></c:param>
                                <c:param name="q" value="${param.q }"/>
                                <c:param name="t" value="${param.t }"/>
                            </c:url>
                            <a href="${listLink }" class="pagination-older">
                                <i class="bi bi-chevron-right"></i>
                            </a>
                        </c:if>

                        <%-- 맨뒤 버튼 --%>
                        <c:if test="${orderDto.currentPageNumber ne orderDto.lastPageNumber }">
                            <c:url value="/order/list" var="listLink">
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

        <form id="removeForm" action="${removeLink }" method="post">
            <input type="hidden" name="replyName" value="${Buyer.m_buyer_id }">
        </form>
    </div>

    <%--주문서 확인하기--%>
    <div class="modal fade" id="orderConfirm" tabindex="-1" aria-labelledby="orderConfirmLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content orderPage">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="orderConfirmLabel">
                        <i class="fa-solid fa-square-check" style="margin-right: 6px; color: #505f62"></i>주문서 확인</h1>
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
                                <td class="orderId tableTd"></td>
                                <td class="table-active">주문일</td>
                                <td class="orderDate tableTd"></td>
                            </tr>
                            <tr>
                                <td class="table-active">거래처</td>
                                <td class="buyerName tableTd"></td>
                                <td class="table-active">주소</td>
                                <td class="buyerAddress tableTd"></td>
                            </tr>
                            <tr>
                                <td class="table-active">국가</td>
                                <td class="buyerRegion tableTd"></td>
                                <td class="table-active">사업자등록번호</td>
                                <td class="buyerNumber tableTd"></td>
                            </tr>
                            <tr>
                                <td class="table-active">통화</td>
                                <td class="buyerCurrency tableTd"></td>
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
                            <tbody>
                            <tr>
                                <th class="tablePrice">승인 요청 메세지</th>
                                <td class="comment"></td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="commentStyle orderView">
                            <h2>메세지</h2>
                            <div>
                                <textarea id="message" name="m_order_memo"></textarea>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="modal-footer statusBtn">
                    <button id="orderReturnButton" class="btn btn-secondary">
                        승인반려
                    </button>
                    <button id="orderConfirmButton" class="btn btn-danger">
                        승인확인
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
        const ctx = "${pageContext.request.contextPath}";

        function orderDetail(target) {
            const m_order_id = target.dataset.value;
            fetch(`\${ctx}/order/list/` + m_order_id, {
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
                    let currency = data.m_order_buyerCurrency
                    let sum = new Intl.NumberFormat().format(data.m_order_sumPrice);
                    document.querySelector(".sumPrice").innerHTML = currency + " " + sum;
                    document.querySelector(".comment").innerHTML = data.m_order_comment;
                    document.querySelector(".orderId").innerHTML = data.m_order_id;
                    document.querySelector(".orderDate").innerHTML = data.m_order_date;

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
                    const status = data.m_order_status;
                    if( data.m_order_status  === '승인완료'){
                        document.querySelector(".orderView").style.display = 'none';
                        document.querySelector(".statusBtn").style.display = 'none';
                    } else {
                        document.querySelector(".orderView").style.display = 'block';
                        document.querySelector(".statusBtn").style.display = 'block';
                    }
                })

            // const a =document.querySelector(".orderStatusValue").innerText;

        }

        // 승인 확인 버튼
        document.querySelector("#orderConfirmButton").addEventListener("click", function () {
            const orderId = document.querySelector(".orderId").innerText;
            document.querySelector("#m_order_id").value = orderId;
            document.querySelector("#m_order_status").value = "승인완료";

            document.querySelector("#orderForm").submit();
        })
        // 승인 반려 버튼
        document.querySelector("#orderReturnButton").addEventListener("click", function () {
            const orderId = document.querySelector(".orderId").innerText;
            document.querySelector("#m_order_id").value = orderId;

            //오더 상태 input value
            document.querySelector("#m_order_status").value = "승인반려";

            document.querySelector("#orderForm").submit();
        })

        // 모달창 열기전에 오더 제품리스트 데이터 삭제
        $(document).ready(function () {
            $('#orderConfirm').on('hidden.bs.modal', function () {
                let a = document.querySelectorAll(".orderItemLists");

                for (let i = 0; i < a.length; i++) {
                    const item = a.item(i)
                    item.remove();

                }
            });

        });

        function activeBtn() {

            const checked = document.querySelectorAll('input[name="itemBox"]:checked');
            if (checked.length == 0) {
                document.querySelector(".removeBtn").disabled = true;
            } else {
                document.querySelector(".removeBtn").disabled = false;
            }
        }
        // doDisplay();
        // // 승인 요청일때 메세지 작성, 승인완료반려 버튼 보여줌
        // function doDisplay(){
        //     var con =  document.querySelector(".requestBtn");
        //     if(m_order_status == '승인완료'){
        //         con.style.display = 'none';
        //     }else{
        //         con.style.display = 'block';
        //     }
        // }


    </script>
</body>
</html>
