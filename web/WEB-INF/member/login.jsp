<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<fmt:setLocale value='<%=request.getParameter("language")%>'/>
<fmt:bundle basename="bundle.message">
<c:if test="${loginResult == -1 || loginResult == 0}">
    <script>
        alert("아이디 또는 비밀번호가 틀렸습니다.");
    </script>
</c:if>

<jsp:include page="/WEB-INF/layout/topbar.jsp"/>

<jsp:include page="/WEB-INF/layout/navbar.jsp"/>

<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
<%--        <h1 class="font-weight-semi-bold text-uppercase mb-3">로그인</h1>--%>
        <h1 class="font-weight-semi-bold text-uppercase mb-3"><fmt:message key="login"/></h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="home.do"><fmt:message key="home"/></a></p>
<%--            <p class="m-0"><a href="home.do">Home</a></p>--%>
            <p class="m-0 px-2">-</p>
<%--            <p class="m-0">Login</p>--%>
            <p class="m-0"><fmt:message key="login"/> </p>
        </div>
    </div>
</div>
<!-- Page Header End -->


<!-- Contact Start -->
<div class="container-fluid pt-5">
    <div class="text-center mb-4">
<%--        <h2 class="section-title px-5"><span class="px-2">계정 정보</span></h2>--%>
        <h2 class="section-title px-5"><span class="px-2"><fmt:message key="accountInfo"/></span></h2>
    </div>
    <div class="px-xl-5">
        <div class="col-5 mb-5" style="margin: 0 auto;">
            <div class="contact-form">
                <div class="success"></div>
                <form name="loginForm" novalidate="novalidate" action="login.do" method="post">
                    <div class="control-group">
                        <input type="text" class="form-control" name="memberId" placeholder="이메일 주소 또는 아이디" required="required" data-validation-required-message="아이디 또는 이메일 입력해주세요.">
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <input type="password" class="form-control" name="password" placeholder="비밀번호" required="required" data-validation-required-message="비밀번호를 입력해주세요.">
                        <p class="help-block text-danger"></p>
                    </div>
                    <div class="control-group">
                        <div class="row text-center">
                            <div class="col-md-6 pb-4">
<%--                                <button class="btn btn-primary py-2 px-4 form-control" type="submit">로그인</button>--%>
                                <button class="btn btn-primary py-2 px-4 form-control" type="submit"><fmt:message key="login"/> </button>
                            </div>
                            <div class="col-md-6 pb-4">
<%--                                <a href="join.do" class="btn btn-primary py-2 px-4 form-control">가입하기</a>--%>
                                <a href="join.do" class="btn btn-primary py-2 px-4 form-control"><fmt:message key="join"/> </a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</fmt:bundle>

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