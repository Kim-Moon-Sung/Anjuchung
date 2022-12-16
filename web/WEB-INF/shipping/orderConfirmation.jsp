<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.FoodDTO" %>
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
        <h1 class="font-weight-semi-bold text-uppercase mb-3">주문 정보</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="home.do">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Order Info</p>
        </div>
    </div>
</div>
<!-- Page Header End -->

<%
    request.setCharacterEncoding("utf-8");
    DecimalFormat dFormat = new DecimalFormat("###,###");

    String cartId = session.getId();

    String shipping_cartId = "";
    String shipping_name = "";
    String shipping_date = "";
    String shipping_country = "";
    String shipping_zipCode = "";
    String shipping_address = "";

    Cookie[] cookies = request.getCookies();

    if(cookies != null) {
        for(int i=0; i<cookies.length; i++) {
            Cookie cookie = cookies[i];
            String cookieName = cookie.getName();

            if(cookieName.equals("Shipping_cartId")) {
                shipping_cartId = URLDecoder.decode(cookie.getValue(), "utf-8");
            }

            if(cookieName.equals("Shipping_name")) {
                shipping_name = URLDecoder.decode(cookie.getValue(), "utf-8");
            }

            if(cookieName.equals("Shipping_date")) {
                shipping_date = URLDecoder.decode(cookie.getValue(), "utf-8");
            }

            if(cookieName.equals("Shipping_country")) {
                shipping_country = URLDecoder.decode(cookie.getValue(), "utf-8");
            }

            if(cookieName.equals("Shipping_zipCode")) {
                shipping_zipCode = URLDecoder.decode(cookie.getValue(), "utf-8");
            }

            if(cookieName.equals("Shipping_address")) {
                shipping_address = URLDecoder.decode(cookie.getValue(), "utf-8");
            }
        }
    }
%>

<div class="container-fluid pt-5">
    <div class="px-xl-5">
        <div class="col-9 mb-5" style="margin: 0 auto;">
            <div class="contact-form">
                <table name="writeForm" class="table">
                    <tr>
                        <td>번호</td>
                        <td><%=shipping_cartId%></td>
                        <td>성명</td>
                        <td><%=shipping_name%></td>
                    </tr>
                    <tr>
                        <td>배송일</td>
                        <td><%=shipping_date%></td>
                        <td>배송국가</td>
                        <td><%=shipping_country%></td>
                    </tr>
                    <tr>
                        <td>우편번호</td>
                        <td><%=shipping_zipCode%></td>
                        <td>주소</td>
                        <td><%=shipping_address%></td>
                    </tr>
                </table>
                <br>
                <br>
                <table name="writeForm" class="table">
                    <tr>
                        <th>상품명</th>
                        <th>수량</th>
                        <th>가격</th>
                        <th>합계</th>
                    </tr>
                    <%
                        int total = 0;
                        ArrayList<FoodDTO> cartList = (ArrayList<FoodDTO>) session.getAttribute("cartList");
                        for(int i=0; i<cartList.size(); i++) {
                            FoodDTO cartItem = cartList.get(i);
                            total += cartItem.getQuantity() * cartItem.getPrice();
                    %>
                    <tr>
                        <td><%=cartItem.getFname()%></td>
                        <td><%=cartItem.getQuantity()%></td>
                        <td><%=cartItem.getPrice()%> 원</td>
                        <td><%=cartItem.getPrice() * cartItem.getQuantity()%> 원</td>
                    </tr>
                    <%}%>
                    <tr>
                        <td></td>
                        <td></td>
                        <td><strong>총액</strong></td>
                        <td><strong><%=total%></strong></td>
                    </tr>
                </table>
                <div class="col-5" style="margin:0 auto;">
                    <div class="text-center align-items-center mb-4 pt-2">
                        <form class="figure" name="shippingEndForm" action="shippingEnd.do" method="post">
                            <input type="hidden" value="<%=cartId%>">
                            <button class="btn btn-primary px-3">주문완료</button>
                        </form>

                        <form class="figure" name="shippingEndForm" action="shippingEnd.do" method="get">
                            <input type="hidden" value="<%=cartId%>">
                            <button class="btn btn-primary px-3">주문취소</button>
                        </form>
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
