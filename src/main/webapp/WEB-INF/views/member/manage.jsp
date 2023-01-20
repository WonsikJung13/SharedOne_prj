<%--
  Created by IntelliJ IDEA.
  User: hyeonjong
  Date: 2023/01/04
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>회원 관리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"
            integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:400,300">

    <style>
        .sidebar {
            z-index: 5;
        }

        .itemRegisterBtn {
            position: relative;
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

        /*페이지네이션*/
        .pagination {
            position: relative;
            justify-content: center;
            height: 50px;
            /*right: 10%;*/
        }

        .pagination a {
            z-index: 2;
            position: relative;
            display: inline-block;
            color: #2c3e50;
            text-decoration: none;
            /*font-size: 1.2rem;*/
            padding: 9px 15px 4px;
            font-family: 'Open Sans', sans-serif;
        }

        .pagination a:before {
            z-index: -1;
            position: absolute;
            height: 100%;
            width: 100%;
            content: "";
            top: 0;
            left: 0;
            background-color: #2c3e50;
            border-radius: 24px;
            transform: scale(0);
            transition: all 0.2s;
        }

        .pagination a:hover,
        .pagination a .pagination-active {
            color: #fff;
        }

        .pagination a:hover:before,
        .pagination a .pagination-active:before {
            transform: scale(1);
        }

        .pagination .pagination-active {
            color: #fff;
        }

        .pagination .pagination-active:before {
            transform: scale(1);
        }

        .pagination-newer, .pagination-older {
            border-style: solid;
            border-width: 0;
            border-radius: 20px;
            padding: 9px 10px !important;
            margin-bottom: 13px;
        }
    </style>
</head>
<body>
<div class="row" style="height: 100%">
    <div class="col-3 sidebar" style="max-width: 300px">
        <my:header></my:header>
    </div>
    <div class="col" style="margin: 0 auto;max-width:70%;min-width: 600px">

        <div style="display: flex;justify-content: space-between;">
            <div id="itemListTitle">
                <h1 id="header">회원 관리</h1>
            </div>
            <div class="itemRegisterBtn">
                <c:url value="/member/register" var="registerLink"/>
                <button type="button" class="btn btn-secondary" onclick="location.href='${registerLink}' ">
                    회원 등록
                </button>
            </div>
        </div>

        <div class="tableList">
            <table class="table addList">
                <thead>
                <tr style="font-family: 'LINESeedKR-Bd'">
                    <th>이름</th>
                    <th>이메일</th>
                    <th colspan="2">직함</th>
                    <th>비밀번호</th>
                    <th>

                    </th>

                </tr>
                </thead>

                <tbody>
                <c:forEach items="${memberList }" var="member" varStatus="status">
                    <tr>
                        <td>
                                ${member.m_member_id  }
                        </td>
                        <td>
                                ${member.m_member_email }
                        </td>
                        <td style="margin-right: 0%">
                            <form id="selectForm${status.index}" method="post">
                                <input type="hidden" name="m_member_email" value="${member.m_member_email}">
                                <input type="hidden" name="m_authority_id" id="authId${status.index}"
                                       value="${member.m_authority_id}">
                                <select class="form-select" id="inputGroupSelect${status.index}">
                                    <option selected name="m_authority_id"
                                            value="${member.m_authority_id}">${member.m_authority_grade}</option>
                                    <c:forEach items="${authority }" var="authority">
                                        <c:if test="${member.m_authority_grade ne authority.m_authority_grade}">
                                            <option name="m_authority_id"
                                                    value="${authority.m_authority_id}">${authority.m_authority_grade}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </form>
                        </td>
                        <td style="padding-left: 0%; height: 30px">
                            <button class="btn btn-primary mb-5" type="submit" id="gradeSubmit${status.index}">변경
                            </button>
                        </td>
                        <script>
                            $(document).ready(function () {
                                $("#inputGroupSelect${status.index}").change(function () {
                                    $('#authId${status.index}').val($(this).val());
                                })
                            })

                            document.querySelector('#gradeSubmit${status.index}').addEventListener('click', function () {
                                document.querySelector('#selectForm${status.index}').submit();
                            })
                        </script>


                        <td>
                            <c:url value="/member/resetPassword" var="modifyLink">
                                <c:param value="${member.m_member_email }" name="m_member_email"/>
                            </c:url>
                            <a href="${modifyLink}" style="color: white">
                                <button class="btn btn-primary">초기화</button>
                            </a>
                        </td>
                        <td>
                            <c:url value="/member/remove" var="removeLink">
                                <c:param value="${member.m_member_email }" name="m_member_email"/>
                            </c:url>
                            <input class="btn btn-danger" type="submit" value="삭제하기" data-bs-toggle="modal"
                                   data-bs-target="#removeModal${member.m_member_id }">
                            <form id="removeForm${member.m_member_id }" action="${removeLink }" method="post">
                                <input type="hidden" name="m_member_email" value="${member.m_member_email }">
                            </form>
                        </td>
                    </tr>
                    <div class="modal fade" id="removeModal${member.m_member_id }" tabindex="-1"
                         aria-labelledby="exampleModalLabell"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 style="font-family: 'LINESeedKR-Bd'" class="modal-title fs-5"
                                        id="exampleModalLabell">삭제 확인</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    "${member.m_member_id }" 님을 삭제하시겠습니까?
                                </div>
                                <div class="modal-footer">
                                    <button style="font-family: 'LINESeedKR-Bd'" type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">취소
                                    </button>
                                    <button style="font-family: 'LINESeedKR-Bd'"
                                            id="removeConfirmButton${member.m_member_id }" type="button"
                                            class="btn btn-danger">확인
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <script>
                        document.querySelector("#removeConfirmButton${member.m_member_id }").addEventListener("click", function () {
                            document.querySelector("#removeForm${member.m_member_id }").submit();
                        })
                    </script>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="col">
                <nav aria-label="pagination-container" style=" background-color: #fff">
                    <div class="pagination">

                        <%-- 맨앞 버튼( 1페이지가 아니면 생김) --%>
                        <c:if test="${memberDto.currentPageNumber ne 1 }">
                            <c:url value="/member/manage" var="listLink">
                                <c:param name="page" value="1"/>
                            </c:url>
                            <%-- 맨앞 버튼 --%>
                            <a href="${listLink }" class="pagination-newer">
                                <i class="bi bi-chevron-double-left"></i>
                            </a>
                        </c:if>

                        <c:if test="${memberDto.hasPrevButton }">
                            <c:url value="/member/manage" var="listLink">
                                <c:param name="page" value="${memberDto.jumpPrevPageNumber }"></c:param>
                            </c:url>
                            <a href="${listLink }" class="pagination-newer">
                                <i class="bi bi-chevron-left"></i>
                            </a>
                        </c:if>

                        <c:forEach begin="${memberDto.leftPageNumber}" end="${memberDto.rightPageNumber}"
                                   var="pageNumber">
                            <c:url value="/member/manage" var="listLink">
                                <c:param name="page" value="${pageNumber }"/>
                            </c:url>
                            <span class="pagination-inner">
                              <%-- 현재페이지에 active 클래스 추가 --%>
                                <a class="${memberDto.currentPageNumber eq pageNumber ? 'pagination-active' : ''}"
                                   href="${listLink}">${pageNumber}</a>
                        </span>
                        </c:forEach>

                        <%-- 다음 버튼 --%>
                        <c:if test="${memberDto.hasNextButton }">
                            <c:url value="/member/manage" var="listLink">
                                <c:param name="page" value="${memberDto.jumpNextPageNumber }"></c:param>
                            </c:url>
                            <a href="${listLink }" class="pagination-older">
                                <i class="bi bi-chevron-right"></i>
                            </a>
                        </c:if>

                        <%-- 맨뒤 버튼 --%>
                        <c:if test="${memberDto.currentPageNumber ne memberDto.lastPageNumber }">
                            <c:url value="/member/manage" var="listLink">
                                <c:param value="${memberDto.lastPageNumber }" name="page"/>
                            </c:url>
                            <a href="${listLink }" class="pagination-older">
                                <i class="bi bi-chevron-double-right"></i>
                            </a>
                        </c:if>
                    </div>
                </nav>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>


</body>
</html>
