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
        .row{
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
            margin-bottom: 100px;
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
                        <c:url value="/item/list" var="listLink"></c:url>
                        <form action="${listLink}" role="search">
                            <div class="searchBox ">
                                    <div class="row justify-content-start">
                                        <div class="col-4">
                                            <label>제품코드</label>
                                            <input class="form-select" type="text" list="itemList" style="width: 210px;"
                                                   autocomplete="off"/>
                                            <datalist id="itemList">
                                                <c:forEach items="${itemList}" var="itemList">
                                                    <option class="non" value="${itemList.m_item_id}">${itemList.m_item_name}</option>
                                                </c:forEach>
                                            </datalist>
                                        </div>
                                        <div class="col-4">
                                            <label>거래처코드</label>
                                            <input class="form-select" type="text" list="buyerList" style="width: 210px;"
                                                   autocomplete="off"/>
                                            <datalist id="buyerList">
                                                <c:forEach items="${buyerList}" var="buyerList">
                                                    <option class="non" value="${buyerList.m_buyer_id}">${buyerList.m_buyer_name}</option>
                                                </c:forEach>
                                            </datalist>
                                        </div>
                                    </div>
                                    <div class="input-group" style="float: none">
                                        <input type="text" class="form-control">
                                        <button class="btn btn-secondary searchBtn" type="submit">검색</button>
                                    </div>
                            </div>
                        </form>

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
                                <tr onclick="orderDetail(this)" data-value="${orderList.m_order_id}" data-bs-toggle="modal"
                                    data-bs-target="#orderConfirm" value="" style="cursor: pointer;">
                                    <td>${orderList.m_order_id}</td>
                                    <td>${orderList.m_buyer_id}</td>
                                    <td>${orderList.m_order_buyerName}</td>
                                    <td>${orderList.m_order_buyerCurrency}&nbsp;${orderList.m_order_sumPrice}</td>
                                    <td>${orderList.m_order_status}</td>
                                </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

        <form id="removeForm" action="${removeLink }" method="post">
            <input type="hidden" name="replyName" value="${Buyer.m_buyer_id }">
        </form>

            <%--주문서 확인하기--%>
            <div class="modal fade" id="orderConfirm" tabindex="-1" aria-labelledby="orderConfirmLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="orderConfirmLabel">주문서 확인</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="" id="orderForm" method="post">
                                <input type="hidden" name="m_order_id" id="m_order_id" >
                                <input type="hidden" name="m_order_status" id="m_order_status" >

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
                                <tbody>
                                <tr>
                                    <th class="tablePrice">승인 요청 메세지</th>
                                    <td class="comment"></td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="commentStyle">
                                <h2>메세지</h2>
                                <div>
                                    <textarea id="message" name="m_order_memo"></textarea>
                                </div>
                            </div>
                    </div>

                        <div class="modal-footer">
                            <button id="orderReturnButton" class="btn btn-secondary">
                                승인반려
                            </button>
                            <button id="orderConfirmButton" class="btn btn-danger">
                                승인확인
                            </button>
                        </div>
                    </div>
                    </form>
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
        const data = {m_order_id}
        fetch(`\${ctx}/order/list/` + m_order_id, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            }
            // body : JSON.stringify(data)
        })
            .then(res => res.json())
            .then(data => {
                document.querySelector(".buyerName").innerHTML = data.m_order_buyerName;
                document.querySelector(".buyerAddress").innerHTML = data.m_order_buyerAddress;
                document.querySelector(".buyerRegion").innerHTML = data.m_order_buyerRegion;
                document.querySelector(".buyerCurrency").innerHTML = data.m_order_buyerCurrency;
                document.querySelector(".buyerNumber").innerHTML = data.m_order_buyerNumber;
                document.querySelector(".inserted").innerHTML = data.m_order_inserted;
                document.querySelector(".sumPrice").innerHTML = data.m_order_sumPrice;
                document.querySelector(".comment").innerHTML = data.m_order_comment;
                document.querySelector(".orderId").innerHTML = data.m_order_id;
                document.querySelector(".orderDate").innerHTML = data.m_order_date;

                if (document.getElementById('itemBody').childElementCount == 0) {
                    for (i = 0; i < data.orderItemDTOList.length; i++) {
                        let itemTR = document.createElement("tr")
                        itemTR.setAttribute("class", "orderItemList")
                        let itemTD1 = document.createElement("td");
                        itemTD1.appendChild(document.createTextNode(data.orderItemDTOList.at(i).m_order_itemId + ""));
                        let itemTD2 = document.createElement("td");
                        itemTD2.appendChild(document.createTextNode(data.orderItemDTOList.at(i).m_order_itemName + ""));
                        let itemTD3 = document.createElement("td");
                        itemTD3.appendChild(document.createTextNode(data.orderItemDTOList.at(i).m_order_itemGroup + ""));
                        let itemTD4 = document.createElement("td");
                        itemTD4.appendChild(document.createTextNode(data.orderItemDTOList.at(i).m_order_count + ""));
                        let itemTD5 = document.createElement("td");
                        itemTD5.appendChild(document.createTextNode(data.orderItemDTOList.at(i).m_order_itemManufacturer + ""));
                        let itemTD6 = document.createElement("td");
                        itemTD6.appendChild(document.createTextNode(data.orderItemDTOList.at(i).m_order_price + ""));
                        let itemTD7 = document.createElement("td");
                        itemTD7.appendChild(document.createTextNode(data.orderItemDTOList.at(i).m_order_totalPrice + ""));

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
            // 승인 확인 버튼
            document.querySelector("#orderConfirmButton").addEventListener("click",function(){
                const orderId = document.querySelector(".orderId").innerText;
                document.querySelector("#m_order_id").value = orderId;
                document.querySelector("#m_order_status").value = "승인완료";

                document.querySelector("#orderForm").submit();
            })
            // 승인 반려 버튼
            document.querySelector("#orderReturnButton").addEventListener("click",function(){
                const orderId = document.querySelector(".orderId").innerText;
                document.querySelector("#m_order_id").value = orderId;

                //오더 상태 input value
                document.querySelector("#m_order_status").value = "승인반려";
                console.log( document.querySelector("#m_order_status").value );

                document.querySelector("#orderForm").submit();
            })


        </script>
</body>
</html>
