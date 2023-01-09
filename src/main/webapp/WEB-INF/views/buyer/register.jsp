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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"
            integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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

        .form-control {
            width: 250px;
        }

        .inputLength {
            width: 250px;
        }


        /*제품그룹 박스*/
        #groupSelect, #manufacturerSelect {
            position: absolute;
        }

        option {
            height: 30px;
            line-height: 30px;
        }

        .groupEditOption, .ManufacturerEditOption {
            position: relative;
        }
    </style>
</head>
<body>
<div class="row">
    <div class="col-3">
        <my:header></my:header>
    </div>
    <div class="col">
        <div style="display: flex;justify-content: space-between;width: 900px;">
            <div id="itemListTitle">
                <h1 id="header">바이어 등록</h1>
            </div>
            <div class="itemRegisterBtn">
                <c:url value="/item/register" var="registerLink"></c:url>
                <button type="button" class="btn btn-secondary" onclick="location.href='${registerLink}' ">구현중
                </button>
            </div>
        </div>
        <h2>바이어 추가</h2>

        <table class="table table-bordered">
            <tbody>
            <form action="" method="post" id="registerForm">
                <tr>
                    <th class="table-active">거래처 명</th>
                    <th><input class="form-control form300" type="text" name="m_buyer_name"></th>
                </tr>
                <tr>
                    <th class="table-active">거래처 국가</th>
                    <th><input class="form-control form300" type="text" name="m_buyer_region"></th>
                </tr>
                <tr>
                    <th class="table-active">거래처 주소</th>
                    <th><input type="text" class="form-control form300" name="m_buyer_address"></th>
                </tr>
                <tr>
                    <th class="table-active">통화</th>
                    <th><input type="text" class="form-control form300" name="m_buyer_currency"></th>
                </tr>
                <tr>
                    <th class="table-active">사업자번호</th>
                    <th><input type="text" class="form-control form300" name="m_buyer_number" id="buyerIdInput">
                        <p id="inputText" style="background-color: white"></p></th>
                </tr>
            </form>
            </tbody>
        </table>
        <button disabled class="btn btn-secondary" id="register">바이어 추가</button>

        <h2>추가된 바이</h2>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">거래처 명</th>
                <th scope="col">거래처 국가</th>
                <th scope="col">거래처 주소</th>
                <th scope="col">통화</th>
                <th scope="col">사업자번호</th>
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

    </div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

<script>
    const ctx = "${pageContext.request.contextPath}";

    document.querySelector("#buyerIdInput").addEventListener("blur", function () {
        // document.querySelector("#buyerIdButton").addEventListener("click", function () {
        console.log("하기싫어")
        checkedDoubleId = false;
        const insertBuyerNum = document.querySelector("#buyerIdInput").value;

        fetch(ctx + "/buyer/checkNum/" + insertBuyerNum)
            .then(res => res.json())
            .then(data => {
                document.querySelector("#inputText").innerText = data.message;
                $(function () {
                    $('#inputText').css("color", "red");
                })

                if (data.statusNum === 'not exist') {
                    $(function () {
                        $('#inputText').css("color", "black");
                    })
                    document.querySelector("#register").removeAttribute("disabled");
                }
            })
    })

    document.querySelector("#register").addEventListener("click", function () {
        document.querySelector("#registerForm").submit();
    })
</script>
</body>
</html>
