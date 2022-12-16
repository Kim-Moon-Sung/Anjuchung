<%@ page import="dao.FoodDAO" %>
<%@ page import="dto.FoodDTO" %>
<%@ page import="java.util.ArrayList" %>
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
  <link href="/resources/img/favicon.ico" rel="icon" type="image/x-icon" sizes="16x16">

  <!-- Google Web Fonts -->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">

  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

  <!-- Libraries Stylesheet -->
  <link href="../resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Customized Bootstrap Stylesheet -->
  <link href="../resources/css/style.css" rel="stylesheet">
  <script>
    function addToCart() {
      if(confirm("상품을 장바구니에 추가하시겠습니까?")) {
        document.addCartForm.submit();
      } else {
        document.addCartForm.reset();
      }
    }
  </script>
</head>

<body>

<jsp:include page="/WEB-INF/layout/topbar.jsp"/>

<jsp:include page="/WEB-INF/layout/welcome_navbar.jsp"/>

<!-- Featured Start -->
<div class="container-fluid pt-5">
  <div class="row px-xl-5 pb-3">
    <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
      <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
        <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
        <h5 class="font-weight-semi-bold m-0">안주 고르다 지쳐서</h5>
      </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
      <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
        <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
        <h5 class="font-weight-semi-bold m-0">안주충에 모았다</h5>
      </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
      <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
        <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
        <h5 class="font-weight-semi-bold m-0">리뷰가 없어서</h5>
      </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
      <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
        <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
        <h5 class="font-weight-semi-bold m-0">안주충에 모았다</h5>
      </div>
    </div>
  </div>
</div>
<!-- Featured End -->
<%
  FoodDAO dao = FoodDAO.getInstance();
  ArrayList<FoodDTO> sojuFoods = dao.findFoodsByCategory("소주");
  ArrayList<FoodDTO> beerFoods = dao.findFoodsByCategory("맥주");
  ArrayList<FoodDTO> sakeFoods = dao.findFoodsByCategory("사케");
  ArrayList<FoodDTO> makgeolliFoods = dao.findFoodsByCategory("전통주");
  ArrayList<FoodDTO> whiskiFoods = dao.findFoodsByCategory("양주");
  ArrayList<FoodDTO> wineFoods = dao.findFoodsByCategory("와인");
%>

<!-- Categories Start -->
<div class="container-fluid pt-5">
  <div class="text-center mb-4">
    <h2 class="section-title px-5"><span class="px-2">술 종류별 안주보기</span></h2>
  </div>
  <div class="row px-xl-5 pb-3">
    <div class="col-lg-4 col-md-6 pb-1">
      <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
        <p class="text-right"><%=sojuFoods.size()%> Products</p>
        <a href="categoryFoods.do?category=소주" class="cat-img position-relative overflow-hidden mb-3">
          <img class="img-fluid" src="../resources/img/alcohol/soju.jpg" alt="">
        </a>
        <h5 class="text-center font-weight-semi-bold m-0">소주 안주 보러가기</h5>
      </div>
    </div>
    <div class="col-lg-4 col-md-6 pb-1">
      <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
        <p class="text-right"><%=beerFoods.size()%> Products</p>
        <a href="categoryFoods.do?category=맥주" class="cat-img position-relative overflow-hidden mb-3">
          <img class="img-fluid" src="../resources/img/alcohol/beer.jpg" alt="">
        </a>
        <h5 class="text-center font-weight-semi-bold m-0">맥주 안주 보러가기</h5>
      </div>
    </div>
    <div class="col-lg-4 col-md-6 pb-1">
      <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
        <p class="text-right"><%=sakeFoods.size()%> Products</p>
        <a href="categoryFoods.do?category=사케" class="cat-img position-relative overflow-hidden mb-3">
          <img class="img-fluid" src="../resources/img/alcohol/sake.jpg" alt="">
        </a>
        <h5 class="text-center font-weight-semi-bold m-0">사케 안주 보러가기</h5>
      </div>
    </div>
    <div class="col-lg-4 col-md-6 pb-1">
      <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
        <p class="text-right"><%=makgeolliFoods.size()%> Products</p>
        <a href="categoryFoods.do?category=전통주" class="cat-img position-relative overflow-hidden mb-3">
          <img class="img-fluid" src="../resources/img/alcohol/makgeolli.jpg" alt="">
        </a>
        <h5 class="text-center font-weight-semi-bold m-0">전통주 안주 보러가기</h5>
      </div>
    </div>
    <div class="col-lg-4 col-md-6 pb-1">
      <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
        <p class="text-right"><%=whiskiFoods.size()%> Products</p>
        <a href="categoryFoods.do?category=양주" class="cat-img position-relative overflow-hidden mb-3">
          <img class="img-fluid" src="../resources/img/alcohol/whiski.jpg" alt="">
        </a>
        <h5 class="text-center font-weight-semi-bold m-0">양주 안주 보러가기</h5>
      </div>
    </div>
    <div class="col-lg-4 col-md-6 pb-1">
      <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
        <p class="text-right"><%=wineFoods.size()%> Products</p>
        <a href="categoryFoods.do?category=와인" class="cat-img position-relative overflow-hidden mb-3">
          <img class="img-fluid" src="../resources/img/alcohol/wine.jpg" alt="">
        </a>
        <h5 class="text-center font-weight-semi-bold m-0">와인 안주 보러가기</h5>
      </div>
    </div>
  </div>
