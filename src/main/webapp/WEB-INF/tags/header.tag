<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/buyer/list" var="buyerList"></c:url>
<c:url value="/item/list" var="itemList"></c:url>
<c:url value="/price/list" var="priceList"></c:url>
<c:url value="/order/register" var="orderLink"></c:url>
<c:url value="/order/list" var="orderList"></c:url>
<c:url value="/report/orderReport" var="reportLink"></c:url>
<style>
    a{
        color: white;
    }
    .btn
    {
        color:#fff;
    }
    body {
        min-height: 100vh;
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
        background-color: transparent;
        color: white;
        width:248px;
    }
    .btn-toggle:hover{
        color:black;
        background-color: white;

    }

    .btn-toggle-nav{
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


</style>

<link rel="stylesheet"
      href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<div class="flex-shrink-0 p-3 bg-dark" style="width: 280px; height: 100%;">
    <a href="${reportLink}" class="d-flex align-items-center pb-3 mb-3 text-decoration-none border-bottom">
        <span class="fs-5 fw-semibold">로고</span>
    </a>
    <ul class="list-unstyled ps-0">
        <li class="mb-1 main-nav">
            <button class="btn btn-toggle d-inline-flex align-items-center border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
                마스터
            </button>
            <div class="collapse" id="dashboard-collapse">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <li><a href="${itemList}" class=" d-inline-flex text-decoration-none rounded">제품 등록 관리</a></li>
                    <li><a href="${buyerList}" class=" d-inline-flex text-decoration-none rounded">바이어 등록 관리</a></li>
                    <li><a href="${priceList}" class=" d-inline-flex text-decoration-none rounded">판매가 등록 관리</a></li>
                    <li><a href="#" class=" d-inline-flex text-decoration-none rounded">회원 관리</a></li>
                </ul>
            </div>
        </li>
        <li class="mb-1 main-nav">
            <button class="btn btn-toggle d-inline-flex align-items-center border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
                오더
            </button>
            <div class="collapse" id="orders-collapse">
                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                    <li><a href="${orderLink}" class=" d-inline-flex text-decoration-none rounded">오더작성</a></li>
                    <li><a href="${orderList}" class=" d-inline-flex text-decoration-none rounded">오더관리</a></li>
                    <li><a href="#" class=" d-inline-flex text-decoration-none rounded">승인관리</a></li>
                </ul>
            </div>
        </li>
        <li class="mb-1 main-nav">
                <a href="${reportLink}" class="btn btn-toggle d-inline-flex align-items-center border-0"  >리포터</a>
        </li>
        <li class="border-top my-3"></li>

    </ul>
</div>