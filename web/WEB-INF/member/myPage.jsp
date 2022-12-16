<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>안주충</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="./resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="./resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="./resources/css/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/layout/topbar.jsp"/>

<jsp:include page="/WEB-INF/layout/navbar.jsp"/>

<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">마이페이지</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="home.do">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">My Page</p>
        </div>
    </div>
</div>
<!-- Page Header End -->

<div class="container-fluid pt-5">
    <div class="px-xl-5">
        <div class="col-6 mb-5" style="margin: 0 auto;">
            <div class="card border-secondary mb-5">
                <div class="card-body" style="padding-bottom: 0;">
                    <c:if test="${loginMember != null}">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">아이디</h6>
                            <h6 class="font-weight-medium">${loginMember.memberId}</h6>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">이름</h6>
                            <h6 class="font-weight-medium">${loginMember.name}</h6>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">핸드폰</h6>
                            <h6 class="font-weight-medium">${loginMember.phone}</h6>
                        </div>
                        <hr>
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">주소</h6>
                            <h6 class="font-weight-medium">${loginMember.address}</h6>
                        </div>
                    </c:if>
                </div>
                <div class="card-footer border-secondary bg-transparent">
                    <div class="row text-center">
                        <div class="col-md-4">
                            <a href="likeFood.do" class="btn btn-primary py-2 px-3 form-control"><i class="fas fa-heart mr-1"></i>찜목록</a>
                        </div>
                        <div class="col-md-4">
                            <a href="cart.do" class="btn btn-primary py-2 px-3 form-control"><i class="fa fa-shopping-cart mr-1"></i>장바구니</a>
                        </div>
                        <div class="col-md-4">
                            <a href="reviewList.do?searchField=reviewWriterId&searchWord=${loginMember.memberId}" class="btn btn-primary py-2 px-3 form-control"><i class="fa fa-shopping-cart mr-1"></i>작성한 글</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/layout/footer.jsp"/>
<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="./resources/lib/easing/easing.min.js"></script>
<script src="./resources/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="./resources/mail/jqBootstrapValidation.min.js"></script>
<script src="./resources/mail/contact.js"></script>

<!-- Template Javascript -->
<script src="./resources/js/main.js"></script>

</body>
</html>