</div>
<!-- Categories End -->

<!-- Products Start -->
<div class="container-fluid pt-5">
  <div class="text-center mb-4">
    <h2 class="section-title px-5"><span class="px-2">Trandy Foods</span></h2>
  </div>
  <div class="row px-xl-5 pb-3">
    <%
      ArrayList<FoodDTO> allFoodList = dao.getAllFoods();
      for(int i=0; i<27; i=i+3) {
        FoodDTO food = allFoodList.get(i);
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
<!-- Products End -->


<!-- Subscribe Start -->
<div class="container-fluid bg-secondary my-5">
  <div class="row justify-content-md-center py-5 px-xl-5">
    <div class="col-md-6 col-12 py-5">
      <div class="text-center mb-2 pb-2">
        <h2 class="section-title px-5 mb-3"><span class="bg-secondary px-2">빠른 검색</span></h2>
        <p>생각나는 안주가 없을 때 여기에 아무 글자나 적으면 비슷 이름을 가진 음식을 안주충에서 빠르게 찾아줍니다!</p>
      </div>
      <form action="searchFoodName.do" method="get">
        <div class="input-group">
          <input type="text" name="searchFoodName" class="form-control border-white p-4" placeholder="Enter Any Text">
          <div class="input-group-append">
            <button class="btn btn-primary px-4">검색</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- Subscribe End -->


<!-- Products Start -->
<div class="container-fluid pt-5">
  <div class="text-center mb-4">
    <h2 class="section-title px-5"><span class="px-2">Just Arrived</span></h2>
  </div>
  <div class="row px-xl-5 pb-3">
    <%
      for(int i=allFoodList.size()-1; i>0; i=i-6) {
        FoodDTO food = allFoodList.get(i);
    %>
    <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
      <div class="card product-item border-0 mb-4">
        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
          <img class="img-fluid w-100" src="resources/img/<%=food.getImage()%>" alt="">
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
<!-- Products End -->


<!-- Vendor Start -->
<div class="container-fluid py-5">
  <div class="row px-xl-5">
    <div class="col">
      <div class="owl-carousel vendor-carousel">
        <div class="vendor-item border p-4">
          <img src="../resources/img/vendor-1.jpg" alt="">
        </div>
        <div class="vendor-item border p-4">
          <img src="../resources/img/vendor-2.jpg" alt="">
        </div>
        <div class="vendor-item border p-4">
          <img src="../resources/img/vendor-3.jpg" alt="">
        </div>
        <div class="vendor-item border p-4">
          <img src="../resources/img/vendor-4.jpg" alt="">
        </div>
        <div class="vendor-item border p-4">
          <img src="../resources/img/vendor-5.jpg" alt="">
        </div>
        <div class="vendor-item border p-4">
          <img src="../resources/img/vendor-6.jpg" alt="">
        </div>
        <div class="vendor-item border p-4">
          <img src="../resources/img/vendor-7.jpg" alt="">
        </div>
        <div class="vendor-item border p-4">
          <img src="../resources/img/vendor-8.jpg" alt="">
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Vendor End -->

<jsp:include page="/WEB-INF/layout/footer.jsp"/>

<!-- Back to Top -->
<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="../resources/lib/easing/easing.min.js"></script>
<script src="../resources/lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Contact Javascript File -->
<script src="../resources/mail/jqBootstrapValidation.min.js"></script>
<script src="../resources/mail/contact.js"></script>

<!-- Template Javascript -->
<script src="../resources/js/main.js"></script>
</body>

</html>