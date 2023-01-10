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
        * {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #eeeeee;
        }

        .table {
            width: 900px;
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

        .orderTotalPrice {
            font-size: 1.1em;
            margin: 20px 0 10px 0;
        }

        .addBtn {
            background-color: #5f7175;
            padding: 5px 30px;
            margin-left: 350px;
        }

        .addBtn:hover,
        .addBtn:focus, .storageBtn:hover, .storageBtn.focus {
            background-color: #505f62;
        }

        .storageBtn {
            background-color: #5f7175;
            padding: 5px 30px;
            margin-left: 280px;
        }

        .submitBtn {
            background-color: #598f9b;
            padding: 5px 30px;

        }

        .form-select {
            width: 250px;
        }

        .inputLength {
            width: 250px;
        }


        .tableList {
            background-color: #fff;
            height: 444px;
            width: 900px;
            /*overFlow: scroll;*/
            overflow-x: hidden;
        }

        .tableList td {
            /*--bs-table-bg: #fffff;*/
            background-color: #fff;
            color: #37393b;
            text-align: center;
            line-height: 39px;
            font-size: 16px;
            font-weight: bold;
        }

        .tableList thead th {
            position: sticky;
            top: 0;
            width: 128px;
        }

        .tableList input {
            border: none;
            background: transparent;
        }

        .orderAdd {
            width: 128px;
        }

        .commentStyle {
            background-color: #fff;
            height: 100px;
            width: 900px;
        }

        .orderTotalPrice {
            color: red;
        }

    </style>
</head>
<body>
<div class="row">
    <div class="col-3">
        <my:header></my:header>
    </div>
    <div class="col">
        <h1>오더 작성</h1>

        <h2>거래처 선택</h2>
        <table class="table table-bordered">
            <tbody>
            <tr>
                <td class="table-active">거래처</td>
                <td>
                    <div class="inputLength">
                        <input onchange="buyerView()" class="form-select" aria-label="Default select example"
                               type="text" list="list" id="buyer" placeholder="거래처를 선택해주세요"/>
                        <datalist id="list">
                            <c:forEach items="${buyerList}" var="buyer">
                                <option value="${buyer.m_buyer_id}_${buyer.m_buyer_name}"></option>
                            </c:forEach>
                        </datalist>
                    </div>
                </td>
                <td class="table-active">주소</td>
                <td id="buyerAddress"></td>
            </tr>
            <tr>
                <td class="table-active">국가</td>
                <td id="buyerRegion"></td>
                <td class="table-active">사업자등록번호</td>
                <td id="buyerNumber"></td>
            </tr>
            <tr>
                <td class="table-active">통화</td>
                <td id="buyerCurrency"></td>
                <td class="table-active">납품요청일</td>
                <td colspan="3">
                    <input id="buyerInserted" class="form-control" type="date" placeholder="Default input"
                           aria-label="default input example" onchange="itemList()">
                </td>
            </tr>
            </tbody>
        </table>

        <h2>제품 선택</h2>
        <table class="table table-bordered">
            <tbody>
            <tr>
                <td class="table-active">제품코드</td>
                <td>
                    <div class="inputLength">
                        <input onchange="itemView()" class="form-select" aria-label="Default select example" type="text"
                               list="lists" id="orderItems" placeholder="제품를 선택해주세요"/>
                        <datalist id="lists">
                        </datalist>
                    </div>
                </td>
                <td class="table-active">제품이름</td>
                <td class="itemName">
                </td>
            </tr>
            <tr>
                <td class="table-active">제품품목</td>
                <td class="itemGroup"></td>
                <td class="table-active">제조사</td>
                <td class="manufacturer"></td>
            </tr>
            </tbody>
        </table>

        <h2>오더정보</h2>
        <table class="table table-bordered">
            <tbody>
            <tr>
                <td class="table-active">판매가격</td>
                <td>
                    <input class="form-control listPrice" type="text" placeholder="판매가격"
                           aria-label="default input example">
                </td>
                <td class="table-active">오더수량</td>
                <td>
                    <input id="orderCount" class="form-control" type="text" placeholder="수량을 입력하세요."
                           aria-label="default input example">
                </td>
            </tr>
            <tr>
                <td class="table-active">총 금액</td>
                <td colspan="3" id="totalPrice">

                </td>
            </tr>

            </tbody>
        </table>
        <button class="btn btn-secondary addBtn">제품추가</button>

        <h2>추가된 제품</h2>
        <div class="tableList">
            <table class="table addList">
                <thead>
                <tr>
                    <th scope="col">납품요청일</th>
                    <th scope="col">제품코드</th>
                    <th scope="col">제품명</th>
                    <th scope="col">판매가격</th>
                    <th scope="col">오더수량</th>
                    <th scope="col">총 금액</th>
                    <th scope="col"></th>
                </tr>
                </thead>
                <tbody id="itemBody">

                </tbody>
            </table>
        </div>

        <table class="table table-bordered orderTotalPrice">
            <tbody>
            <tr>
                <th class="table-active">총 금액</th>
                <td id="orderTotalPrice">

                </td>
            </tr>

            </tbody>
        </table>

        <div class="commentStyle">
            <h2>메모</h2>
            <div>
                <textarea class="form-control" id="comment"></textarea>
            </div>
        </div>

        <button class="btn btn-secondary storageBtn">임시저장</button>
        <button class="btn btn-secondary submitBtn">승인요청</button>


    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<script>

    const ctx = "${pageContext.request.contextPath}";
    let orderTotalPrice = 0;

    // buyer 데이터 가져오기
    function buyerView() {
        const buyer = document.querySelector('#buyer')
        const selected = buyer.value;

        fetch(ctx + "/order/buyerList/" + selected)
            .then(res => res.json())
            .then(data => {
                document.querySelector("#buyerAddress").innerHTML = data.m_buyer_address;
                document.querySelector("#buyerRegion").innerHTML = data.m_buyer_region;
                document.querySelector("#buyerNumber").innerHTML = data.m_buyer_number;
                document.querySelector("#buyerCurrency").innerHTML = data.m_buyer_currency;
            })
    }


    // 아이템 데이터 가져오기
    function itemView() {
        const item = document.querySelector('#orderItems')
        const selectedItem = item.value.split('_').at(0);
        const requestDate = document.querySelector("#buyerInserted").value;
        const buyer = document.querySelector('#buyer')
        const selectedBuyer = buyer.value.split('_').at(0);
        const data = {requestDate, selectedItem, selectedBuyer}
        fetch(`\${ctx}/order/itemList`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(data)
        })
            .then(res => res.json())
            .then(data => {
                document.querySelector(".itemName").innerHTML = data.m_item_name;
                document.querySelector(".itemGroup").innerHTML = data.m_item_group;
                document.querySelector(".manufacturer").innerHTML = data.m_item_manufacturer;
                document.querySelector(".listPrice").value = data.m_price_lastPrice;
            })
    }

    // 아이템 선택 후 데이터 끌고오기
    function itemList() {
        const requestDate = document.querySelector("#buyerInserted").value;
        const buyer = document.querySelector('#buyer')
        const selected = buyer.value;
        const data = {requestDate, selected}
        fetch(`\${ctx}/order/itemListForDropDown`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(data)
        })
            .then(res => res.json())
            .then(data => {
                for (i = 0; i < data.length; i++) {
                    let datalist = document.getElementById('lists');

                    let new_optionTag = document.createElement('option');

                    new_optionTag.setAttribute('class', 'itemSelect');
                    new_optionTag.setAttribute('value', data.at(i).m_item_id + '_' + data.at(i).m_item_name)

                    datalist.appendChild(new_optionTag);

                }
            })
    }

    //  총 금액 계산 후 화면에 출력
    document.querySelector("#orderCount").addEventListener("keyup", function () {
        let lastPrice = document.querySelector(".listPrice").value;
        const orderCount = document.querySelector("#orderCount").value;

        lastPrice = orderCount * lastPrice;

        document.querySelector("#totalPrice").innerHTML = lastPrice;
    })

    // 장바구니 보여주기
    let addData = [];
    document.querySelector(".addBtn").addEventListener("click", function () {
        const buyer = document.querySelector("#buyer").value.split("_");
        const m_order_buyerId = buyer.at(0)
        const m_order_buyerName = buyer.at(1)
        const m_order_buyerAddress = document.querySelector("#buyerAddress").innerText;
        const m_order_buyerRegion = document.querySelector("#buyerRegion").innerText;
        const m_order_buyerNumber = document.querySelector("#buyerNumber").innerText;
        const m_order_buyerCurrency = document.querySelector("#buyerCurrency").innerText;
        const m_order_inserted = document.querySelector("#buyerInserted").value;

        const m_order_comment = document.querySelector("#comment").value;
        const m_order_totalPrice = document.querySelector("#totalPrice").innerText;

        // 추가된 제품 총 금액으로 오더 총 금액 구하기
        orderTotalPrice = orderTotalPrice + parseInt(m_order_totalPrice);
        document.querySelector("#orderTotalPrice").innerHTML = orderTotalPrice;

        const itemId = document.querySelector("#orderItems").value.split("_");
        const m_order_itemId = itemId.at(0);
        const m_order_itemName = document.querySelector(".itemName").innerText;
        const m_order_itemGroup = document.querySelector(".itemGroup").innerText;
        const m_order_itemManufacturer = document.querySelector(".manufacturer").innerText;
        const m_order_price = document.querySelector(".listPrice").value;
        const m_order_count = document.querySelector("#orderCount").value;

        const orderAdd = `
            <tr>
                 <td class="orderAdd"> \${m_order_inserted} </td>
                 <td class="orderAdd"> \${m_order_itemId} </td>
                 <td class="orderAdd"> \${m_order_itemName} </td>
                 <td class="orderAdd"> \${m_order_price} </td>
                 <td class="orderAdd"> \${m_order_count} </td>
                 <td class="orderAdd"> \${m_order_totalPrice} </td>
                <td><button class="btn btn-secondary">삭제</button></td>
            </tr>
        `
        itemBody.insertAdjacentHTML("beforeend", orderAdd);

        const data = {
            m_order_buyerId,
            m_order_buyerName,
            m_order_buyerAddress,
            m_order_buyerRegion,
            m_order_buyerNumber,
            m_order_buyerCurrency,
            m_order_inserted,
            m_order_comment,
            m_order_totalPrice,
            m_order_itemId,
            m_order_itemName,
            m_order_itemGroup,
            m_order_itemManufacturer,
            m_order_price,
            m_order_count
        }

        addData.push(data);
    })
    document.querySelector(".submitBtn").addEventListener("click", function () {
        fetch(`\${ctx}/order/add`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(addData)
        })
        .then(res => res.json())
    })


</script>
</body>
</html>
