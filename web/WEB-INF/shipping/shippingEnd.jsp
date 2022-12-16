<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
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
    <link href="resources/css/style.css?ver=1" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/layout/topbar.jsp"/>

<jsp:include page="/WEB-INF/layout/navbar.jsp"/>

<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">주문 완료</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="home.do">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Thanks For Order</p>
        </div>
    </div>
</div>
<!-- Page Header End -->

<%
    request.setCharacterEncoding("utf-8");
    Cookie[] cookies = request.getCookies();
    String shipping_cartId = "";
    String shipping_name = "";
    String shipping_date = "";
    String shipping_country = "";
    String shipping_zipCode = "";
    String shipping_address = "";

    if(cookies != null) {
        for(int i=0; i<cookies.length; i++) {
            Cookie cookie = cookies[i];
            String cookieName = cookie.getName();

            if(cookieName.equals("Shipping_cartId")) {
                shipping_cartId = URLDecoder.decode(cookie.getValue(), "utf-8");
            }
            if(cookieName.equals("Shipping_date")) {
                shipping_date = URLDecoder.decode(cookie.getValue(), "utf-8");
            }
        }
    }
%>

<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">주문 해주셔서 감사합니다.</span></h2>
    </div>
    <div class="px-xl-5">
        <div class="col-6 mb-5" style="margin: 0 auto;">
            <div class="card border-secondary mb-5">
                <div class="card-body" style="padding-bottom: 0;">
                    <div class="d-flex justify-content-between mb-3 pt-1">
                        <h6 class="font-weight-medium">주문번호</h6>
                        <h6 class="font-weight-medium"><%=shipping_cartId%></h6>
                    </div>
                    <div class="d-flex justify-content-between mb-3 pt-1">
                        <h6 class="font-weight-medium">주문일자</h6>
                        <h6 class="font-weight-medium"><%=shipping_date%></h6>
                    </div>
                </div>
            </div>
            <div class="card-footer border-secondary bg-transparent">
                <div class="text-center">
                    <div class="col-md-4" style="margin: 0 auto;">
                        <a href="home.do" class="btn btn-primary py-2 px-3 form-control">메인으로</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%
    for(int i=0; i<cookies.length; i++) {
        Cookie cookie = cookies[i];
        String cookieName = cookie.getName();

        if(cookieName.equals("Shipping_cartId")) {
            cookie.setMaxAge(0);
        }

        if(cookieName.equals("Shipping_name")) {
            cookie.setMaxAge(0);
        }

        if(cookieName.equals("Shipping_date")) {
            cookie.setMaxAge(0);
        }

        if(cookieName.equals("Shipping_country")) {
            cookie.setMaxAge(0);
        }

        if(cookieName.equals("Shipping_zipCode")) {
            cookie.setMaxAge(0);
        }

        if(cookieName.equals("Shipping_address")) {
            cookie.setMaxAge(0);
        }
        response.addCookie(cookie);
    }
    session.removeAttribute("cartList");
%>
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
