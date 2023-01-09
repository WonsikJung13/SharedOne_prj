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
<c:set var="path" value="${pageContext.request.contextPath}"/>
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
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

    <style>
        /* 테이블 */

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
        }

        .tableList input {
            border: none;
            background: transparent;
        }

        /*td a {*/
        /*    color: #37393b;*/
        /*    background-color: #fff;*/
        /*    text-decoration: none;*/
        /*}*/
        .table button {
            background-color: #757575;
            color: #fff;
            width: 100px;
            --bs-btn-font-weight: 600;
            border: none;
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
    <style>


    </style>

</head>
<body>
<div class="row" style="height: 100%;">
    <div class="col-3">
        <my:header></my:header>
    </div>
    <div class="col">
        <div id="itemTitle">
            <h1 id="header">제품 등록</h1>
            <h2>제품 추가</h2>
        </div>

        <form id="itemRegisterForm" method="post">
            <table class="table table-bordered">
                <tbody>
                <tr id="inputItemId">
                    <td class="table-active">제품코드</td>
                    <td id="itemId">
                        <input type="text" class="form-control" name="" value="${getItem.m_item_id}" disabled>
                    </td>
                </tr>
                <tr>
                    <td class="table-active">제품명</td>
                    <td id="itemName">
                        <input type="text" class="form-control" name="m_item_name" value="${getItem.m_item_name}"
                               autocomplete='off'>
                    </td>
                </tr>
                <tr>
                    <td class="table-active">제품그룹</td>
                    <td id="itemGroup" style="">
                        <select id="groupSelect" name="m_item_group" class="form-select">
                            <option value="${getItem.m_item_group}">${getItem.m_item_group}</option>
                            <c:forEach items="${groupList}" var="groupList">
                                <option class="non" value="${groupList.m_item_group}">${groupList.m_item_group}</option>
                            </c:forEach>
                            <option class="GroupEditable" value="입력">입력</option>
                        </select>
                        <input class="groupEditOption form-control" value="${getItem.m_item_group}" autocomplete='off'
                               style="display:none; width: 210px;border-bottom-right-radius: 0;border-top-right-radius: 0;">
                    </td>
                </tr>
                <tr>
                    <td class="table-active">제조사</td>
                    <td id="itemManufacturer">
                        <select id="manufacturerSelect" name="m_item_manufacturer" class="form-select">
                            <option value="${getItem.m_item_manufacturer}">${getItem.m_item_manufacturer}</option>
                            <c:forEach items="${manufacturerList}" var="manufacturerList">
                                <option class="non"
                                        value="${manufacturerList.m_item_manufacturer}">${manufacturerList.m_item_manufacturer}</option>
                            </c:forEach>
                            <option class="manufacturerEditable" value="입력">입력</option>
                        </select>
                        <input class="ManufacturerEditOption form-control" value="${getItem.m_item_manufacturer}"
                               autocomplete='off'
                               style="display:none; width: 210px;border-bottom-right-radius: 0;border-top-right-radius: 0;">
                    </td>
                </tr>
                <tr>
                    <td class="table-active">단위</td>
                    <td id="itemUnit">
                        <input type="text" name="m_item_unit" class="form-control" value="ea" autocomplete='off'>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>

        <div>
            <button class="btn btn-secondary" type="button" id="plusButton1">제품 추가</button>
            <button id="InputRemoveButton" class="btn btn-danger" type="submit" value="제품 삭제" data-bs-toggle="modal"
                    data-bs-target="#removeModal">제품 삭제
            </button>
        </div>
        <c:url value="/item/remove" var="removeLink"/>
        <form id="removeForm" action="${removeLink }" method="post">
            <input type="hidden" name="m_item_id" value="${getItem.m_item_id }">
        </form>
        <script>
            // document.querySelector("#submitButton1").addEventListener("click", function () {
            //     document.querySelector("#itemRegisterForm").submit();
            // })
            // document.querySelector("#InputRemoveButton").addEventListener("click", function (){
            //     document.querySelector("#removeForm").submit();
            // })
        </script>

        <h2>추가된 제품</h2>
        <form id="itemListForm" method="post">
            <div class="tableList">
                <table class="table addList">
                    <thead>
                    <tr>
                        <th scope="col" style="width:250px">제품명</th>
                        <th scope="col" style="width:200px">제품그룹</th>
                        <th scope="col" style="width:200px">제조사</th>
                        <th scope="col" style="width:100px">단위</th>
                        <th style="width:150px"></th>
                    </tr>
                    </thead>
                    <tbody id="itemBody">

                    </tbody>
                </table>
            </div>
            <div>
                <button class="btn btn-secondary" type="button" id="submitButton" onclick="itemRegister()">제품 등록
                </button>
            </div>
        </form>

        <!-- remove Modal -->
        <div class="modal fade" id="removeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">삭제 확인</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        삭제하시겠습니까? 복구할 수 없습니다.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                        <button id="removeConfirmButton" type="button" class="btn btn-danger">확인</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const itemId = document.querySelector("input[name='m_item_id']").value;
        if (itemId != 0) {
            document.getElementById("inputItemId").style.display = "";
            document.getElementById("submitButton1").innerHTML = "제품 수정";
            document.getElementById("header").innerHTML = "제품 수정"
        } else {
            document.getElementById("inputItemId").style.display = "none";
            document.getElementById("InputRemoveButton").style.display = "none";
        }
    });

