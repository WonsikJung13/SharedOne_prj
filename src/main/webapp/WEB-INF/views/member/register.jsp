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
    <title>회원 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <style>
        .sidebar {
            z-index: 5;
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
    <div class= "col-3 sidebar" style="max-width: 300px">
        <my:header></my:header>
    </div>
    <div class="col" style="margin: 0 auto;max-width:70%;min-width: 600px">
        <div style="display: flex;justify-content: space-between;width: 900px;">
            <div id="itemListTitle">
                <h1 id="header">회원 등록</h1>
            </div>
        </div>

        <table class="table table-bordered">
            <tbody>
            <form action="" method="post" enctype="multipart/form-data" id="registerForm">
                <tr>
                    <th class="table-active">이름</th>
                    <th><input class="form-control form300" type="text" name="m_member_id"></th>
                </tr>
                <tr>
                    <th class="table-active">이메일</th>
                    <th><input class="form-control form300" type="email" name="m_member_email" id="emailInput">
                    <p id="inputText" style="background-color: white"></p></th>
                </tr>
            </form>
            </tbody>
        </table>
        <button class="btn btn-secondary" id="register" disabled>등록</button>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<script>
    const ctx = "${pageContext.request.contextPath}";

    document.querySelector("#register").addEventListener("click",function (){
        document.querySelector("#registerForm").submit();
    })

    document.querySelector("#emailInput").addEventListener("blur", function () {
        const m_member_email = document.querySelector("#emailInput").value;

        fetch(ctx + "/member/checkEmail/" + m_member_email)
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
</script>
</body>
</html>
