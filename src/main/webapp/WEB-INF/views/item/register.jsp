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
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #eeeeee;
        }

        .row{
            --bs-gutter-x: 0;
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

        #itemBody input {
            text-align: center;
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

        .groupEditOption, .manufacturerEditOption {
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
                        <input type="hidden" id="realInputItemId" class="form-control" name="" value="${getItem.m_item_id}" disabled>
                    </td>
                </tr>
                <tr>
                    <td class="table-active">제품그룹</td>
                    <td id="itemGroup" style="">
                        <select id="groupSelect" name="m_item_group" class="selectFrom form-select">
                            <option class="" value="">=== 선택 ===</option>
                            <option  id="modifyGroup" value="${getItem.m_item_group}">${getItem.m_item_group}</option>
                            <c:forEach items="${groupList}" var="groupList">
                                <option class="non" value="${groupList.m_item_group}">${groupList.m_item_group}</option>
                            </c:forEach>
                            <option class="GroupEditable" value="입력">입력</option>
                        </select>
                        <input type="hidden" class="groupEditOption form-control" value="${getItem.m_item_group}" autocomplete='off'
                               style="width: 210px;border-bottom-right-radius: 0;border-top-right-radius: 0;">
                    </td>
                </tr>
                <tr>
                    <td class="table-active">제조사</td>
                    <td id="itemManufacturer">
                        <select id="manufacturerSelect" name="m_item_manufacturer" class="selectFrom form-select" value="null">
                            <option class="" value="">=== 선택 ===</option>
                            <option id="modifyManufacturer" value="${getItem.m_item_manufacturer}">${getItem.m_item_manufacturer}</option>
<%--                            <c:forEach items="${manufacturerList}" var="manufacturerList">--%>
<%--                                <option class="non"--%>
<%--                                        value="${manufacturerList.m_item_manufacturer}">${manufacturerList.m_item_manufacturer}</option>--%>
<%--                            </c:forEach>--%>
                            <option class="manufacturerEditable" value="입력">입력</option>
                        </select>
                        <input type="hidden" class="manufacturerEditOption form-control" value="${getItem.m_item_manufacturer}" autocomplete='off'
                               style="width: 210px;border-bottom-right-radius: 0;border-top-right-radius: 0;">
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
                    <td class="table-active">단위</td>
                    <td id="itemUnit">
                        <input type="text" name="m_item_unit" class="form-control" value="EA" autocomplete='off'>
                    </td>
                </tr>
                </tbody>
            </table>
            <div style="display:none"><button id="resetBtn" type="reset"></button> </div>
        </form>

        <div>
            <button class="btn btn-secondary" type="button" id="plusButton1">제품 추가</button>
            <button class="btn btn-secondary" type="button" id="modifyButton1">제품 수정</button>
        </div>

        <div id="addList">
        <h2>추가된 제품</h2>
<%--        <form id="itemListForm" method="post">--%>
            <div class="tableList">
                <table class="table addList">
                    <thead>
                    <tr>
                        <th scope="col" style="width:200px">제품그룹</th>
                        <th scope="col" style="width:200px">제조사</th>
                        <th scope="col" style="width:250px">제품명</th>
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
<%--        </form>--%>
        </div>
    </div>
</div>
</body>
<script>
    // 수정버튼--------------------------------------------------------
    document.querySelector("#modifyButton1").addEventListener("click", function () {
        document.querySelector("#itemRegisterForm").submit();
    })
</script>
<script>
    // 수정창과 등록창 구분--------------------------------------------------------
    document.addEventListener("DOMContentLoaded", function () {
        const itemId = document.querySelector('#itemId input').value;
        if (itemId != 0) {
            document.getElementById("addList").style.display = "none";
            document.getElementById("inputItemId").style.display = "";
            document.getElementById("header").innerHTML = "제품 수정"
            document.getElementById("modifyButton1").style.display = "";
            document.getElementById("plusButton1").style.display = "none"
            document.getElementById("realInputItemId").type="text";
            $("#manufacturerSelect").children('option:first').remove();
            $("#groupSelect").children('option:first').remove();
        } else {
            document.getElementById("inputItemId").style.display = "none";
            document.getElementById("modifyButton1").style.display = "none";
            document.getElementById("modifyGroup").style.display = "none";
            document.getElementById("modifyManufacturer").style.display = "none";

        }
    });

</script>

<script>
    // 제품그룹 select--------------------------------------------------------
    var initialText = $('.GroupEditable').val();    // 입력 옵션 value

    $('#groupSelect').change(function () {                            // groupSelect가 change될 때 실행
        const manufacturerSelect = $("#manufacturerSelect");
        manufacturerSelect.children('option:not(:last,:first)').remove();

        var selected = $('option:selected', this).attr('class');    // 선택된 클래스값 non
        var optionText = $('.GroupEditable').text();                // 입력 인풋 텍스트값

        if (selected == "GroupEditable") {    // 입력 인풋이 선택되면
            // $('.groupEditOption').show();   // 숨겨진 인풋 보이기
            $('.groupEditOption').prop('type', "text");
            $('.groupEditOption').focus();

            $('.groupEditOption').keyup(function () {             // 숨겨진 인풋 키업일 때
                var editText = $('.groupEditOption').val();     // editText = 숨겨진 인풋 value
                $('.GroupEditable').val(editText);              // 입력 인풋 값을 edirtText로
                // $('.GroupEditable').html(editText);             // 입력 인풋 html을 editText로
            });

        } else {
            $('.groupEditOption').val(null);
            $('.groupEditOption').prop('type', "hidden");

            // $('.groupEditOption').hide();
        }

        // 제조사 카테고리 선택--------------------------------------------------------
        const itemGroup = document.querySelector("#groupSelect");
        const m_item_group = itemGroup.options[itemGroup.selectedIndex].value;

        const groupValue = {
            m_item_group
        }
        $.ajax({
            url: ctx + '/item/selectManufacturer/',
            method: 'POST',
            data : JSON.stringify(groupValue),
            contentType: 'application/json; charset=UTF-8',
            success: function(res) {
                const modifyManufacturer = $("#selectNon");
                const manufacturerEditable = $(".manufacturerEditable");

                // manufacturerSelect.children('option:not(:last)').remove();

                let option = '';
                $.each(res, function(i) {
                    option += '<option value="' + res[i] + '">' + res[i] + '</option>';
                });
                manufacturerEditable.before(option);

            }
        })
    });


    // 제품 제조사 select--------------------------------------------------------
    var initialText = $('.manufacturerEditable').val();
    // $('.manufacturerEditOption').val(initialText);

    $('#manufacturerSelect').change(function () {
        var selected = $('option:selected', this).attr('class');
        var optionText = $('.manufacturerEditable').text();
        if (selected == "manufacturerEditable") {
            // $('.ManufacturerEditOption').show();
            $('.manufacturerEditOption').prop('type', "text");
            $('.manufacturerEditOption').focus();

            $('.manufacturerEditOption').keyup(function () {
                var editText = $('.manufacturerEditOption').val();
                $('.manufacturerEditable').val(editText);
                // $('.manufacturerEditable').html(editText);
            });

        } else {
            $('.manufacturerEditOption').val(null);
            $('.manufacturerEditOption').prop('type', "hidden");
        }
    });
</script>

<script>
    // 추가버튼 클릭 시--------------------------------------------------------
    document.getElementById('plusButton1').addEventListener("click", function () {

        const lastIndex = document.querySelector(".addList").tBodies[0].rows.length;

        const itemGroup = document.querySelector("#groupSelect");
        const m_item_group = itemGroup.options[itemGroup.selectedIndex].value;
        const itemManufacturer = document.querySelector("#manufacturerSelect");
        const m_item_manufacturer = itemManufacturer.options[itemManufacturer.selectedIndex].value;
        const m_item_name = document.querySelector("input[name='m_item_name']").value;
        const m_item_unit = document.querySelector("input[name='m_item_unit']").value;

        // 빈값 체크--------------------------------------------------------
        var input_empty = false;
        var select_empty = false;
        $('#itemRegisterForm').find('input[type!="hidden"]').each(function(){
            if(!$(this).val()) {
                input_empty = true;
            }
        });
        $('.form-select option:selected').each(function(){
            if(!$(this).val()) {
                select_empty = true;
            }
        })
        if(input_empty ==true || select_empty == true) {
            alert('값을 전부 입력하세요.');
            document.querySelector(".addList").tBodies[0].deleteRow(lastIndex);
        }

        // 테이블 추가--------------------------------------------------------
        const tBody = document.getElementById('itemBody');
        const newRow = tBody.insertRow();

        const newCell1 = newRow.insertCell(0);
        const newCell2 = newRow.insertCell(1);
        const newCell3 = newRow.insertCell(2);
        const newCell4 = newRow.insertCell(3);
        const newCell5 = newRow.insertCell(4);

        newCell1.style.width = "200px";
        newCell2.style.width = "200px";
        newCell3.style.width = "250px";
        newCell4.style.width = "100px";
        newCell5.style.width = "150px";

        newCell1.innerHTML = '<input type="text" name="m_item_group_tb" value="' + m_item_group + '"readonly style="width: 180px">';
        newCell2.innerHTML = '<input type="text" name="m_item_manufacturer_tb" value="' + m_item_manufacturer + '"readonly style="width: 180px">';
        newCell3.innerHTML = '<input type="text" name="m_item_name_tb" value="' + m_item_name + '"readonly style="width: 220px">';
        newCell4.innerHTML = '<input type="text" name="m_item_unit_tb" value="' + m_item_unit + '"readonly style="width: 80px">';
        newCell5.innerHTML = '<button name="deleteBtn" class="btn btn-secondary deleteBtn" onclick="deleteBtn(this)">삭제</button>';


        // 중복체크(db)--------------------------------------------------------
        const itemCompareList = {
            m_item_group,
            m_item_manufacturer,
            m_item_name,
            m_item_unit
        }
        const ctx = "${pageContext.request.contextPath}";

        $.ajax({
            url: ctx + '/item/comapare',
            method: 'POST',
            data: JSON.stringify(itemCompareList),
            contentType: 'application/json; charset=UTF-8',
            success: function (cnt) {
                if (cnt >= 1) {
                    console.log(cnt)
                    alert("이미 등록 되어 있는 제품입니다.");
                    // check.abort();
                    document.querySelector(".addList").tBodies[0].deleteRow(lastIndex);

                    return false;
                } else {
                    if (lastIndex == 0) {
                        $('#resetBtn').trigger('click');
                        $('.groupEditOption').prop('type', "hidden");
                        $('.manufacturerEditOption').prop('type', "hidden");
                    }
                }
            }
        });


        // 중복체크(table)--------------------------------------------------------
        let data = {};
        const dataList = [];
        console.log(lastIndex)

        for (let i = 0; i < lastIndex; i++) {
            data = {
                "m_item_group": $("input[name='m_item_group_tb']").eq(i).val(),
                "m_item_manufacturer": $("input[name='m_item_manufacturer_tb']").eq(i).val(),
                "m_item_name": $("input[name='m_item_name_tb']").eq(i).val(),
                "m_item_unit": $("input[name='m_item_unit_tb']").eq(i).val()
            };
            dataList.push(data);
        }

        if (lastIndex > 0) {
            let CompareValue = Object.values(itemCompareList);

            for (let i = 0; i < dataList.length; i++) {
                let dataValue = Object.values(dataList[i]);

                if (dataValue.every((value, idx) => value === CompareValue[idx])) {
                    alert("테이블에 중복된 제품이 있습니다.")
                    document.querySelector(".addList").tBodies[0].deleteRow(lastIndex);

                    return false;
                } else {
                    $('#resetBtn').trigger('click');
                    $('.groupEditOption').prop('type', "hidden");
                    $('.manufacturerEditOption').prop('type', "hidden");

                    // 제조사 초기화
                    const manufacturerSelect = $("#manufacturerSelect");
                    manufacturerSelect.children('option:not(:last,:first)').remove();
                }
            }
        }
    });

</script>
<script>
    // 테이블 행 index 확인 및 삭제--------------------------------------------------------
    function deleteBtn(obj) {

        var index = $(obj).parent().parent().index();
        console.log("index : "+ index);

        $(obj).parent().parent().remove();
    }
</script>
<script>
    // 테이블 값 서버로 전송--------------------------------------------------------
    const ctx = "${pageContext.request.contextPath}";
    let table = document.querySelector(".addList");

    function itemRegister() {
        let tbodyNum = table.tBodies[0].rows;
        let dataList = [];
        let data = {};
        for (let i = 0; i < tbodyNum.length; i++) {
            data = {
                "m_item_group":$("input[name='m_item_group_tb']").eq(i).val(),
                "m_item_manufacturer":$("input[name='m_item_manufacturer_tb']").eq(i).val(),
                "m_item_name":$("input[name='m_item_name_tb']").eq(i).val(),
                "m_item_unit":$("input[name='m_item_unit_tb']").eq(i).val()
            };
            dataList.push(data);
        }

        $.ajax({
            url: ctx + '/item/registerList',
            method: 'POST',
            data : JSON.stringify(dataList),
            contentType: 'application/json; charset=UTF-8',
            success: function (resp) {
                if (resp.cnt >= 1) {
                alert(resp.cnt + "개의 제품 등록이 완료되었습니다.");
                location.href = ctx + '/item/list';
                } else {
                    alert("추가된 제품 테이블을 확인해주세요.")
                }
            },
            error:function(request,status,error) {
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
        })
    }
</script>
<script>
    // function periodOverLaps(testPeriod, periods) {
    //     for (var i = 0; i < periods.length; i++) {
    //         var period = periods[i];
    //         if (period.start < testPeriod.start && period.end > testPeriod.start)
    //             return true;
    //         if (period.start > testPeriod.start && period.start < testPeriod.end)
    //             return true;
    //     }
    //     return false;
    // }
    //
    // var periods = [{
    //     start : new Date('1/1/2015'),
    //     end : new Date('1/3/2015')
    // }, {
    //     start : new Date('1/5/2015'),
    //     end : new Date('1/7/2015')
    // }
    // ];
    //
    // var testPeriod = {
    //     start : new Date('1/1/2015'),
    //     end : new Date('1/2/2015')
    // };
    //
    // if (periodOverLaps(testPeriod, periods) == true) {
    //     alert("!?")
    // }
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"
        integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</html>
