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


        /*.tableList {*/
        /*    background-color: #fff;*/
        /*    height: 444px;*/
        /*    width: 1000px;*/
        /*    overFlow: scroll;*/
        /*    overflow-x: hidden;*/
        /*}*/

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
            width: 1000px;
        }

        .orderTotalPrice {
            color: red;
        }
        .table-active{
            width: 180px;
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
                <h1 id="header">거래처 등록</h1>
            </div>
            <div class="itemRegisterBtn">
            </div>
        </div>
        <h2>거래처 추가</h2>

        <table class="table table-bordered" id="aaa">
            <tbody>
            <form action="" method="post" id="registerForm">
                <tr>
                    <th class="table-active">거래처 명</th>
                    <th><input class="form-control form300" type="text" name="m_buyer_name" id="m_buyer_name"></th>
                </tr>
                <tr>
                    <th class="table-active">거래처 국가</th>
                    <th><input class="form-control form300" type="text" name="m_buyer_region" id="m_buyer_region"></th>
                </tr>
                <tr>
                    <th class="table-active">거래처 주소</th>
                    <th><input type="text" class="form-control form300" name="m_buyer_address" id="m_buyer_address">
                    </th>
                </tr>
                <tr>
                    <th class="table-active">통화</th>
                    <th id="ddd"><input type="text" class="form-control form300" name="m_buyer_currency"
                                        id="m_buyer_currency">
                    </th>
                </tr>
                <tr>
                    <th class="table-active">사업자번호</th>
                    <th><input type="text" class="form-control form300" name="m_buyer_number" id="buyerIdInput">
                        <p id="inputText" style="background-color: white"></p></th>
                </tr>
            </form>
            </tbody>
        </table>
        <button disabled class="btn btn-secondary" id="addBtn">거래처 추가</button>

        <h2>추가된 거래처</h2>
        <div class="tableList">

            <table class="table addList">
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
                <tbody id="itemBody">

                </tbody>
            </table>
        </div>
        <button disabled class="btn btn-secondary" id="submitBtn">등록</button>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

<script>
    const ctx = "${pageContext.request.contextPath}";

    let number = [];

    document.querySelector("#buyerIdInput").addEventListener("blur", function () {
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
                    document.querySelector("#addBtn").removeAttribute("disabled");
                    document.querySelector("#submitBtn").removeAttribute("disabled");
                }
            })

        setTimeout(function (){
        for(const a in number){
            if(number[a] === insertBuyerNum){
                document.querySelector("#addBtn").setAttribute("disabled", "");
                document.querySelector("#inputText").innerText = "이미 등록되었습니다"
                $('#inputText').css("color", "red");
            }
        }},100)
    })

    let addData = [];


    document.querySelector("#addBtn").addEventListener("click", function () {
        const m_buyer_name = document.querySelector("#m_buyer_name").value;
        const m_buyer_region = document.querySelector("#m_buyer_region").value;
        const m_buyer_address = document.querySelector("#m_buyer_address").value;
        const m_buyer_currency = document.querySelector("#m_buyer_currency").value;
        const m_buyer_number = document.querySelector("#buyerIdInput").value;

        number.push(m_buyer_number);

        const data = {
            m_buyer_name,
            m_buyer_region,
            m_buyer_address,
            m_buyer_currency,
            m_buyer_number
        }
        addData.push(data)
        const buyerAdd = `
            <tr id="\${m_buyer_number}">
                 <td class="buyerAdd"> \${m_buyer_name} </td>
                 <td class="buyerAdd"> \${m_buyer_region} </td>
                 <td class="buyerAdd"> \${m_buyer_address} </td>
                 <td class="buyerAdd"> \${m_buyer_currency} </td>
                 <td class="buyerAdd"> \${m_buyer_number} </td>
                <td><button class="btn btn-secondary" data-value="\${m_buyer_number}" onclick="clickRemove(this)">삭제</button></td>
            </tr>
        `;
        itemBody.insertAdjacentHTML("beforeend", buyerAdd);

        document.querySelector("#m_buyer_name").value = null;
        document.querySelector("#m_buyer_region").value = null;
        document.querySelector("#m_buyer_address").value = null;
        document.querySelector("#m_buyer_currency").value = null;
        document.querySelector("#buyerIdInput").value = null;
        document.querySelector("#addBtn").setAttribute("disabled", "");
        document.querySelector("#inputText").innerText = "";
    })

    function clickRemove(target) {
        const removeNum = target.dataset.value;

        const remove1 = document.getElementById(removeNum);
        remove1.remove();

        addData = addData.filter((item) => {
            return !(item["m_buyer_number"] == removeNum)
        })
    }

    document.querySelector("#submitBtn").addEventListener("click", function () {
        fetch(`\${ctx}/buyer/register`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(addData)
        })
            .then(res => res.json())

        const buyerList = ctx + '/buyer/list';


        setTimeout(function (){
            location.href = buyerList;
        },500)
    })


</script>
</body>
</html>
