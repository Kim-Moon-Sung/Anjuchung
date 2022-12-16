<%@ page import="dao.FoodDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.FoodDTO" %>
<%@ page import="java.util.Enumeration" %>
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
    <link href="../resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="../resources/css/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/layout/topbar.jsp"/>

<jsp:include page="/WEB-INF/layout/navbar.jsp"/>

<%
    String searchFoodName = request.getParameter("searchFoodName");
    FoodDAO dao = FoodDAO.getInstance();
    ArrayList<FoodDTO> foodListByName = dao.getAllFoods();

    if(searchFoodName != null) {
        foodListByName = dao.findFoodByName(searchFoodName);
    }
%>

<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">"<%=searchFoodName%>"가 포함된 안주 전체보기</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="home.do">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">"<%=searchFoodName%>" 안주 전체보기</p>
        </div>
    </div>
</div>
<!-- Page Header End -->

<div class="container-fluid pt-5">
    <div class="row px-xl-5 pb-3">
        <%
            for(int i=0; i< foodListByName.size(); i++) {
                FoodDTO food = foodListByName.get(i);
        %>
        <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
            <div class="card product-item border-0 mb-4">
                <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
                    <a href="foodDetail.do?id=<%=food.getFoodId()%>" class="cat-img position-relative overflow-hidden mb-3">
                        <img class="img-fluid w-100" src="resources/img/<%=food.getImage()%>" alt="">
                    </a>
                </div>
                <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                    <h6 class="text-truncate mb-3"><%=food.getFname()%></h6>
                    <div class="d-flex justify-content-center">
                        <h6><%=food.getPrice()%> 원</h6>
                    </div>
                </div>
                <div class="card-footer d-flex justify-content-between bg-light border">
                    <a href="foodDetail.do?id=<%=food.getFoodId()%>" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                    <form class="figure" name="addCartForm" action="addCart.do?id=<%=food.getFoodId()%>" method="post">
                        <input type="hidden" value="<%=food.getFoodId()%>">
                        <button class="btn btn-sm text-dark p-0" onclick="addToCart()"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</button>
                    </form>
                </div>
            </div>
        </div>
        <%}%>
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
