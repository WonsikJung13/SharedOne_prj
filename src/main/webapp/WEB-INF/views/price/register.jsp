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
        <h1 style="margin-top: 20px">판매가격 작성</h1>
        <div style="display:flex; width: 900px;">
            <button style="margin-left: auto; margin-bottom: 10px;" id="resetBtn" class="btn btn-secondary" type="reset">초기화</button>
        </div>
        <form action="" method="post" id="formId" name="formId">
            <table class="table table-bordered">

                <tbody>
                    <tr>
                        <td class="table-active">제품코드</td>
                        <td>
                            <input class="form-control" id="itemId" type="text" name="m_item_id"
                                    placeholder="제품 코드를 입력해주세요" autocomplete="off" onchange="itemView()">
<%--                                <datalist id="itemList">--%>
<%--                                    <c:forEach items="${itemList}" var="itemList">--%>
<%--                                        <option value="${itemList.m_item_id}">${itemList.m_item_name}</option>--%>
<%--                                    </c:forEach>--%>
<%--                                </datalist>--%>
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
                            <input class="form-control" id="buyerId" type="text" name="m_buyer_id"
                                   placeholder="거래처 코드를 입력해주세요" autocomplete="off" onchange="buyerView()" disabled>
<%--                            <datalist id="buyerList">--%>
<%--                                <c:forEach items="${buyerList}" var="buyerList" >--%>
<%--                                    <option value="${buyerList.m_buyer_id}">${buyerList.m_buyer_name}</option>--%>
<%--                                </c:forEach>--%>
<%--                            </datalist>--%>
                            </input>
                        </td>
                    </tr>
                    <tr>
                        <td class="table-active">거래처명</td>
                        <td>
                            <input class="form-control" id="buyerName" readonly disabled></input>
                        </td>
                    </tr>
                    <tr>
                        <td class="table-active">통화</td>
                        <td>
                            <input class="form-control" id="buyerCurrency" name="m_price_currency" readonly disabled></input>
                        </td>
                    </tr>
                </tbody>
            </table>
            <table id="inputId" class="table table-bordered">
                <tbody style="width: 20%">
                    <tr>
                        <td class="table-active">시작일</td>
                        <td>
                            <input class="form-control reset1" id="m_price_startPeriod" autocomplete="off" type="date" name="m_price_startPeriod"></input>
                        </td>
                    </tr>
                    <tr>
                        <td class="table-active">종료일</td>
                        <td>
                            <input class="form-control reset1" id="m_price_lastPeriod" autocomplete="off" type="date" name="m_price_lastPeriod" disabled></input>
                        </td>
                    </tr>

                    <tr>
                        <td class="table-active">할인율</td>
                        <td>
                            <input class="form-control reset1" autocomplete="off" id="discountInput" type="text" name="m_price_discount" value="0"></input>
                        </td>
                    </tr>
                    <tr>
                        <td class="table-active">판매가격(단가)</td>
                        <td>
                            <input class="form-control reset1" autocomplete="off" id="priceInput" type="text" name="m_price_price" onkeyup="inputNumberFormat(this)"></input>
                        </td>
                    </tr>
                    <tr>
                        <td class="table-active">최종 단가</td>
                        <td>
                            <input class="form-control reset1" id="lastPrice" type="text" name="m_price_lastPrice" onkeyup="inputNumberFormat(this)" readonly></input>
                        </td>
                    </tr>
                </tbody>
            </table>
            <input class="btn btn-secondary" type="button" id="priceButton" value="판매가 추가"></input>
