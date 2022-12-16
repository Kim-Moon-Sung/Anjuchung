<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.FoodDTO" %>
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
    function deleteFoodOnCart() {
      if(confirm("장바구니에서 해당 상품을 삭제하시겠습니까?")) {
        document.deleteFoodOnCartForm.submit();
      } else {
        return;
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
    <h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
    <div class="d-inline-flex">
      <p class="m-0"><a href="home.do">Home</a></p>
      <p class="m-0 px-2">-</p>
      <p class="m-0">Shopping Cart</p>
    </div>
  </div>
</div>
<!-- Page Header End -->

<!-- Cart Start -->
<div class="container-fluid pt-5">
  <div class="row px-xl-5">
    <div class="col-lg-8 table-responsive mb-5">
      <table class="table table-bordered text-center mb-0">
        <thead class="bg-secondary text-dark">
        <tr>
          <th>Products</th>
          <th>Price</th>
          <th>Quantity</th>
          <th>Total</th>
          <th>Remove</th>
        </tr>
        </thead>
        <tbody class="align-middle">
        <%
          int total = 0;
          String cartId = session.getId();
          ArrayList<FoodDTO> cartList = (ArrayList<FoodDTO>)session.getAttribute("cartList");
          if(cartList == null) {
            cartList = new ArrayList<FoodDTO>();
          }
          for(int i =0; i<cartList.size(); i++) {
            FoodDTO cartItem = cartList.get(i);
        %>
        <tr>
          <td class="align-middle"><%=cartItem.getFname()%></td>
          <td class="align-middle"><%=cartItem.getPrice()%></td>
          <td class="align-middle">
            <div class="input-group quantity mx-auto" style="width: 100px;">
              <div class="input-group-btn">
                <button class="btn btn-sm btn-primary btn-minus" >
                  <i class="fa fa-minus"></i>
                </button>
              </div>
              <input type="text" class="form-control form-control-sm bg-secondary text-center" value="<%=cartItem.getQuantity()%>">
              <div class="input-group-btn">
                <button class="btn btn-sm btn-primary btn-plus">
                  <i class="fa fa-plus"></i>
                </button>
              </div>
            </div>
          </td>
          <% total += cartItem.getPrice() * cartItem.getQuantity(); %>
          <td class="align-middle"><%=cartItem.getPrice() * cartItem.getQuantity()%> 원</td>
          <td class="align-middle">
            <form name="deleteFoodOnCartForm" action="deleteCart.do" method="post">
              <input type="hidden" name="delCartFoodId" value="<%=cartItem.getFoodId()%>">
              <button class="btn btn-sm btn-primary" onclick="deleteFoodOnCart()"><i class="fa fa-times"></i></button>
            </form>
          </td>
        </tr>
        <%}%>
        </tbody>
      </table>
    </div>
    <div class="col-lg-4">
      <form class="mb-5" action="">
        <div class="input-group">
          <input type="text" class="form-control p-4" placeholder="Coupon Code">
          <div class="input-group-append">
            <button class="btn btn-primary">Apply Coupon</button>
          </div>
        </div>
      </form>
      <div class="card border-secondary mb-5">
        <div class="card-header bg-secondary border-0">
          <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
        </div>
        <div class="card-body">
          <div class="d-flex justify-content-between mb-3 pt-1">
            <h6 class="font-weight-medium">Subtotal</h6>
            <h6 class="font-weight-medium"><%=total%> 원</h6>
          </div>
          <div class="d-flex justify-content-between">
            <h6 class="font-weight-medium">Shipping</h6>
            <h6 class="font-weight-medium">3000 원</h6>
          </div>
        </div>
        <div class="card-footer border-secondary bg-transparent">
          <div class="d-flex justify-content-between mt-2">
            <h5 class="font-weight-bold">Total</h5>
            <h5 class="font-weight-bold"><%=total+3000%> 원</h5>
          </div>
          <form class="figure" name="shippingForm" action="shippingInfo.do" method="get">
            <input type="hidden" value="cartId">
            <button class="btn btn-block btn-primary my-3 py-3">Proceed To Checkout</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Cart End -->

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