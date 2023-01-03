<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>list</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
    <div class="tm-main">
        <div class="container-md">
            <div class="row mt-5">
                <div class="col">
                    <table class="table">
                        <h1>판매가 관리</h1>
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>고객코드</th>
                            <%--                            <th>고객명</th>--%>
                            <th>상품코드</th>
                            <%--                            <th>상품명</th>--%>
                            <th>판매가</th>
                            <th>시작일</th>
                            <th>종료일</th>
                            <th>할인율</th>
                            <th>최종 단가</th>
                            <th>통화</th>
                            <th>등록일</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${priceList }" var="priceList">
                                <div>
                                    <tr>
                                        <td>${priceList.m_price_id}</td>
                                        <td>${priceList.m_buyer_id }</td>
                                            <%--                                <td>${priceList.m_buyer_name }</td>--%>
                                        <td>${priceList.m_item_id }</td>
                                            <%--                                <td>${priceList.m_item_name }</td>--%>
                                        <td>${priceList.m_price_price }</td>
                                        <td>${priceList.m_price_startPeriod }</td>
                                        <td>${priceList.m_price_lastPeriod }</td>
                                        <td>${priceList.m_price_discount }</td>
                                        <td>${priceList.m_price_lastPrice }</td>
                                        <td>${priceList.m_price_unit }</td>
                                        <td>${priceList.m_price_inserted }</td>
                                    </tr>
                                </div>
                            </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous">
</script>

</body>
</html>
