<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>modify</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        .table {
            width: 900px;
        }

        tr {
            height: 55px;
        }

        .table-active{
            width: 40%;
            line-height: 35px;
        }
    </style>
</head>
<body>
<div class="row">
    <div class="col-3">
        <my:header></my:header>
    </div>
    <div class="col">
        <h1 style="margin-top: 20px">판매가격 수정하기</h1>

        <form action="" method="post" enctype="multipart/form-data" id="formId">
            <table class="table table-bordered">
                <tbody>
                <input type="hidden" id="priceId" value="${price.m_price_id}"/>
                    <tr>
                        <td class="table-active">제품코드</td>
                        <td>
                            <input class="form-control" id="itemId" type="text" name="m_item_id" value="${price.m_item_id}"
                                   placeholder="제품 코드를 입력해주세요" autocomplete="off" onchange="itemView()" disabled>
<%--                                    <datalist id="itemList">--%>
<%--                                        <c:forEach items="${itemList}" var="itemList">--%>
<%--                                            <option value="${itemList.m_item_id}">${itemList.m_item_name}</option>--%>
<%--                                        </c:forEach>--%>

<%--                                    </datalist>--%>
                            </input>
                        </td>
                    </tr>
                    <tr>
                        <td class="table-active">제품명</td>
                        <td>
                            <input class="form-control" id="itemName" value="${price.m_item_name}" disabled></input>
                        </td>
                    </tr>
                    <tr>
                        <td class="table-active">거래처 코드</td>
                        <td>
                            <input class="form-control" id="buyerId" type="text" name="m_buyer_id" value="${price.m_buyer_id}"
                                   placeholder="거래처 코드를 입력해주세요" autocomplete="off" onchange="buyerView()" disabled>
<%--                                    <datalist id="buyerList">--%>
<%--                                        <c:forEach items="${buyerList}" var="buyerList" >--%>
<%--                                            <option value="${buyerList.m_buyer_id}">${buyerList.m_buyer_name}</option>--%>
<%--                                        </c:forEach>--%>
<%--                                    </datalist>--%>
                            </input>
                        </td>
                    </tr>
                    <tr>
                        <td class="table-active">거래처명</td>
                        <td>
                            <input class="form-control" id="buyerName" value="${price.m_buyer_name}" disabled></input>
                        </td>
                    </tr>
                    <tr>
                        <td class="table-active">통화</td>
                        <td>
                            <input class="form-control" id="buyerCurrency" name="m_price_currency" value="${price.m_price_currency}" disabled></input>
                        </td>
                    </tr>

                </tbody>
            </table>
            <div style="display:flex; width: 900px;">
                <button style="margin-left: auto; margin-bottom: 10px;" class="btn btn-secondary" id="dateModifyButton">날짜 수정하기</button>
            </div>
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="table-active">시작일</td>
                    <td>
                        <input class="form-control" id="m_price_startPeriod" autocomplete="off" type="date" name="m_price_startPeriod" value="${price.m_price_startPeriod}" disabled></input>
                    </td>
                </tr>
                <tr>
                    <td class="table-active">종료일</td>
                    <td>
                        <input class="form-control" id="m_price_lastPeriod" autocomplete="off" type="date" name="m_price_lastPeriod" value="${price.m_price_lastPeriod}" disabled></input>
                    </td>
                </tr>

                <tr>
                    <td class="table-active">할인율</td>
                    <td>
                        <input class="form-control" autocomplete="off" id="discountInput" type="text" name="m_price_discount" value="${price.m_price_discount}"></input>
                    </td>
                </tr>
                <tr>
                    <td class="table-active">판매가격(단가)</td>
                    <td>
                        <input class="form-control" autocomplete="off" id="priceInput" type="text" name="m_price_price" value="" onkeyup="inputNumberFormat(this)"></input>
                    </td>
                </tr>
                <tr>
                    <td class="table-active">최종 단가</td>
                    <td>
                        <input class="form-control" id="lastPrice" type="text" name="m_price_lastPrice" value="" onkeyup="inputNumberFormat(this)" readonly></input>
                    </td>
                </tr>
                </tbody>
            </table>
            <button class="btn btn-secondary" id="priceSubmitButton" type="button">판매가 수정</button>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous">
</script>
<script>
    const ctx = "${pageContext.request.contextPath}";

    // 수정창 보여질때 천원 단위 절사
    let commaPrice = comma(${price.m_price_price})
    let commaLastPrice = comma(${price.m_price_lastPrice})
    document.querySelector("#priceInput").value = commaPrice;
    document.querySelector("#lastPrice").value = commaLastPrice;

    // 할인율 계산하기
    const discountInput = document.querySelector("#discountInput");
    const priceInput = document.querySelector("#priceInput");
    const lastPrice = document.querySelector("#lastPrice");

    function discount() {
        const discount = uncomma(discountInput.value)
        const price = uncomma(priceInput.value)

        const lastprice = price - ((price * discount) / 100);
        lastPrice.value = comma(uncomma(lastprice));
    }

    document.querySelector("#priceInput").addEventListener("keyup", discount)
    document.querySelector("#discountInput").addEventListener("keyup", discount)

    // buyer 이름 가져오기
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

    // 날짜 중복확인
    document.querySelector("#m_price_startPeriod").addEventListener("change", function () {

        document.querySelector("#m_price_lastPeriod").disabled = false;
        $("input[name='m_price_lastPeriod'],textarea").val('');

        const m_price_id = document.querySelector("#priceId").value;
        const m_item_id = document.querySelector("#itemId").value;
        const m_buyer_id = document.querySelector("#buyerId").value;
        const m_price_startPeriod = document.querySelector("#m_price_startPeriod").value;

        const addData = {
            m_price_id,
            m_item_id,
            m_buyer_id,
            m_price_startPeriod
        }


        fetch(ctx + "/price/checkModifyPeriod", {
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
                    console.log(m_price_lastPeriod.max)
                    alert(data.message)
                    $("input[type='date'],textarea").val('');
                    document.querySelector("#m_price_lastPeriod").disabled = true;
                }
            })
    })

    // 등록
    document.querySelector("#priceSubmitButton").addEventListener("click", function (e) {
        var input_empty = false;
        $('#formId').find('input[type!="hidden"]').each(function(){
            if(!$(this).val()) {
                input_empty = true;
            }
        });
        if(input_empty == true) {
            alert('값을 전부 입력하세요');
            e.preventDefault();
        }
        if(input_empty == false) {
            alert("판매가 수정이 완료되었습니다.")
            document.querySelector("#priceInput").value = uncomma(document.querySelector("#priceInput").value);
            document.querySelector("#lastPrice").value = uncomma(document.querySelector("#lastPrice").value);

            document.querySelector("#m_price_startPeriod").disabled = false;
            document.querySelector("#m_price_lastPeriod").disabled = false;
            document.querySelector("#itemId").disabled = false;
            document.querySelector("#itemName").disabled = false;
            document.querySelector("#buyerId").disabled = false;
            document.querySelector("#buyerName").disabled = false;
            document.querySelector("#buyerCurrency").disabled = false;
            document.querySelector("#formId").submit();
        }
    });

    document.querySelector("#dateModifyButton").addEventListener("click", function (e) {
        document.querySelector("#m_price_startPeriod").disabled = false;
        $("input[type='date'],textarea").val('');
        e.preventDefault();
    })

    // 천원 단위 절사
    function inputNumberFormat(obj) {
        obj.value = comma(uncomma(obj.value));
    }

    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    }



</script>
</body>
</html>
