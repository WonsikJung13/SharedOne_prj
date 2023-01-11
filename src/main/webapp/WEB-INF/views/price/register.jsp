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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        .table {
            width: 900px;
        }

        tr {
            height: 55px;
        }
    </style>
</head>
<body>
<div class="row">
    <div class="col-3">
        <my:header></my:header>
    </div>
    <div class="col">
        <h1>판매가격 작성</h1>
        <form action="" method="post" enctype="multipart/form-data" id="formId">
            <table class="table table-bordered">

                <tbody>
                <tr>
                    <td class="table-active">제품코드</td>
                    <td>
                        <input class="form-select" id="itemId" type="text" name="m_item_id" list="itemList"
                               placeholder="제품 코드를 입력해주세요" autocomplete="off" onchange="itemView()">
                        <datalist id="itemList">
                            <c:forEach items="${itemList}" var="itemList">
                                <option value="${itemList.m_item_id}">${itemList.m_item_name}</option>
                            </c:forEach>
                        </datalist>
                        </input>
                    </td>
                </tr>
                <tr>
                    <td class="table-active">제품명</td>
                    <td>
                        <input class="form-control" id="itemName" readonly></input>
                    </td>
                </tr>
                <tr>
                    <td class="table-active">거래처 코드</td>
                    <td>
                        <input class="form-select" id="buyerId" type="text" name="m_buyer_id" list="buyerList"
                               placeholder="거래처 코드를 입력해주세요" autocomplete="off" onchange="buyerView()">
                        <datalist id="buyerList">
                            <c:forEach items="${buyerList}" var="buyerList">
                                <option value="${buyerList.m_buyer_id}">${buyerList.m_buyer_name}</option>
                            </c:forEach>
                        </datalist>
                        </input>
                    </td>
                </tr>
                <tr>
                    <td class="table-active">거래처명</td>
                    <td>
                        <input class="form-control" id="buyerName" readonly></input>
                    </td>
                </tr>
                <tr>
                    <td class="table-active">통화</td>
                    <td>
                        <input class="form-control" id="buyerCurrency" name="m_price_currency" readonly></input>
                    </td>
                </tr>
                </tbody>
            </table>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="table-active">시작일</td>
                    <td>
                        <input class="form-control" id="m_price_startPeriod" autocomplete="off" type="date"
                               name="m_price_startPeriod"></input>
                    </td>
                </tr>
                <tr>
                    <td class="table-active">종료일</td>
                    <td>
                        <input class="form-control" id="m_price_lastPeriod" autocomplete="off" type="date"
                               name="m_price_lastPeriod"></input>
                    </td>
                </tr>

                <tr>
                    <td class="table-active">할인율</td>
                    <td>
                        <input class="form-control" autocomplete="off" id="discountInput" type="text"
                               name="m_price_discount"></input>
                    </td>
                </tr>
                <tr>
                    <td class="table-active">판매가격(단가)</td>
                    <td>
                        <input class="form-control" autocomplete="off" id="priceInput" type="text"
                               name="m_price_price"></input>
                    </td>
                </tr>
                <tr>
                    <td class="table-active">최종 단가</td>
                    <td>
                        <input class="form-control" id="lastPrice" type="text" name="m_price_lastPrice"
                               readonly></input>
                    </td>
                </tr>
                </tbody>
            </table>
            <input class="btn btn-secondary" type="submit" value="추가" id="priceSubmitButton">
        </form>
    </div>
</div>
</div>
<hr>
<h2>추가된 가격</h2>
<table class="table">
    <thead>
    <tr>
        <th scope="col">제품코드</th>
        <th scope="col">제품명</th>
        <th scope="col">거래처코드</th>
        <th scope="col">거래처명</th>
        <th scope="col">시작일</th>
        <th scope="col">종료일</th>
        <th scope="col">통화</th>
        <th scope="col">할인율</th>
        <th scope="col">판매가격(단가)</th>
        <th scope="col">최종단가</th>
        <th scope="col">등록일</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    </tbody>
</table>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<script>
    const ctx = "${pageContext.request.contextPath}";

    const discountInput = document.querySelector("#discountInput");
    const priceInput = document.querySelector("#priceInput");

    const lastPrice = document.querySelector("#lastPrice");

    document.querySelector("#priceInput").addEventListener("keyup", function () {
        const discount = discountInput.value;
        const price = priceInput.value;
        const lastprice = price - ((price * discount) / 100);

        lastPrice.value = lastprice;
    })

    document.querySelector("#discountInput").addEventListener("keyup", function () {
        lastPrice.value = " ";
    })

    // buyer 이름, 통화 가져오기
    function buyerView() {
        const buyerId = document.querySelector('#buyerId')
        const selected = buyerId.value;

        fetch(ctx + "/price/buyerList/" + selected)
            .then(res => res.json())
            .then(data => {
                document.querySelector("#buyerName").value = data.m_buyer_name;
                document.querySelector("#buyerCurrency").value = data.m_buyer_currency;
            })
    }

    // item 이름 가져오기
    function itemView() {
        const itemId = document.querySelector('#itemId')
        const selected = itemId.value;

        fetch(ctx + "/price/itemList/" + selected)
            .then(res => res.json())
            .then(data => {
                document.querySelector("#itemName").value = data.m_item_name;
            })
    }

    // 오늘 날짜 이전 막기
    var now_utc = Date.now() // 지금 날짜를 밀리초로
    // getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
    var timeOff = new Date().getTimezoneOffset() * 60000; // 분단위를 밀리초로 변환
    // new Date(now_utc-timeOff).toISOString()은 '2022-05-11T18:09:38.134Z'를 반환
    var today = new Date(now_utc - timeOff).toISOString().split("T")[0];
    document.getElementById("m_price_startPeriod").setAttribute("min", today);

    // 종료일 : 시작일 이전 날짜 막기
    var m_price_startPeriod = document.getElementById('m_price_startPeriod');
    var m_price_lastPeriod = document.getElementById('m_price_lastPeriod');

    m_price_startPeriod.addEventListener('change', function () {
        m_price_startPeriod.max = null;
        if (m_price_startPeriod.value)
            m_price_lastPeriod.min = m_price_startPeriod.value;
    }, false);
    m_price_lastPeriod.addEventListener('change', function () {
        if (m_price_lastPeriod.value)
            m_price_startPeriod.max = m_price_lastPeriod.value;
    }, false);

    // 날짜 중복확인 (DB)
    document.querySelector("#m_price_startPeriod").addEventListener("change", function () {
        const m_item_id = document.querySelector("#itemId").value;
        const m_buyer_id = document.querySelector("#buyerId").value;
        const m_price_startPeriod = document.querySelector("#m_price_startPeriod").value;

        const addData = {
            m_item_id,
            m_buyer_id,
            m_price_startPeriod
        }
        fetch(ctx + "/price/checkPeriod", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(addData)
        })
            .then(res => res.json())
            .then(data => {
                if (data.message == null) {
                    m_price_lastPeriod.max = data.maxDate;
                } else {
                    alert(data.message)
                }
            })
    })


</script>
</body>
</html>
