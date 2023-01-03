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
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
<div class="container-md">
    <div class="row">
        <div class="col">
            <h3>판매가격 작성</h3>
            <form action="" method="post" enctype="multipart/form-data" id="formId">
                <div class="mb-3">
                    <label class="form-label">
                        거래처코드
                    </label>
                    <input class="form-control" type="text" name="m_buyer_id">
                </div>

                <div class="mb-3">
                    <label class="form-label">
                        거래처명
                    </label>
                    <input class="form-control" type="text" name="m_buyer_name" value="">
                </div>
                <hr>
                <div class="mb-3">
                    <label class="form-label">
                        제품코드
                    </label>
                    <input class="form-control" type="text" name="m_item_id" value="">
                </div>

                <div class="mb-3">
                    <label class="form-label">
                        제품명
                    </label>
                    <input class="form-control" type="text" name="m_item_name" value="">
                </div>
                <hr>
                <div class="mb-3">
                    <label class="form-label">
                        시작일
                    </label>
                    <input class="form-control" type="date" name="m_price_startPeriod">
                </div>

                <div class="mb-3">
                    <label class="form-label">
                        종료일
                    </label>
                    <input class="form-control" type="date" name="m_price_lastPeriod">
                </div>

                <div class="mb-3">
                    <label class="form-label">
                        통화
                    </label>
                    <input class="form-control" type="text" name="m_price_currency">
                </div>

                <div class="mb-3">
                    <label class="form-label">
                        할인율
                    </label>
                    <input id="discountInput" class="form-control" type="text" name="m_price_discount">
                </div>

                <div class="mb-3">
                    <label class="form-label">
                        판매가격(단가)
                    </label>
                    <input id="priceInput" class="form-control" type="text" name="m_price_price">
                </div>

                <div class="mb-3">
                    <label class="form-label">
                        최종 단가
                    </label>
                    <input id="lastPrice" class="form-control" type="text" name="m_price_lastPrice" readonly>
                </div>

                <input type="submit" value="추가" id="priceSubmitButton">
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<script>

    const discountInput = document.querySelector("#discountInput");
    const priceInput = document.querySelector("#priceInput");
    const lastPrice = document.querySelector("#lastPrice");

    document.querySelector("#priceInput").addEventListener("keyup", function () {
        const discount = discountInput.value;
        const price = priceInput.value;
        const lastprice = price - ((price * discount) / 100);

        lastPrice.value = lastprice;
    })



</script>
</body>
</html>
