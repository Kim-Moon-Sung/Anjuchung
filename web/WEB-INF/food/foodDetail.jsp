<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.ReviewDTO" %>
<%@ page import="dto.FoodDTO" %>
<%@ page import="dao.FoodDAO" %>
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
    <script type="text/javascript">
        function addToCart() {
            if(confirm("상품을 장바구니에 추가하시겠습니까?")) {
                document.addCartForm.submit();
            } else {
                document.addCartForm.reset();
            }
        }

        function addToLike() {
            if(confirm("상품을 찜 목록에 추가하시겠습니끼?")) {
                document.addLikeForm.submit();
            } else {
                document.addLikeForm.reset();
            }
        }
    </script>
</head>

<body>
<jsp:include page="/WEB-INF/layout/topbar.jsp"/>

<jsp:include page="/WEB-INF/layout/navbar.jsp"/>

<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">Food Detail</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="home.do">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Food Detail</p>
        </div>
    </div>
</div>
<!-- Page Header End -->
<%
    ArrayList<ReviewDTO> reviewList = (ArrayList<ReviewDTO>)session.getAttribute("reviewList");
%>
<!-- Shop Detail Start -->
<div class="container-fluid py-5">
    <c:if test="${food != null}">
        <div class="row px-xl-5">
            <div class="col-lg-5 pb-5">
                <div>
                    <div class="border">
                        <div>
                            <img class="w-100 h-100" src="./resources/img/${food.image}" alt="Image">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-7 pb-5">
                <h3 class="font-weight-semi-bold">${food.fname}</h3>
                <div class="d-flex mb-3">
                    <div class="text-primary mr-2">
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star"></small>
                        <small class="fas fa-star-half-alt"></small>
                        <small class="far fa-star"></small>
                    </div>
                    <small class="pt-1">(<%=reviewList.size()%> Reviews)</small>
                </div>
                <h3 class="font-weight-semi-bold mb-4">${food.price}</h3>
                <p class="mb-4">${food.detail}</p>
                <div class="d-flex mb-4">
                    <p class="text-dark font-weight-medium mb-0 mr-3">Category:</p>
                    <p for="color-1">${food.category}</p>
                </div>
                <div class="align-items-center mb-4 pt-2">
                    <div class="custom-control-inline quantity" style="width: 130px;">
                        <div class="input-group-btn">
                            <button class="btn btn-primary btn-minus"><i class="fa fa-minus"></i></button>
                        </div>
                        <input type="text" class="form-control bg-secondary text-center" value="1">
                        <div class="input-group-btn">
                            <button class="btn btn-primary btn-plus"><i class="fa fa-plus"></i></button>
                        </div>
                    </div>
                    <form class="figure" name="addCartForm" action="addCart.do?id=${food.foodId}" method="post">
                        <input type="hidden" id="addQuantity" name="addQuantity" value="1">
                        <button class="btn btn-primary px-3" onclick="addToCart()"><i class="fa fa-shopping-cart mr-1"></i> Add To Cart </button>
                    </form>
                    <form class="figure" name="addLikeForm" action="addLikeFood.do?id=${food.foodId}" method="post">
                        <button class="btn btn-primary px-3" onclick="addToLike()"><i class="fas fa-heart"></i> Add To Like </button>
                    </form>
                </div>
                <div class="d-flex pt-2">
                    <p class="text-dark font-weight-medium mb-0 mr-2">Share on:</p>
                    <div class="d-inline-flex">
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        <a class="text-dark px-2" href="">
                            <i class="fab fa-pinterest"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
<%--    </c:if>--%>
<%--    <%--%>
<%--        ArrayList<ReviewDTO> reviewList = (ArrayList<ReviewDTO>)session.getAttribute("reviewList");--%>
<%--    %>--%>
    <div class="row px-xl-5">
        <div class="col">
            <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Description</a>
                <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">Reviews (<%=reviewList.size()%>)</a>
            </div>
            <div class="tab-content">
                <div class="tab-pane fade show active" id="tab-pane-1">
                    <h4 class="mb-3">Product Description</h4>
                    <p>${food.detail}</p>
                </div>
                <div class="tab-pane fade" id="tab-pane-2">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <h4 class="mb-4"><%=reviewList.size()%> review for "${food.fname}"</h4>
                            <%
                                for(int i=0; i< reviewList.size(); i++) {
                                    ReviewDTO review = reviewList.get(i);
                            %>
                            <div class="media mb-4">
                                <div class="media-body">
                                    <h6><%=review.getReviewWriterId()%><small> - <i><%=review.getPostDate()%>></i></small></h6>
                                    <p><%=review.getReviewContent()%></p>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </c:if>
</div>
<!-- Shop Detail End -->

<!-- Products Start -->
<div class="container-fluid py-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">You May Also Like</span></h2>
    </div>
    <div class="row px-xl-5">
        <div class="col">
            <div class="owl-carousel related-carousel">
                <%
                    FoodDAO dao = FoodDAO.getInstance();
                    String foodId = request.getParameter("id");
                    FoodDTO foodById = dao.findFoodById(foodId);
                    ArrayList<FoodDTO> sameCategoryFoods = dao.findFoodsByCategory(foodById.getCategory());
                    for(int i=0; i<sameCategoryFoods.size(); i=i+2) {
                        FoodDTO food = sameCategoryFoods.get(i);
                %>
                <div class="card product-item border-0">
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
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
                        <a href="" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </div>
</div>
<!-- Products End -->

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
<script src="./resources/js/main.js?ver=1"></script>
</body>

</html>
