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
    <link href="resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="resources/css/style.css" rel="stylesheet">
</head>

<body>
<jsp:include page="/WEB-INF/layout/topbar.jsp"/>

<jsp:include page="/WEB-INF/layout/navbar.jsp"/>

<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">상품 등록</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="home.do">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Add Food</p>
        </div>
    </div>
</div>
<!-- Page Header End -->


<!-- Contact Start -->
<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">상품 정보</span></h2>
    </div>
    <div class="px-xl-5">
        <div class="col-5 mb-5" style="margin: 0 auto;">
            <div class="contact-form">
                <div class="success"></div>
                <form name="addFoodForm" novalidate="novalidate" action="addFood.do" method="post" enctype="multipart/form-data">
                    <div class="control-group">
                        <input type="text" class="form-control" name="foodId" placeholder="등록 음식 아이디" required="required" data-validation-required-message="음식 아이디를 입력해주세요.">
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <input type="text" class="form-control" name="fname" placeholder="등록 음식 이름" required="required" data-validation-required-message="음식 이름을 입력해주세요.">
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <input type="text" class="form-control" name="price" placeholder="등록 음식 가격" required="required" data-validation-required-message="음식 가격을 입력해주세요.">
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <input type="text" class="form-control" name="stock" placeholder="등록 음식 재고수" required="required" data-validation-required-message="음식 재고 수를 입력해주세요.">
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <select class="form-control" name="category" required="required" data-validation-required-message="음식 카테고리를 선택해주세요.">
                            <option value="소주">소주</option>
                            <option value="맥주">맥주</option>
                            <option value="사케">사케</option>
                            <option value="전통주">전통주</option>
                            <option value="양주">양주</option>
                            <option value="와인">와인</option>
                        </select>
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <textarea class="form-control" rows="6" name="detail" placeholder="등록 음식 설명 입력"
                                  required="required" data-validation-required-message="등록할 음식의 설명을 입력해주세요."></textarea>
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <input type="file" class="form-control" name="image" placeholder="등록 음식 이미지" required="required" data-validation-required-message="음식 이미지를 선택해주세요.">
                        <p class="help-block text-danger"></p>
                    </div>

                    <div class="control-group">
                        <div class="row text-center">
                            <div class="col-md-6 pb-4">
                                <button class="btn btn-primary py-2 px-4 form-control" type="submit">상품등록</button>
                            </div>
                            <div class="col-md-6 pb-4">
                                <a href="home.do" class="btn btn-primary py-2 px-4 form-control">취소하기</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Contact End -->

<jsp:include page="/WEB-INF/layout/footer.jsp"/>

<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="resources/lib/easing/easing.min.js"></script>
<script src="resources/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="resources/mail/jqBootstrapValidation.min.js"></script>
<script src="resources/mail/contact.js"></script>

<!-- Template Javascript -->
<script src="resources/js/main.js"></script>
</body>

</html>