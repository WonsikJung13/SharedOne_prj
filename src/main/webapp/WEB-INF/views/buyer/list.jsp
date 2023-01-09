<%--
  Created by IntelliJ IDEA.
  User: hyeonjong
  Date: 2022/12/30
  Time: 9:37
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
        .itemRegisterBtn {
            position: relative;
        }

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

        .table td {
            /*--bs-table-bg: #fffff;*/
            background-color: #fff;
            color: #37393b;
            text-align: center;
            line-height: 39px;
            font-size: 16px;
            font-weight: bold;
        }

        .tableList {
            background-color: #fff;
            height: 672px;
            width: 900px;
        }

        td a {
            color: #37393b;
            background-color: #fff;
            text-decoration: none;
        }

        .table button {
            background-color: #757575;
            color: #fff;
            /*border-radius: 0;*/
            width: 100px;
            --bs-btn-font-weight: 600;
            border: none;
        }

        .searchBox {
            background-color: white;
            width: 900px;
            padding: 20px 80px 10px 80px;
            color: #212529;
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        form > * {
            background-color: white;
            position: relative;
        }

        form .form-control, .form-select {
            height: 40px;
            margin: 5px 0 5px 0;
        }

        .input-group {
            margin-bottom: 0;
        }

        .itemRegisterBtn {
            float: right;
            margin-top: 20px;
        }

        .itemRegisterBtn button {
            background-color: #658e99;
            text-align: center;
            width: 150px;
            height: 55px;
            color: #fff;
            line-height: 39px;
            --bs-btn-font-weight: 600;
            border: none;
        }

        form div div, label {
            background-color: white;
        }

        .searchBtn {
            width: 100px;
            height: 40px;
            margin: 5px 0px 5px 0px;
            --bs-btn-font-weight: 600;
            background-color: #658e99;
            border: none;
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
                <h1 id="header">바이어 관리 및 등록</h1>
            </div>
            <div class="itemRegisterBtn">
                <c:url value="/buyer/register" var="registerLink"></c:url>
                <button type="button" class="btn btn-secondary" onclick="location.href='${registerLink}' ">제품 등록
                </button>
            </div>
        </div>
        <div class="searchBox">
            <c:url value="/buyer/list" var="listLink"></c:url>
            <form action="${listLink}" role="search">
                <div style="display: flex;justify-content: flex-start;">
                    <div>
                        <label>바이어 코드</label>
                        <input class="form-control" value="${param.m_buyer_number}" type="search" name="m_buyer_number"
                               placeholder="입력" autocomplete='off' style="width: 210px">
                    </div>
                    <div style="margin-left: 60px">
                        <label>바이어 국가</label>
                        <input class="form-select" type="text" list="groupList" style="width: 210px"/>
                        <datalist id="groupList">
                            <c:forEach items="${groupList}" var="groupList">
                                <option class="non"
                                        value="${groupList.m_buyer_region}">${groupList.m_buyer_region}</option>
                            </c:forEach>
                        </datalist>
                    </div>
                </div>
                <div class="input-group" style="float: none">
                    <input type="text" class="form-control">
                    <button class="btn btn-secondary searchBtn" type="submit" value="검색">검색</button>
                </div>
            </form>
        </div>

        <div class="tableList">
            <table class="table addList">
                <tbody>
                <tr style="font-family: 'LINESeedKR-Bd'">
                    <th>거래처 번호</th>
                    <th>거래처명</th>
                    <th>거래처 나라</th>
                    <th>거래처 주소</th>
                    <th>사업자 번호</th>
                    <th>통화</th>
                    <th>

                    </th>
                </tr>
                <c:forEach items="${buyerList }" var="buyer">
                    <tr>
                        <td id="id">
                            <c:url value="/buyer/get" var="infoLink">
                                <c:param value="${buyer.m_buyer_id }" name="m_buyer_id"/>
                            </c:url>
                            <a href="${infoLink }" class="listHref">
                                    ${buyer.m_buyer_id  }
                            </a>
                        </td>
                        <td>${buyer.m_buyer_name }</td>
                        <td>${buyer.m_buyer_region }</td>
                        <td>${buyer.m_buyer_address }</td>
                        <td>${buyer.m_buyer_number }</td>
                        <td>${buyer.m_buyer_currency}</td>
                        <td>
                            <c:url value="/buyer/modify" var="modifyLink">
                                <c:param value="${buyer.m_buyer_id }" name="m_buyer_id"/>
                            </c:url>
                            <button type="button" class="btn" onclick="location.href='${modifyLink}' ">수정</button>

                            <c:url value="/buyer/remove" var="removeLink">
                                <c:param value="${buyer.m_buyer_id }" name="m_buyer_id"/>
                            </c:url>
                            <input class="btn btn-danger" type="submit" value="삭제하기" data-bs-toggle="modal"
                                   data-bs-target="#removeModal${buyer.m_buyer_name }">
                        </td>
                    </tr>
                    <form id="removeForm${buyer.m_buyer_name }" action="${removeLink }" method="post">
                        <input type="hidden" name="replyName" value="${Buyer.m_buyer_id }">
                    </form>
                    <div class="modal fade" id="removeModal${buyer.m_buyer_name }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 style="font-family: 'LINESeedKR-Bd'" class="modal-title fs-5" id="exampleModalLabel">삭제 확인</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    삭제하시겠습니까?
                                </div>
                                <div class="modal-footer">
                                    <button style="font-family: 'LINESeedKR-Bd'" type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">취소
                                    </button>
                                    <button style="font-family: 'LINESeedKR-Bd'" id="removeConfirmButton${buyer.m_buyer_name }" type="button"
                                            class="btn btn-danger">확인
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script>
                        document.querySelector("#removeConfirmButton${buyer.m_buyer_name }").addEventListener("click", function () {
                            document.querySelector("#removeForm${buyer.m_buyer_name }").submit();
                        })
                    </script>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%--<form id="removeForm" action="${removeLink }" method="post">--%>
<%--    <input type="hidden" name="replyName" value="${Buyer.m_buyer_id }">--%>
<%--</form>--%>
<%--<div class="modal fade" id="removeModal${buyer.m_buyer_name }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
<%--    <div class="modal-dialog">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h1 style="font-family: 'LINESeedKR-Bd'" class="modal-title fs-5" id="exampleModalLabel">삭제 확인</h1>--%>
<%--                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--            </div>--%>
<%--            <div class="modal-body">--%>
<%--                삭제하시겠습니까?--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--                <button style="font-family: 'LINESeedKR-Bd'" type="button" class="btn btn-secondary"--%>
<%--                        data-bs-dismiss="modal">취소--%>
<%--                </button>--%>
<%--                <button style="font-family: 'LINESeedKR-Bd'" id="removeConfirmButton${buyer.m_buyer_name }" type="button"--%>
<%--                        class="btn btn-danger">확인--%>
<%--                </button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>


<c:url value="/buyer/register" var="registerLink">
</c:url>
<a href="${registerLink }" class="listHref">
    <i class="fa-sharp fa-solid fa-pen"></i>
</a>

<%--<script>--%>
<%--    document.querySelector("#removeConfirmButton${buyer.m_buyer_name }").addEventListener("click", function () {--%>
<%--        document.querySelector("#removeForm${buyer.m_buyer_name }").submit();--%>
<%--    })--%>
<%--</script>--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

</body>
</html>