</script>

<script>
    // 삭제하기
    document.querySelector("#removeConfirmButton").addEventListener("click", function () {
        document.querySelector("#removeForm").submit();
    });
    $.ajax({})
</script>

<script>
    // 제품그룹 select
    var initialText = $('.GroupEditable').val();    // 입력 옵션 value

    $('#groupSelect').change(function () {                            // groupSelect가 change될 때 실행
        var selected = $('option:selected', this).attr('class');    // 선택된 클래스값 non
        var optionText = $('.GroupEditable').text();                // 입력 인풋 텍스트값

        if (selected == "GroupEditable") {    // 입력 인풋이 선택되면
            $('.groupEditOption').show();   // 숨겨진 인풋 보이기
            $('.groupEditOption').focus();

            $('.groupEditOption').keyup(function () {             // 숨겨진 인풋 키업일 때
                var editText = $('.groupEditOption').val();     // editText = 숨겨진 인풋 value
                $('.GroupEditable').val(editText);              // 입력 인풋 값을 edirtText로
                // $('.GroupEditable').html(editText);             // 입력 인풋 html을 editText로
            });

        } else {
            $('.groupEditOption').hide();
        }
    });

    // 제품 제조사 select
    var initialText = $('.manufacturerEditable').val();
    // $('.ManufacturerEditOption').val(initialText);

    $('#manufacturerSelect').change(function () {
        var selected = $('option:selected', this).attr('class');
        var optionText = $('.manufacturerEditable').text();
        // var aa = document.getElementById('manufacturerSelect');
        // console.log(aa.options[aa.selectedIndex].value)
        if (selected == "manufacturerEditable") {
            $('.ManufacturerEditOption').show();
            $('.ManufacturerEditOption').focus();

            $('.ManufacturerEditOption').keyup(function () {
                var editText = $('.ManufacturerEditOption').val();
                $('.manufacturerEditable').val(editText);
                // $('.manufacturerEditable').html(editText);
            });

        } else {
            $('.ManufacturerEditOption').hide();
        }
    });
</script>

<script>
    function deleteRow() {
        const tBody = document.getElementById('itemBody');

        for (let i = 0; i < tBody.rows.length; i++) {
            tBody.deleteRow(i);
        }
    }

    document.getElementById('plusButton1').addEventListener("click", function () {
        const item_name = document.querySelector("input[name='m_item_name']").value;
        const itemGroup = document.querySelector("#groupSelect");
        const item_group = itemGroup.options[itemGroup.selectedIndex].value;
        const itemManufacturer = document.querySelector("#manufacturerSelect");
        const item_manufacturer = itemManufacturer.options[itemManufacturer.selectedIndex].value;
        const item_unit = document.querySelector("input[name='m_item_unit']").value;

        const tBody = document.getElementById('itemBody');
        const newRow = tBody.insertRow();

        const newCell1 = newRow.insertCell(0);
        const newCell2 = newRow.insertCell(1);
        const newCell3 = newRow.insertCell(2);
        const newCell4 = newRow.insertCell(3);
        const newCell5 = newRow.insertCell(4);
        newCell1.style.width = "250px";
        newCell2.style.width = "200px";
        newCell3.style.width = "200px";
        newCell4.style.width = "100px";
        newCell5.style.width = "150px";

        newCell1.innerHTML = '<input type="text" name="m_item_name" value="' + item_name + '" style="width: 220px">';
        newCell2.innerHTML = '<input type="text" name="m_item_group" value="' + item_group + '" style="width: 180px">';
        newCell3.innerHTML = '<input type="text" name="m_item_manufacturer" value="' + item_manufacturer + '" style="width: 180px">';
        newCell4.innerHTML = '<input type="text" name="m_item_unit" value="' + item_unit + '" style="width: 80px">';
        newCell5.innerHTML = '<button class="btn btn-secondary" onclick="deleteRow()">삭제</button>';
    });
