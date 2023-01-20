<%--
  Created by IntelliJ IDEA.
  User: hyeonjong
  Date: 2023/01/02
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>내 정보 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"
            integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
<input type="hidden" value="${member.m_member_email}" id="memberEmail">
<div class="row">
    <div class= "col-3 sidebar" style="max-width: 300px">
        <my:header></my:header>
    </div>
    <div class="col" style="margin: 0 auto;max-width:70%;min-width: 600px">
        <div style="display: flex;justify-content: space-between;width: 900px;">
            <div id="itemListTitle">
                <h1 id="header">회원 정보 수정</h1>
            </div>
        </div>
        <table class="table">
            <thead>
            <tr>
                <td>이름</td>
                <td>${member.m_member_id}</td>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                    이메일
                </td>
                <td>
                    ${member.m_member_email }
                </td>
            </tr>
            <tr>
                <td>직급</td>
                <td>${member.m_authority_grade}</td>
            </tr>
            <form method="post" enctype="multipart/form-data" action="" id="changePassword">
                <tr>
                    <td>
                        기존비번
                    </td>
                    <td>
                        <input type="text" id="oldPassword" name="oldPassword">
                        <div style="color: red" id="inputText"></div>
                    </td>
                </tr>
                <div id="passwordDiv" style="display: none">
                    <tr>
                        <td>
                            새비번
                        </td>
                        <td>
                            <input type="password" id="newPassword1">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            새비번확인
                        </td>
                        <td>
                            <input type="password" id="newPassword2" name="m_member_password">
                            <div style="color: red" id="newPassword2Text"></div>
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: #eeeeee; border-bottom: none">
                            <input type="submit" class="btn btn-primary" value="전송" disabled id="submitBtn">
                        </td>
                    </tr>
                </div>
            </form>
            </tbody>
        </table>
        <div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 style="font-family: 'LINESeedKR-Bd'" class="modal-title fs-5" id="exampleModalLabel">수정
                            확인</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        수정하시겠습니까?
                    </div>
                    <div class="modal-footer">
                        <button style="font-family: 'LINESeedKR-Bd'" type="button" class="btn btn-secondary"
                                data-bs-dismiss="modal">취소
                        </button>
                        <button style="font-family: 'LINESeedKR-Bd'" id="modifyConfirmButton" type="button"
                                class="btn btn-primary">
                            확인
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

<script>
    const ctx = "${pageContext.request.contextPath}";


    document.querySelector("#modifyConfirmButton").addEventListener("click", function () {
        document.querySelector("#modifyForm").submit();
    });

    const customerPasswordInput1 = document.querySelector("#newPassword1");
    const customerPasswordInput2 = document.querySelector("#newPassword2");
    checkedOldPassword = false;

    function matchPassword() {
        checkedPassword = false;

        const samePassword1 = customerPasswordInput1.value;
        const samePassword2 = customerPasswordInput2.value;

        if (samePassword1 == samePassword2) {
            newPassword2Text.innerText = "비밀번호가 일치합니다"
            newPassword2Text.removeAttribute("style");
            checkedPassword = true;
            if (checkedPassword && checkedOldPassword) {
                document.querySelector("#submitBtn").removeAttribute("disabled");
            }
        } else {
            newPassword2Text.innerText = "비밀번호가 일치하지 않습니다"
            newPassword2Text.setAttribute("style", "color:red");
        }
    }

    document.querySelector("#newPassword1").addEventListener("keyup", matchPassword);
    document.querySelector("#newPassword2").addEventListener("keyup", matchPassword);

    document.querySelector("#submitBtn").addEventListener("click", function () {
        document.querySelector("#changePassword").submit;
    })


    document.querySelector("#oldPassword").addEventListener("blur", function () {
        checkedOldPassword = false;

        const m_member_email = document.querySelector("#memberEmail").value;
        const m_member_password = document.querySelector("#oldPassword").value;

        const member = {m_member_email, m_member_password};

        fetch(`\${ctx}/member/checkPassword`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(member)
        })
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
                    document.querySelector('#passwordDiv').style.display = "block";
                    return checkedOldPassword = true;
                }
            })
    })
</script>

</body>
</html>