<%--            <div style="display:none"><button id="resetBtn" type="reset"></button> </div>--%>
        </form>

        <h2>추가된 가격</h2>
        <div class="tableList">
            <table class="table addList ">
                <thead>
                <tr>
                    <th scope="col">제품코드</th>
                    <th scope="col">거래처코드</th>
                    <th scope="col">시작일</th>
                    <th scope="col">종료일</th>
                    <th scope="col">통화</th>
                    <th scope="col">할인율</th>
                    <th scope="col">판매단가</th>
                    <th scope="col">최종단가</th>
                    <th></th>
                </tr>
                </thead>
                <tbody id="basketList">

                </tbody>
            </table>
        </div>

        <button style="margin-bottom: 20px" class="btn btn-secondary" id="priceSubmitButton">등록</button>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<script>
    const ctx = "${pageContext.request.contextPath}";

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


    // buyer 이름, 통화 가져오기
    function buyerView() {
        const buyerId = document.querySelector('#buyerId')
        const selected = buyerId.value;

        if (selected) {
            $("#inputId").css("display","table")
            document.querySelector("#itemId").disabled = true;
            document.querySelector("#itemName").disabled = true;
            document.querySelector("#buyerId").disabled = true;
            document.querySelector("#buyerName").disabled = true;
            document.querySelector("#buyerCurrency").disabled = true;
        }

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

        if (selected) {
            document.querySelector("#buyerId").disabled = false;
            document.querySelector("#buyerName").disabled = false;
            document.querySelector("#buyerCurrency").disabled = false;
        }

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


    // 날짜 중복확인
    m_price_startPeriod.addEventListener('change', function () {
        m_price_startPeriod.max = null;
        if (m_price_startPeriod.value)
            m_price_lastPeriod.min = m_price_startPeriod.value;
    }, false);
    m_price_lastPeriod.addEventListener('change', function () {
        if (m_price_lastPeriod.value)
            m_price_startPeriod.max = m_price_lastPeriod.value;
    }, false);

    let addDatas = [];
    document.querySelector("#m_price_startPeriod").addEventListener("change", function () {

        document.querySelector("#m_price_lastPeriod").disabled = false;
        document.querySelector("#m_price_lastPeriod").max = null;
        $("input[name='m_price_lastPeriod'],textarea").val('');

        const m_item_id = document.querySelector("#itemId").value;
        const m_buyer_id = document.querySelector("#buyerId").value;
        const m_price_startPeriod = document.querySelector("#m_price_startPeriod").value;
        const m_price_lastPeriod = document.querySelector("#m_price_lastPeriod").value;

        const addData = {
            m_item_id,
            m_buyer_id,
            m_price_startPeriod,
            m_price_lastPeriod
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

                    if (data.maxDate) {
                        document.querySelector("#m_price_lastPeriod").max = data.maxDate;
                    }

                    let arr = new Array();
                    for (let i = 0; i < addDatas.length; i++) {
                        if (m_item_id == addDatas.at(i).m_item_id && m_buyer_id == addDatas.at(i).m_buyer_id) {
                            if (addDatas.at(i).m_price_startPeriod <= m_price_startPeriod && m_price_startPeriod <= addDatas.at(i).m_price_lastPeriod) {
                                alert("이미 추가된 판매가의 날짜가 겹칩니다. 다시 확인해주세요")
                                $("input[type='date'],textarea").val('');
                                document.querySelector("#m_price_lastPeriod").disabled = true;
                            } else {
                                if (m_price_startPeriod < addDatas[i].m_price_startPeriod) {
                                    arr.push(addDatas[i].m_price_startPeriod)
                                } else {
                                    document.querySelector("#m_price_lastPeriod").max = null;
                                }
                            }
                        }
                    }
                    let minDate = arr.reduce((prev, curr) => {
                        // 이전것과 비교해 더 작은 것 리턴
                        return new Date(prev).getTime() <= new Date(curr).getTime() ? prev : curr;
                    })
                    let a = new Date(minDate);
                    let sel_day = -1;
                    a.setDate(a.getDate() + sel_day);
                    let year    = a.getFullYear();
                    let month   = ('0' + (a.getMonth() +  1 )).slice(-2);
                    let day     = ('0' + a.getDate()).slice(-2);
                    dt = year+"-"+month+"-"+day;


                    if (data.maxDate && !dt) {
                        document.querySelector("#m_price_lastPeriod").max = data.maxDate;
                    }

                    if (!data.maxDate && dt) {
                        document.querySelector("#m_price_lastPeriod").max = dt;
                    }

                    if (data.maxDate < dt) {
                        document.querySelector("#m_price_lastPeriod").max = data.maxDate;
                    }
                    if (dt < data.maxDate) {
                        document.querySelector("#m_price_lastPeriod").max = dt;
                    }

                } else {
                    alert(data.message)
                    $("input[type='date'],textarea").val('');
                    document.querySelector("#m_price_lastPeriod").disabled = true;
                }
            })

    })

    // 추가
    document.querySelector("#priceButton").addEventListener("click", function () {


        // 빈값 체크
        let emptyIndex = document.querySelector(".addList").tBodies[0].rows.length;


        var input_empty = false;
        $('#formId').find('input[type!="hidden"]').each(function(){
            if(!$(this).val()) {
                input_empty = true;
            }
        });
        if(input_empty == true) {
            alert('값을 전부 입력하세요');
            document.querySelector(".addList").tBodies[0].deleteRow(emptyIndex);
        }


       const m_item_id = document.querySelector("#itemId").value;
       const m_buyer_id = document.querySelector("#buyerId").value;
       const m_price_startPeriod = document.querySelector("#m_price_startPeriod").value;
       const m_price_lastPeriod = document.querySelector("#m_price_lastPeriod").value;
       const m_price_currency = document.querySelector("#buyerCurrency").value;
       const m_price_discount = document.querySelector("#discountInput").value;
       let m_price_price = document.querySelector("#priceInput").value;
       let m_price_lastPrice = document.querySelector("#lastPrice").value;


        // for (let i = 0; i <addData.length; i++) {
       //     if (m_item_id == addData.at(i).m_item_id && m_buyer_id == addData.at(i).m_buyer_id) {
       //         // 겹칠 때 -> 바로 안됨
       //         if (addData.at(i).m_price_startPeriod <= m_price_startPeriod && m_price_lastPeriod <= addData.at(i).m_price_lastPeriod) {
       //             alert("이미 추가된 판매가의 날짜가 겹칩니다. 다시 확인해주세요")
       //             return false;
       //         }
       //         else { // 안 겹칠 때
       //             // 시작 값 < 시작 배열
       //             if (m_price_startPeriod < addData.at(i).m_price_startPeriod) {
       //                 // 시작 배열 <= 끝 값
       //                 if (addData.at(i).m_price_startPeriod <= m_price_lastPeriod) {
       //                     alert("이미 추가된 판매가의 날짜가 겹칩니다. 다시 확인해주세요")
       //                     return false;
       //                 }
       //             }
       //              // 배열 시작 < 시작 값 < 배열 끝
       //             if (addData.at(i).m_price_startPeriod < m_price_startPeriod && m_price_startPeriod < addData.at(i).m_price_lastPeriod) {
       //                 alert("이미 추가된 판매가의 날짜가 겹칩니다. 다시 확인해주세요")
       //                 return false;
       //             }
       //         }
       //     }
       // }

       const priceAdd = `
            <tr id="removeId">
                <td class="priceAdd"> \${m_item_id} </td>
                <td class="priceAdd"> \${m_buyer_id} </td>
                <td class="priceAdd"> \${m_price_startPeriod} </td>
                <td class="priceAdd"> \${m_price_lastPeriod} </td>
                <td class="priceAdd"> \${m_price_currency} </td>
                <td class="priceAdd"> \${m_price_discount} </td>
                <td class="priceAdd"> \${m_price_price} </td>
                <td class="priceAdd"> \${m_price_lastPrice} </td>
                <td><button class="btn btn-danger removeButton" onclick="clickRemove(this)">삭제</button></td>
            </tr>
       `
        basketList.insertAdjacentHTML("beforeend", priceAdd);

        m_price_price = uncomma(m_price_price);
        m_price_lastPrice = uncomma(m_price_lastPrice);

       const data = {
           m_item_id,
           m_buyer_id,
           m_price_startPeriod,
           m_price_lastPeriod,
           m_price_currency,
           m_price_discount,
           m_price_price,
           m_price_lastPrice
       }
        addDatas.push(data);

        if(input_empty == false) {
            // 일부 초기화
            $('#formId').find('.reset1').each(function(i){
                $type = $(this).attr('type');
                if($type === 'text' || $type === 'date') $(this).val('');


            });
            document.querySelector("#itemId").disabled = true;
            document.querySelector("#itemName").disabled = true;
            document.querySelector("#buyerId").disabled = true;
            document.querySelector("#buyerName").disabled = true;
            document.querySelector("#buyerCurrency").disabled = true;
            document.querySelector("#m_price_lastPeriod").disabled = true;
            document.querySelector("#discountInput").value = 0;
            document.querySelector("#m_price_startPeriod").max = null;
        }

    });


    // 등록
    document.querySelector("#priceSubmitButton").addEventListener("click", function () {
        fetch(`\${ctx}/price/add`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(addDatas)
        })
            .then(res => res.json())
            .then(data => {
                console.log(data)
                if (data >= 1) {
                    alert(data + "개의 판매가 등록이 완료되었습니다.")
                    location.href = "/price/list";

                } else {
                    alert("추가된 판매가 테이블을 확인해주세요.")
                }
            })
    })

    // 삭제
    function clickRemove(target) {
        var listIndex = $(target).parent().parent().index();
        $(target).parent().parent().remove();

        addDatas.splice(listIndex, 1)
    }

    $("#inputId").css("display","none")

    // 전체 초기화
    $('#resetBtn').click(function() {
        $('form').each(function() {
            this.reset();
            $("#inputId").css("display","none")
        });
        document.querySelector("#itemId").disabled = false;
        document.querySelector("#itemName").disabled = false;
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
