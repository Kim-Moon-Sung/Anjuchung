<%@ page import="dao.ReviewDAO" %>
<%@ page import="dto.ReviewDTO" %>
<%@ page import="dto.MemberDTO" %>
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
        <h1 class="font-weight-semi-bold text-uppercase mb-3">리뷰 상세보기</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="home.do">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Review Detail</p>
        </div>
    </div>
</div>
<!-- Page Header End -->

<%
    String reviewNo = (String)session.getAttribute("reviewNo");
    ReviewDAO dao = ReviewDAO.getInstance();

    ReviewDTO dto = dao.selectReview(reviewNo);
%>

<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">리뷰 상세보기</span></h2>
    </div>
    <div class="px-xl-5">
        <div class="col-9 mb-5" style="margin: 0 auto;">
            <div class="contact-form">
                <table name="writeForm" class="table">
                    <tr>
                        <td>번호</td>
                        <td><%=dto.getReviewNo()%></td>
                        <td>작성자</td>
                        <td><%=dto.getReviewWriterId()%></td>
                    </tr>
                    <tr>
                        <td>작성일</td>
                        <td><%=dto.getPostDate()%></td>
                        <td>조회수</td>
                        <td><%=dto.getVisitCount()%></td>
                    </tr>
                    <tr>
                        <td>제목</td>
                        <td><%=dto.getReviewTitle()%></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <%
                        if(dto.getReviewImage() != null) {
                    %>
                    <tr>
                        <td colspan="4">
                            <div>
                                <img class="w-30 h-30" src="resources/img/<%=dto.getReviewImage()%>">
                            </div>
                        </td>
                    </tr>
                    <%}%>
                    <tr>
                        <td>내용</td>
                        <td colspan="3" height="100px"><%=dto.getReviewContent()%></td>
                    </tr>
                    <tr>
                        <td colspan="4" align="center">
                            <%
                                MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");

                                if(loginMember != null && dto.getReviewWriterId().equals(loginMember.getMemberId())) {
                            %>
                        </td>
                    </tr>
                </table>
                <div class="row text-center">
                    <div class="col-md-4 pb-4">
                        <a href="reviewEdit.do?reviewNo=<%=dto.getReviewNo()%>" class="btn btn-primary py-2 px-4 form-control">수정</a>
                    </div>
                    <div class="col-md-4 pb-4">
                        <a href="deleteReview.do" class="btn btn-primary py-2 px-4 form-control">삭제</a>
                    </div>
                             <%}%>
                    <div class="col-md-4 pb-4">
                        <a href="reviewList.do" class="btn btn-primary py-2 px-4 form-control">목록</a>
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
