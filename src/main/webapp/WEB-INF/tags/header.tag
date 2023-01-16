<%@ tag language="java" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:url value="/buyer/list" var="buyerList"></c:url>
<c:url value="/item/list" var="itemList"></c:url>
<c:url value="/price/list" var="priceList"></c:url>
<c:url value="/member/manage" var="memberList"></c:url>
<c:url value="/order/register" var="orderLink"></c:url>
<c:url value="/order/list" var="orderList"></c:url>
<c:url value="/order/adminList" var="adminList"></c:url>
<c:url value="/report/orderReport" var="reportLink"></c:url>
<style>
    a {
        color: white;
    }


    main {
        height: 100vh;
        max-height: 100vh;
        overflow-x: auto;
        overflow-y: hidden;
    }

    .btn-toggle {

        font-weight: 600;
        font-size: 18px;
        background-color: #353535;
        color: white;
        width: 248px;
    }

    .btn-toggle:hover {
        color: black;
        background-color: white;

    }

    .btn-toggle-nav {
        margin: 10px 0;
    }

    .btn-toggle-nav a {
        padding: .1875rem .5rem;
        margin-top: .125rem;
        margin-left: 1.25rem;
        font-size: 15px;
    }

    .btn-toggle-nav a:hover,
    .btn-toggle-nav a:focus {
        background-color: #000;
        color: white;
    }

    .navbg {
        background-color: #353535;
    }

    li {
        background-color: #353535;
    }

    #myBtn {
        display: none; /* Hidden by default */
        position: fixed; /* Fixed/sticky position */
        bottom: 20px; /* Place the button at the bottom of the page */
        right: 30px; /* Place the button 30px from the right */
        z-index: 99; /* Make sure it does not overlap */
        border: none; /* Remove borders */
        outline: none; /* Remove outline */
        background-color: red; /* Set a background color */
        color: white; /* Text color */
        cursor: pointer; /* Add a mouse pointer on hover */
        padding: 15px; /* Some padding */
        border-radius: 10px; /* Rounded corners */
        font-size: 18px; /* Increase font size */
    }

    #myBtn:hover {
        background-color: #555; /* Add a dark-grey background on hover */
    }

    @media screen and (max-width: 1400px) {
        #sideBar {
            display: none;
        }
    }

    @media screen and (min-width: 1400px) {
        .sideBtn {
            display: none;
        }
    }

</style>

<link rel="stylesheet"
      href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<button class="navbar-toggler sideBtn" type="button" aria-label="Toggle navigation" style="margin-left: 20px"
        data-bs-toggle="collapse"
        data-bs-target="#sideBar-collapse" aria-expanded="false">
    <i class="fas fa-bars"></i>
</button>
<div id="sideBar-collapse" class="sideBtn collapse" style="margin-left: 20px">
    <div class="accordion-item">
        <h2 class="accordion-header" id="headingOne">
            <button class="accordion-button" type="button"
                    data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false"
                    aria-controls="collapseOne">
                마스터
            </button>
        </h2>
    </div>


    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne"
         data-bs-parent="#accordionExample">
        <div class="accordion-body" style="margin-left: 10px;margin-right: 3px;border-left-style: solid;border-left-width: 3px  ">
            <div>
                <br>
                <button type="button" onclick="location.href='${itemList}'" class="accordion-button">제품 등록 관리</button>
            </div>
            <div>
                <button onclick="location.href='${buyerList}'" class="accordion-button">바이어 등록
                    관리
                </button>
            </div>
            <div>
                <button onclick="location.href='${priceList}'" class="accordion-button">판매가 등록
                    관리
                </button>
            </div>
            <sec:authentication property="authorities" var="authorities"/>
            <c:if test="${authorities eq '[팀장]'}">
                <div>
                    <button onclick="location.href='${memberList}'" class="accordion-button">회원
                        관리
                    </button>
                </div>
            </c:if>
        </div>
    </div>

    <div class="accordion-item">
        <h2 class="accordion-header" id="headingTwo">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                주문
            </button>
        </h2>
    </div>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
         data-bs-parent="#accordionExample" style="margin-left: 10px">
        <div class="accordion-body" style="margin-right: 3px;border-left-style: solid;border-left-width: 3px  ">
            <div>
                <br>
                <button onclick="location.href='${orderList}'" class="accordion-button">주문관리</button>
            </div>
            <div>
                <button onclick="location.href='${orderLink}'" class="accordion-button">주문작성</button>
            </div>
            <sec:authentication property="authorities" var="authorities"/>
            <c:if test="${authorities eq '[팀장]'}">
                <div>
                    <button onclick="location.href='${orderLink}'" class="accordion-button">승인관리</button>
                </div>
            </c:if>
            <div>
                <button onclick="location.href='${adminList}'" class="accordion-button">adminList</button>
            </div>
        </div>
    </div>
    <br>
    <button onclick="location.href='${reportLink}'" class="accordion-button" type="button">리포트</button>

