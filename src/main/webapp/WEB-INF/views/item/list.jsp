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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

  <style>
    /*제품그룹 박스*/
    #groupSelect, #manufacturerSelect{
      height: 30px;
    }
    option {
      height: 30px;
      line-height: 30px;
    }

    .groupEditOption, .manufacturerEditable{
      position: relative;
    }
  </style>
</head>
<body>
  <div>
    <div>
      <h1>
        제품 관리 및 등록
      </h1>
    </div>
    <div>
      <c:url value="/item/register" var="registerLink"></c:url>
      <a href="${registerLink}">제품 등록</a>
    </div>

    <div>
      <c:url value="/item/list" var="listLink"></c:url>
      <form action="${listLink}" role="search">
        <div>
          <label>제품코드</label>
          <input value="${param.m_item_id}" type="search" name="m_item_id" placeholder="입력" autocomplete='off'>
        </div>
        <div>
          <label>제품그룹</label>
          <select id="groupSelect">
            <c:forEach items="${groupList}" var="groupList">
              <option class="non" value="${groupList.m_item_group}">${groupList.m_item_group}</option>
            </c:forEach>
            <option class="GroupEditable" value="입력">입력</option>
          </select>
          <input class="groupEditOption" style="display:none;" autocomplete='off'>
        </div>
        <div>
          <label>제조사</label>
          <select id="manufacturerSelect">
            <c:forEach items="${manufacturerList}" var="manufacturerList">
              <option class="non" value="${manufacturerList.m_item_manufacturer}">${manufacturerList.m_item_manufacturer}</option>
            </c:forEach>
            <option class="manufacturerEditable" value="입력">입력</option>
          </select>
          <input class="ManufacturerEditOption" style="display:none;" autocomplete='off'>
        </div>
        <div>
          <input type="submit" value="검색">
        </div>
      </form>
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
    <div class="row">
      <div class="col">
        <nav aria-label="Page navigation example">
          <ul class="pagination">

            <%-- 맨앞 버튼( 1페이지가 아니면 생김) --%>
            <c:if test="${itemDto.currentPageNumber ne 1 }">
              <c:url value="/item/list" var="listLink">
                <c:param name="page" value="1" />
              </c:url>
              <%-- 맨앞 버튼 --%>
              <li class="page-item">
                <a href="${listLink }" class="page-link">
                  <i class="fa-solid fa-angles-left"></i>
                </a>
              </li>
            </c:if>

            <c:if test="${itemDto.hasPrevButton }">
              <c:url value="/item/list" var="listLink">
                <c:param name="page" value="${itemDto.jumpPrevPageNumber }"></c:param>
              </c:url>
              <li class="page-item">
                <a href="${listLink }" class="page-link">
                  <i class="fa-solid fa-angle-left"></i>
                </a>
              </li>
            </c:if>

            <c:forEach begin="${itemDto.leftPageNumber}" end="${itemDto.lastPageNumber}" var="pageNumber">
              <c:url value="/item/list" var="listLink">
                <c:param name="page" value="${pageNumber }"/>
              </c:url>
                <li class="page-item

                  <%-- 현재페이지에 active 클래스 추가 --%>
                  ${itemDto.currentPageNumber eq pageNumber ? 'active' : ''} }

                  "><a class="page-link" href="${listLink}">${pageNumber}</a>
                </li>
            </c:forEach>

            <c:if test="${itemDto.currentPageNumber ne itemDto.lastPageNumber }">
              <c:url value="/item/list" var="listLink">
                <c:param value="${itemDto.lastPageNumber }" name="page" />
              </c:url>
              <li class="page-item">
                <a href="${listLink }" class="page-link">
                  <i class="fa-solid fa-angle-right"></i>
                </a>
              </li>
            </c:if>

            <c:if test="${itemDto.currentPageNumber ne itemDto.lastPageNumber }">
              <c:url value="/item/list" var="listLink">
                <c:param value="${itemDto.lastPageNumber }" name="page" />
                <c:param name="q" value="${param.q }" />
                <c:param name="t" value="${param.t }" />
              </c:url>
              <!-- li.page-item>a.page-link{맨뒤버튼} -->
              <li class="page-item">
                <a href="${listLink }" class="page-link">
                  <i class="fa-solid fa-angles-right"></i>
                </a>
              </li>
            </c:if>
          </ul>
        </nav>
      </div>
    </div>
  </div>
</body>

<script>
  // 제품그룹 select
  var initialText = $('.GroupEditable').val();
  $('.groupEditOption').val(initialText);

  $('#groupSelect').change(function(){
    var selected = $('option:selected', this).attr('class');
    var optionText = $('.GroupEditable').text();

    if(selected == "GroupEditable"){
      $('.groupEditOption').show();


      $('.groupEditOption').keyup(function(){
        var editText = $('.groupEditOption').val();
        $('.GroupEditable').val(editText);
        $('.GroupEditable').html(editText);
      });

    }else{
      $('.groupEditOption').hide();
    }
  });

  // 제품 제조사 select
  var initialText = $('.manufacturerEditable').val();
  $('.ManufacturerEditOption').val(initialText);

  $('#manufacturerSelect').change(function(){
    var selected = $('option:selected', this).attr('class');
    var optionText = $('.manufacturerEditable').text();

    if(selected == "manufacturerEditable"){
      $('.ManufacturerEditOption').show();


      $('.ManufacturerEditOption').keyup(function(){
        var editText = $('.ManufacturerEditOption').val();
        $('.manufacturerEditable').val(editText);
        $('.manufacturerEditable').html(editText);
      });

    }else{
      $('.ManufacturerEditOption').hide();
    }
  });

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</html>
