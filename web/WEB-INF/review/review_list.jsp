<%@ page import="dao.ReviewDAO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="dto.ReviewDTO" %>
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
    <link href="resources/css/style.css?ver=1" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/layout/topbar.jsp"/>

<jsp:include page="/WEB-INF/layout/navbar.jsp"/>

<!-- Page Header Start -->
<div class="container-fluid bg-secondary mb-5">
    <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
        <h1 class="font-weight-semi-bold text-uppercase mb-3">리뷰 목록</h1>
        <div class="d-inline-flex">
            <p class="m-0"><a href="home.do">Home</a></p>
            <p class="m-0 px-2">-</p>
            <p class="m-0">Review</p>
        </div>
    </div>
</div>
<!-- Page Header End -->

<%
    ReviewDAO dao = ReviewDAO.getInstance();

    Map<String, Object> param = new HashMap<String, Object>();

    String searchField = request.getParameter("searchField");
    String searchWord = request.getParameter("searchWord");
    if(searchWord != null) {
        param.put("searchField", searchField);
        param.put("searchWord", searchWord);
    }
    int totalCount = dao.selectCount(param);
    int pageCount = totalCount / 10;

    String pageNum = request.getParameter("pageNum");
    if(pageNum == null || pageNum.equals("0")) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startIdx = (currentPage-1)*10;
    int endIdx = (currentPage-1)*10 + 10;

    List<ReviewDTO> reviewList = dao.selectReviews(param);
    if(endIdx > reviewList.size()) {
        endIdx = reviewList.size();
    }
%>

<div class="container-fluid pt-5">
    <div class="text-center mb-3">
        <h2 class="section-title px-5"><span class="px-2">리뷰 목록</span></h2>
    </div>
    <div class="px-xl-5">
        <div class="col-9 mb-5" style="margin: 0 auto;">
            <div class="contact-form">
                <form post="get" class="mb-3">
                    <table width="90%" align="center">
                        <td align="center">
                            <select name="searchField" class="custom-select-sm">
                                <option value="reviewTitle">제목</option>
                                <option value="reviewContent">내용</option>
                                <option value="reviewWriterId">작성자</option>
                            </select>
                            <input type="text" name="searchWord">
                            <input type="submit" value="검색하기">
                        </td>
                    </table>
                </form>
                <table class="table">
                    <thead align="center">
                    <tr>
                        <th>리뷰 번호</th>
                        <th>작성자 아이디</th>
                        <th>제목</th>
                        <th>음식 이름</th>
                        <th>날짜</th>
                        <th>조회수</th>
                    </tr>
                    </thead>
                    <tbody align="center">
                        <%
                            for(int i=startIdx; i<endIdx; i++) {
                                ReviewDTO review = reviewList.get(i);
                        %>
                        <tr>
                            <td><%=review.getReviewNo()%></td>
                            <td><%=review.getReviewWriterId()%></td>
                            <td><a href="review.do?reviewNo=<%=review.getReviewNo()%>"><%=review.getReviewTitle()%></a></td>
                            <td><%=review.getReviewFoodName()%></td>
                            <td><%=review.getPostDate()%></td>
                            <td><%=review.getVisitCount()%></td>
                        </tr>
                        <%}%>
                    </tbody>
                    <tbody align="center">
                        <tr>
                            <td colspan="6" align="center">
                                <ul class="list-inline mt-3">
                                    <li class="list-inline-item"><a href="reviewList.do?pageNum=<%=currentPage-1%>" class="page-link">&laquo;</a></li>
                                    <li class="list-inline-item active"><a href="reviewList.do?pageNum=1" class="page-link">1</a></li>
                                    <li class="list-inline-item"><a href="reviewList.do?pageNum=2" class="page-link">2</a></li>
                                    <li class="list-inline-item"><a href="reviewList.do?pageNum=3" class="page-link">3</a></li>
                                    <li class="list-inline-item"><a href="reviewList.do?pageNum=4" class="page-link">4</a></li>
                                    <li class="list-inline-item"><a href="reviewList.do?pageNum=5" class="page-link">5</a></li>
                                    <li class="list-inline-item"><a href="reviewList.do?pageNum=<%=currentPage+1%>" class="page-link">&raquo;</a></li>
                                </ul>
                                <div class="col-md-3 pb-4 pt-2">
                                    <a href="reviewWrite.do" class="btn btn-primary py-2 px-4 form-control">리뷰 작성</a>
                                </div>
                            </td>
                        </tr>
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
