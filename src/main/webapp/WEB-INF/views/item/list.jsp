<%--
  Created by IntelliJ IDEA.
  User: sunggyu-lim
  Date: 2023/01/01
  Time: 5:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Title</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
        integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>
  <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <div>
    <div>
      <h1>
        제품 리스트
      </h1>
    </div>
    <div>
      <c:url value="/item/register" var="registerLink"></c:url>
      <a href="${registerLink}">제품 등록</a>
    </div>
    <div>
      <table class="table">
        <thead>
        <tr>
          <th>제품코드</th>
          <th>제품명</th>
          <th>제품그룹</th>
          <th>제조사</th>
          <th>단위</th>
        </tr>
        </thead>
        <tbody>
          <c:forEach items="${itemList}" var="itemList">
            <div>
              <tr>
                <td>
                  <c:url value="/item/register" var="getLink">
                    <c:param name="m_item_id" value="${itemList.m_item_id}"></c:param>
                  </c:url>
                  <a href="${getLink}">
                    ${itemList.m_item_id}
                  </a>
                </td>
                <td>
                  ${itemList.m_item_name}
                </td>
                <td>
                  ${itemList.m_item_group}
                </td>
                <td>
                  ${itemList.m_item_manufacturer}
                </td>
                <td>
                  ${itemList.m_item_unit}
                </td>
              </tr>
            </div>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</html>
