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
                                <option value="${buyer.m_buyer_id}_${buyer.m_buyer_name}" class="buyerSelect"></option>
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
                    <input id="itemPrice" class="form-control" type="date" placeholder="Default input"
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
                            <%--                            <c:forEach items="${itemList}" var="items">--%>
                            <%--                                <option value="${items.m_item_id}_${items.m_item_name}" class="itemSelect"></option>--%>
                            <%--                            </c:forEach>--%>
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
                    <input class="form-control listPrice" type="text" placeholder="Default input"
                           aria-label="default input example">
                </td>
                <td class="table-active">오더수량</td>
                <td>
                    <input class="form-control" type="text" placeholder="Default input"
                           aria-label="default input example">
                </td>
            </tr>
            <tr>
                <td class="table-active">총 금액</td>
                <td colspan="3">
                    11
                </td>
            </tr>
            <tr>
                <td class="table-active">메모</td>
                <td colspan="3">
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                </td>
            </tr>
            </tbody>
        </table>
        <button class="btn btn-secondary addBtn">제품추가</button>

        <h2>추가된 제품</h2>
        <table class="table addList">
            <thead>
            <tr>
                <th scope="col">납품요청일</th>
                <th scope="col">제품코드</th>
                <th scope="col">제품명</th>
                <th scope="col">판매가격</th>
                <th scope="col">오더수량</th>
                <th scope="col">총 금액</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <%--    <c:forEach items="" var="">--%>
            <%--        <tr>--%>
            <%--            <th scope="row">1</th>--%>
            <%--            <td>Mark</td>--%>
            <%--            <td>Otto</td>--%>
            <%--            <td>@mdo</td>--%>
            <%--            <td>@mdo</td>--%>
            <%--            <td><button></button></td>--%>
            <%--        </tr>--%>
            <%--    </c:forEach>--%>


            </tbody>
        </table>
        <button class="btn btn-secondary storageBtn">임시저장</button>
        <button class="btn btn-secondary submitBtn">오더등록</button>


    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<script>

    const ctx = "${pageContext.request.contextPath}";

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

    // item 데이터 가져오기
    // function itemView() {
    //     const item = document.querySelector('#orderItems')
    //     const selected = item.value.split('_').at(0);
    //     const requestDate = document.querySelector("#itemPrice").value;
    //     const buyer = document.querySelector('#buyer')
    //     const selectedBuyer = buyer.value;
    //     const data = {requestDate, selected, selectedBuyer}
    //     console.log(selected)
    //     fetch(ctx + "/order/itemList/" + selected)
    //         .then(res => res.json())
    //         .then(data => {
    //             document.querySelector(".itemName").innerHTML = data.m_item_name;
    //             document.querySelector(".itemGroup").innerHTML = data.m_item_group;
    //             document.querySelector(".manufacturer").innerHTML = data.m_item_manufacturer;
    //             document.querySelector(".listPrice").value = data.m_price_lastPrice;
    //         })
    // }

    function itemView() {
        const item = document.querySelector('#orderItems')
        const selectedItem = item.value.split('_').at(0);
        const requestDate = document.querySelector("#itemPrice").value;
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
                console.log(data)
                document.querySelector(".itemName").innerHTML = data.m_item_name;
                document.querySelector(".itemGroup").innerHTML = data.m_item_group;
                document.querySelector(".manufacturer").innerHTML = data.m_item_manufacturer;
                document.querySelector(".listPrice").value = data.m_price_lastPrice;
            })
    }

    function itemList() {
        const requestDate = document.querySelector("#itemPrice").value;
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

</script>
</body>
</html>