</div>

<div class="flex-shrink-0 p-3 navbg row" id="sideBar" style="width: 280px; height: 100%;position: fixed">

    <div>

        <a href="${reportLink}" class=" navbg d-flex align-items-center pb-3 mb-3 text-decoration-none border-bottom">
            <span class="navbg fs-5 fw-semibold">SharedFive</span>
        </a>
        <ul class="list-unstyled ps-0 navbg">
            <li class="mb-1 main-nav navbg">
                <button class="btn btn-toggle d-inline-flex align-items-center border-0 collapsed"
                        data-bs-toggle="collapse"
                        data-bs-target="#dashboard-collapse" aria-expanded="false">
                    마스터
                </button>
                <div class="collapse navbg " id="dashboard-collapse">
                    <ul class="btn-toggle-nav pb-1 small navbg">
                        <li><a href="${itemList}" class="navbg d-inline-flex text-decoration-none rounded">제품 등록 관리</a>
                        </li>
                        <li><a href="${buyerList}" class="navbg d-inline-flex text-decoration-none rounded">바이어 등록
                            관리</a>
                        </li>
                        <li><a href="${priceList}" class="navbg d-inline-flex text-decoration-none rounded">판매가 등록
                            관리</a>
                        </li>
                        <sec:authentication property="authorities" var="authorities"/>
                        <c:if test="${authorities eq '[팀장]'}">
                            <li><a href="${memberList}" class="navbg d-inline-flex text-decoration-none rounded">회원
                                관리</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </li>
            <li class="mb-1 main-nav navbg">
                <button class="btn btn-toggle d-inline-flex align-items-center border-0 collapsed"
                        data-bs-toggle="collapse"
                        data-bs-target="#orders-collapse" aria-expanded="false">
                    주문
                </button>
                <div class="collapse navbg" id="orders-collapse">
                    <ul class="navbg btn-toggle-nav  pb-1 small">
                        <li><a href="${orderList}" class="navbg d-inline-flex text-decoration-none rounded">주문관리</a>
                        </li>
                        <li><a href="${orderLink}" class="navbg d-inline-flex text-decoration-none rounded">주문작성</a>
                        </li>
                        <sec:authentication property="authorities" var="authorities"/>
                        <c:if test="${authorities eq '[팀장]'}">
                            <li><a href="#" class="navbg d-inline-flex text-decoration-none rounded">승인관리</a></li>
                        </c:if>
                        <li><a href="${adminList}" class="navbg d-inline-flex text-decoration-none rounded">adminList</a>
                    </ul>
                </div>
            </li>
            <li class="mb-1 main-nav">
                <a href="${reportLink}" class="btn btn-toggle d-inline-flex align-items-center border-0">리포트</a>
            </li>
        </ul>
    </div>

    <div style="margin-bottom: 30px" class="col tm-mb-65 align-self-end">
        <div>
            <sec:authentication property="name" var="username"/>
            <p style="color:white; margin-bottom: 0px; margin-top: 30px">
                <i class="fa-regular fa-face-grin-wide"></i>
                ${username}님
            </p>
            <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                <div style="width: auto">
                    <c:url value="/member/modify" var="modifyLink">
                        <c:param value="${username}" name="m_member_email"/>
                    </c:url>
                    <a href="${modifyLink}" style="color: white">
                        정보수정
                    </a>
                    <c:url value="/logout" var="logoutLink"></c:url>
                    <a style="color: white" href="${logoutLink}">로그아웃</a>
                </div>
            </div>
        </div>
    </div>
</div>

<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
<script>
    // Get the button:
    let mybutton = document.getElementById("myBtn");

    // When the user scrolls down 20px from the top of the document, show the button
    window.onscroll = function () {
        scrollFunction()
    };

    function hiddenFunction() {
        if (document.body.scrollLeft > 1300 || document.documentElement.scrollTop > 1300) {
            mybutton.style.display = "block";
        } else {
            mybutton.style.display = "none";
        }
    }

    function scrollFunction() {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            mybutton.style.display = "block";
        } else {
            mybutton.style.display = "none";
        }
    }

    // When the user clicks on the button, scroll to the top of the document
    function topFunction() {
        document.body.scrollTop = 0; // For Safari
        document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
    }

</script>