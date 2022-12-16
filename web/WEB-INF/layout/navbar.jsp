<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value='<%=request.getParameter("language")%>'/>
<fmt:bundle basename="bundle.message">
<!-- Navbar Start -->
<div class="container-fluid">
    <div class="row border-top px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                <h6 class="m-0">Categories</h6>
                <i class="fa fa-angle-down text-dark"></i>
            </a>
            <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
                <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
                    <a href="categoryFoods.do" class="nav-item nav-link">전체보기</a>
                    <a href="categoryFoods.do?category=소주" class="nav-item nav-link">소주</a>
                    <a href="categoryFoods.do?category=맥주" class="nav-item nav-link">맥주</a>
                    <a href="categoryFoods.do?category=사케" class="nav-item nav-link">사케</a>
                    <a href="categoryFoods.do?category=전통주" class="nav-item nav-link">전통주</a>
                    <a href="categoryFoods.do?category=양주" class="nav-item nav-link">양주</a>
                    <a href="categoryFoods.do?category=와인" class="nav-item nav-link">와인</a>
                </div>
            </nav>
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                <a href="home.do" class="text-decoration-none d-block d-lg-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>안주충</h1>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a href="home.do" class="nav-item nav-link">Home</a>
                        <a href="categoryFoods.do" class="nav-item nav-link active">Shop</a>
                        <a href="reviewList.do" class="nav-item nav-link">Review</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages</a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a href="likeFood.do" class="dropdown-item">Wish List</a>
                                <a href="cart.do" class="dropdown-item">Shopping Cart</a>
                            </div>
                        </div>
                    </div>
                    <c:choose>
                        <c:when test="${loginMember == null}">
                            <div class="navbar-nav ml-auto py-0">
                                <a href="login.do" class="nav-item nav-link">Login</a>
                                <a href="join.do" class="nav-item nav-link">Join</a>
                            </div>
                        </c:when>
                        <c:when test="${(loginMember != null) && (isAdmin == true)}">
                            <div class="navbar-nav ml-auto py-0">
                                <a href="addFood.do" class="nav-item nav-link">상품 등록하기</a>
                                <a href="allFood.do" class="nav-item nav-link">상품 전체보기</a>
                                <a href="logout.do" class="nav-item nav-link">Logout</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="navbar-nav ml-auto py-0">
                                <a href="myPage.do" class="nav-item nav-link">My Page</a>
                                <a href="logout.do" class="nav-item nav-link">Logout</a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </nav>
        </div>
    </div>
</div>
</fmt:bundle>
<!-- Navbar End -->