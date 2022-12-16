<%@ page import="java.util.ArrayList" %>
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
    <link href="resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="resources/css/style.css?ver=1" rel="stylesheet">
    <script type="text/javascript">
        function deleteFood() {
            if(confirm("장바구니에서 해당 상품을 삭제하시겠습니까?")) {
                document.deleteFoodForm.submit();
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
        <h1 class="font-weight-semi-bold text-uppercase mb-3">상품 목록</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="home.do">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">All Food</p>
        </div>
    </div>
</div>
<!-- Page Header End -->

<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">상품 목록</span></h2>
    </div>
    <div class="px-xl-5">
        <div class="col-9 mb-5" style="margin: 0 auto;">
            <div class="contact-form">
                <table class="table">
                    <thead align="center">
                    <tr>
                        <th>번호</th>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>가격</th>
                        <th>분류</th>
                        <th>재고 수</th>
                        <th>이미지 경로</th>
                        <th></th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <%! int count = 1; %>
                    <%
//                        ArrayList<FoodDTO> allFoodList = (ArrayList<FoodDTO>)session.getAttribute("AllFoodList");
                        FoodDAO dao = FoodDAO.getInstance();
                        ArrayList<FoodDTO> allFoodList = dao.getAllFoods();
                        for(int i=0; i<allFoodList.size(); i++) {
                            FoodDTO food = allFoodList.get(i);
                    %>
                        <tr align="center">
                            <td><%=i+1%></td>
                            <td><%=food.getFoodId()%></td>
                            <td><%=food.getFname()%></td>
                            <td><%=food.getPrice()%></td>
                            <td><%=food.getCategory()%></td>
                            <td><%=food.getStock()%></td>
                            <td><%=food.getImage()%></td>
                            <td><a href="foodDetail.do?id=<%=food.getFoodId()%>" class="btn btn-secondary" role="button">상세 정보 &raquo;</a></td>
                            <td>
                                <form name="deleteFoodForm" action="deleteFood.do" method="post">
                                    <input type="hidden" name="delFoodId" value="<%=food.getFoodId()%>">
                                    <button class="btn btn-sm btn-primary" onclick="deleteFood()"><i class="fa fa-times"></i></button>
                                </form>
                            </td>
                        </tr>
                    <%}%>
                    </tbody>
                </table>
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
