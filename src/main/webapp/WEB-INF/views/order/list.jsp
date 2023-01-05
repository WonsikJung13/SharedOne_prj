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
        * {
            font-family: 'Noto Sans KR', sans-serif;
        }
        .table{
            width: 900px;
        }
        tr{
            height: 55px;
        }
        h1{
            font-size:1.5em;
            margin: 30px 0;
        }
        h2{
            font-size: 1.1em;
            margin: 20px 0 10px 0;
        }
    </style>
</head>
<body>
<div class="row">
    <div class="col-3">
        <my:header></my:header>
    </div>
    <div class="col">
        <h1>제품 선택</h1>
        <table class="table table-bordered">
            <tbody>
            <tr>
                <td class="table-active">제품코드</td>
                <td>
                    <div>
                        <input onchange="itemView()" class="form-select" aria-label="Default select example" type="text" list="lists" id="orderItems" placeholder="제품를 선택해주세요"/>
                        <datalist id ="lists">
                            <c:forEach items="${itemList}" var="items" >
                                <option value="${items.m_item_id}_${items.m_item_name}" class="itemSelect"></option>
                            </c:forEach>
                        </datalist>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="table-active">통화</td>
                <td id="itemCurrency">
                </td>
            </tr>
            <tr>
                <td class="table-active">할인율</td>
                <td id="itemDiscount"></td>
            </tr>
            <tr>
                <td class="table-active">판매가격</td>
                <td>
                    <input id="itemPrice" class="form-control" type="text" placeholder="Default input" aria-label="default input example">
                </td>
            </tr>
            <tr>
                <td class="table-active">오더수량</td>
                <td>
                    <input class="form-control" type="text" placeholder="Default input" aria-label="default input example">
                </td>
            </tr>
            <tr>
                <td class="table-active">총 금액</td>
                <td>
                    11
                </td>
            </tr>
            </tbody>
        </table>
        <button class="btn btn-secondary">제품추가</button>

        <h2>추가된 제품</h2>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">제품코드</th>
                <th scope="col">제품명</th>
                <th scope="col">판매가격</th>
                <th scope="col">오더수량</th>
                <th scope="col">총 금액</th>
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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<script>
</script>
</body>
</html>
