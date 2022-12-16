<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Navbar Start -->
<div class="container-fluid mb-5">
    <div class="row border-top px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                <h6 class="m-0">Categories</h6>
                <i class="fa fa-angle-down text-dark"></i>
            </a>
            <nav class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical">
                <div class="navbar-nav w-100 overflow-hidden">
                    <a href="categoryFoods.do" class="nav-item nav-link">전체보기</a>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link" data-toggle="dropdown">소주<i class="fa fa-angle-down float-right mt-1"></i></a>
                        <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                            <a href="categoryFoods.do?category=소주" class="dropdown-item">소주 전체보기</a>
                            <a href="categoryFoods.do?category=소주" class="dropdown-item">증류식 소주</a>
                            <a href="categoryFoods.do?category=소주" class="dropdown-item">희석식 소주</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link" data-toggle="dropdown">맥주<i class="fa fa-angle-down float-right mt-1"></i></a>
                        <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                            <a href="categoryFoods.do?category=맥주" class="dropdown-item">맥주 전체보기</a>
                            <a href="categoryFoods.do?category=맥주" class="dropdown-item">편의점 맥주</a>
                            <a href="categoryFoods.do?category=맥주" class="dropdown-item">랑비크</a>
                            <a href="categoryFoods.do?category=맥주" class="dropdown-item">에일</a>
                            <a href="categoryFoods.do?category=맥주" class="dropdown-item">라거</a>
                            <a href="categoryFoods.do?category=맥주" class="dropdown-item">무알콜 맥주</a>
                            <a href="categoryFoods.do?category=맥주" class="dropdown-item">과일 맥주</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link" data-toggle="dropdown">사케<i class="fa fa-angle-down float-right mt-1"></i></a>
                        <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                            <a href="categoryFoods.do?category=사케" class="dropdown-item">사케 전체보기</a>
                            <a href="categoryFoods.do?category=사케" class="dropdown-item">니혼슈</a>
                            <a href="categoryFoods.do?category=사케" class="dropdown-item">쇼추</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link" data-toggle="dropdown">전통주<i class="fa fa-angle-down float-right mt-1"></i></a>
                        <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                            <a href="categoryFoods.do?category=양조주" class="dropdown-item">양조주 전체보기</a>
                            <a href="categoryFoods.do?category=양조주" class="dropdown-item">청주</a>
                            <a href="categoryFoods.do?category=양조주" class="dropdown-item">탁주</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link" data-toggle="dropdown">양주<i class="fa fa-angle-down float-right mt-1"></i></a>
                        <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                            <a href="categoryFoods.do?category=양주" class="dropdown-item">양주 전체보기</a>
                            <a href="categoryFoods.do?category=양주" class="dropdown-item">위스키</a>
                            <a href="categoryFoods.do?category=양주" class="dropdown-item">브랜디</a>
                            <a href="categoryFoods.do?category=양주" class="dropdown-item">럼주</a>
                            <a href="categoryFoods.do?category=양주" class="dropdown-item">보드카</a>
                            <a href="categoryFoods.do?category=양주" class="dropdown-item">진</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link" data-toggle="dropdown">와인<i class="fa fa-angle-down float-right mt-1"></i></a>
                        <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                            <a href="categoryFoods.do?category=와인" class="dropdown-item">와인 전체보기</a>
                            <a href="categoryFoods.do?category=와인" class="dropdown-item">레드 와인</a>
                            <a href="categoryFoods.do?category=와인" class="dropdown-item">화이트 와인</a>
                            <a href="categoryFoods.do?category=와인" class="dropdown-item">스파클링 와인</a>
                        </div>
                    </div>
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
                        <a href="home.do" class="nav-item nav-link active">Home</a>
                        <a href="categoryFoods.do" class="nav-item nav-link">Shop</a>
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
            <div id="header-carousel" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active" style="height: 410px;">
                        <img class="img-fluid" src="./resources/img/carousel-1.png" alt="Image">
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 700px;">
                                <h4 class="text-light text-uppercase font-weight-medium mb-3">Cheers All night</h4>
                                <h3 class="display-4 text-white font-weight-semi-bold mb-4">Party with friends</h3>
                                <a href="" class="btn btn-light py-2 px-3">Shop Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item" style="height: 410px;">
                        <img class="img-fluid" src="./resources/img/carousel-2.png" alt="Image">
                        <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                            <div class="p-3" style="max-width: 700px;">
                                <h4 class="text-light text-uppercase font-weight-medium mb-3">Drinking with</h4>
                                <h3 class="display-4 text-white font-weight-semi-bold mb-4">Your loved one</h3>
                                <a href="" class="btn btn-light py-2 px-3">Shop Now</a>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                    <div class="btn btn-dark" style="width: 45px; height: 45px;">
                        <span class="carousel-control-prev-icon mb-n2"></span>
                    </div>
                </a>
                <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                    <div class="btn btn-dark" style="width: 45px; height: 45px;">
                        <span class="carousel-control-next-icon mb-n2"></span>
                    </div>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- Navbar End -->