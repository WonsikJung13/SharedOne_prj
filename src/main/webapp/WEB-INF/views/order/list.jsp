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
    <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap"
            rel="stylesheet">
    <style>
        .itemRegisterBtn {
            position: relative;
        }

        * {
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
            width: 1000px;

        }

        tr {
            height: 55px;
            width: 1000px;

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
            width: 1000px;

        }

        .tableList {
            background-color: #fff;
            height: 672px;
            width: 1000px;
            margin-bottom: 100px;
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
            width: 1000px;
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
            width: 1000px;

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
                        <div style="display: flex;justify-content: space-between;width: 1000px;">
                            <div id="itemListTitle">
                                <h1 id="header">주문관리</h1>
                                <%--      <h2>제품 검색</h2>--%>
                            </div>
                            <div class="itemRegisterBtn">
                                <c:url value="/order/register" var="registerLink"></c:url>
                                <button type="button" class="btn btn-secondary" onclick="location.href='${registerLink}' ">주문 작성
                                </button>
                            </div>
                        </div>
                        <c:url value="/item/list" var="listLink"></c:url>
                        <form action="${listLink}" role="search">
                            <div class="searchBox ">
                                    <div class="row justify-content-start">
                                        <div class="col-4">
                                            <label>제품코드</label>
                                            <input class="form-select" type="text" list="itemList" style="width: 210px;"
                                                   autocomplete="off"/>
                                            <datalist id="itemList">
                                                <c:forEach items="${itemList}" var="itemList">
                                                    <option class="non" value="${itemList.m_item_id}">${itemList.m_item_name}</option>
                                                </c:forEach>
                                            </datalist>
                                        </div>
                                        <div class="col-4">
                                            <label>거래처코드</label>
                                            <input class="form-select" type="text" list="buyerList" style="width: 210px;"
                                                   autocomplete="off"/>
                                            <datalist id="buyerList">
                                                <c:forEach items="${buyerList}" var="buyerList">
                                                    <option class="non" value="${buyerList.m_buyer_id}">${buyerList.m_buyer_name}</option>
                                                </c:forEach>
                                            </datalist>
                                        </div>
                                    </div>
                                    <div class="input-group" style="float: none">
                                        <input type="text" class="form-control">
                                        <button class="btn btn-secondary searchBtn" type="submit">검색</button>
                                    </div>

                            </div>
                        </form>
                <div class="row justify-content-end">
                    <input style="float: right; width: 100px; margin-right: 100px" data-bs-toggle="modal"
                           data-bs-target="#removeModal" value="삭제" class="btn btn-danger"></input>
                </div>
                <c:url value="/price/remove" var="removeLink"/>
                <form id="removeForm" action="${removeLink }" method="post">
                    <input type="hidden" name="m_price_id" value="">
                </form>
                <div class="tableList">

                    <table class="table addList">
                        <thead style="width: auto">
                        <tr>
                            <th>주문번호</th>
                            <th>거래처코드</th>
                            <th>거래처명</th>
                            <th>전체금액</th>
                            <th>발주상태</th>

                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${orderList }" var="orderList">
                            <div>
                                <tr>
                                    <td>${orderList.m_order_id}</td>
                                    <td>${orderList.m_buyer_id}</td>
                                    <td>${orderList.m_order_buyerName}</td>
                                    <td>${orderList.m_order_sumPrice}</td>
                                    <td>${orderList.m_order_status}</td>
<%--                                    <td>--%>
<%--                                        <c:url value="/price/modify" var="modifyLink">--%>
<%--                                            <c:param value="${priceList.m_price_id }" name="m_price_id"/>--%>
<%--                                        </c:url>--%>
<%--                                        <button type="button" class="btn" onclick="location.href='${modifyLink}' ">수정</button>--%>
<%--                                    </td>--%>
                                </tr>
                            </div>
                        </c:forEach>
                        </tbody>
                    </table>



                    <form id="removeForm" action="${removeLink }" method="post">
            <input type="hidden" name="replyName" value="${Buyer.m_buyer_id }">
        </form>
        <div class="modal fade" id="removeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 style="font-family: 'LINESeedKR-Bd'" class="modal-title fs-5" id="exampleModalLabel">삭제
                            확인</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        삭제하시겠습니까?
                    </div>
                    <div class="modal-footer">
                        <button style="font-family: 'LINESeedKR-Bd'" type="button" class="btn btn-secondary"
                                data-bs-dismiss="modal">취소
                        </button>
                        <button style="font-family: 'LINESeedKR-Bd'" id="removeConfirmButton" type="button"
                                class="btn btn-danger">확인
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
</body>
</html>
