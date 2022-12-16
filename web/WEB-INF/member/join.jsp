<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <h1 class="font-weight-semi-bold text-uppercase mb-3">가입하기</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="index.jsp">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Join</p>
        </div>
    </div>
</div>
<!-- Page Header End -->

<!-- Contact Start -->
<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">회원 가입</span></h2>
    </div>
    <div class="px-xl-5">
        <div class="col-5 mb-5" style="margin: 0 auto;">
            <div class="contact-form">
                <div class="success"></div>
                <form novalidate="novalidate" action="join.do" method="post">
                    <div class="control-group">
                        <input type="text" class="form-control" name="name" placeholder="이름" required="required" data-validation-required-message="이름을 입력해주세요.">
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <input type="text" class="form-control" name="memberId" placeholder="아이디" required="required" data-validation-required-message="아이디을 입력해주세요.">
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <input type="password" class="form-control" name="password" placeholder="비밀번호" required="required" data-validation-required-message="비밀번호를 입력해주세요.">
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <input type="text" class="form-control" name="phone" placeholder="전화번호(000-0000-0000)" required="required" data-validation-required-message="전화번호를 입력해주세요.">
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <input type="text" class="form-control" name="email" placeholder="이메일 주소" required="required" data-validation-required-message="이메일을 입력해주세요.">
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <input type="text" class="form-control" name="address" placeholder="주소" required="required" data-validation-required-message="주소 입력해주세요.">
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <div class="row text-center">
                            <div class="col-md-6 pb-4">
                                <a href="login.do" class="btn btn-primary py-2 px-4 form-control">로그인</a>
                            </div>
                            <div class="col-md-6 pb-4">
                                <button class="btn btn-primary py-2 px-4 form-control" type="submit">가입신청</button>
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