</script>
<script>
    const ctx = "${pageContext.request.contextPath}";
    let table = document.querySelector(".addList");

    let ItemSet = function (m_item_name, m_item_group, m_item_manufacturer, m_item_unit) {
        this.m_item_name = m_item_name;
        this.m_item_group = m_item_group;
        this.m_item_manufacturer = m_item_manufacturer;
        this.m_item_unit = m_item_unit;
    }


    function itemRegister() {

        let paramArray = [];
        let param = new Array();
        let tbodyNum = table.tBodies[0].rows;
        console.log(tbodyNum)

        let tr = $("#itemBody tr");
        let td = tr.children();
        // td.each(function (i) {
            // let data = "m_item_name : " + $("input[name='m_item_name']").eq(i).val()
            //         + ", m_item_group : " + $("input[name='m_item_name']").eq(i).val()
            //         + ", m_item_manufacturer : " + $("input[name='m_item_manufacturer']").eq(i).val()
            //         + ", m_item_unit : " + $("input[name='m_item_unit']").eq(i).val();
            // param.push(tr.find("td").eq(i).find("input").val());
            // param.push($("input[name='m_item_name']").eq(i).val()),
            // param.push($("input[name='m_item_group']").eq(i).val()),
            // param.push($("input[name='m_item_manufacturer']").eq(i).val()),
            // param.push($("input[name='m_item_unit']").eq(i).val())
            // console.log("data : " + data);
            // paramArray.push(data);
            //     console.log("paramArray : " + paramArray);
        // })
        // console.log("param: " + param)
        let dataList = [];
        let data = {};
        for (let i = 0; i < tbodyNum.length; i++) {
            data = {"m_item_name":$("input[name='m_item_name']").eq(i).val(), "m_item_group":$("input[name='m_item_group']").eq(i).val(), "m_item_manufacturer":$("input[name='m_item_manufacturer']").eq(i).val(), "m_item_unit":$("input[name='m_item_unit']").eq(i).val()};
            dataList.push(data);
        //     data = "m_item_name : " + $("input[name='m_item_name']").eq(i).val()
        //         + ", m_item_group : " + $("input[name='m_item_group']").eq(i).val()
        //         + ", m_item_manufacturer : " + $("input[name='m_item_manufacturer']").eq(i).val()
        //         + ", m_item_unit : " + $("input[name='m_item_unit']").eq(i).val();
        //     // param.push(("#itemBody").find("td").eq(i).val());
        //     //
        //     // param.push($("input[name='m_item_name']").eq(i).val()),
        //     // param.push($("input[name='m_item_group']").eq(i).val()),
        //     // param.push($("input[name='m_item_manufacturer']").eq(i).val()),
        //     // param.push($("input[name='m_item_unit']").eq(i).val())
            console.log("data : " + data);
            console.log("dataList : " + dataList)
        //     // paramArray.push({data});
        //     // console.log("paramArray : " + paramArray);
        }
        // paramArray.push(param);
        // console.log("paramArray: " + paramArray);

        $.ajax({
            url: ctx + '/item/registerList',
            method: 'POST',
            data : JSON.stringify(dataList),
            contentType: 'application/json; charset=UTF-8',
            success: function (resp) {
                var respData = "m_item_name : " + resp["m_item_name"]+", m_item_group : " + resp["m_item_manufacturer"] + ", m_item_unit : " + resp["m_item_unit"]
                console.log("resp: " + respData)
                // data = "m_item_name : " + $("input[name='m_item_name']").eq(i).val()
                //     + ", m_item_group : " + $("input[name='m_item_group']").eq(i).val()
                //     + ", m_item_manufacturer : " + $("input[name='m_item_manufacturer']").eq(i).val()
                //     + ", m_item_unit : " + $("input[name='m_item_unit']").eq(i).val();
            }
        })

    //     fetch(ctx + "/item/registerList", {
    //         method: "post",
    //         headers: {
    //             "Content-Type": "application/json"
    //         },
    //         body: JSON.stringify(data)
    //     })
    //         .then(res => res.json())
    }

        // for (let i = 0; i < tbodyNum; i++) {
        //     let itemSet = new ItemSet(
        //         $("input[name='m_item_name']").eq(i).val(),
        //         $("input[name='m_item_group']").eq(i).val(),
        //         $("input[name='m_item_manufacturer']").eq(i).val(),
        //         $("input[name='m_item_unit']").eq(i).val(),
        //     )
        //     param.push(itemSet);
        //     console.log(param)
        //
        //     fetch(ctx + "/item/register", {
        //         method: "post",
        //         headers: {
        //             "Content-Type": "application/json"
        //         },
        //         body: JSON.stringify(param)
        //     })
        // }


</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"
        integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</html>
