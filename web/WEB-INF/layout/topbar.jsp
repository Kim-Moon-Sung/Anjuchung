<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.FoodDTO" %>
<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
  ArrayList<FoodDTO> cartList = (ArrayList<FoodDTO>)session.getAttribute("cartList");
  ArrayList<FoodDTO> likeList = (ArrayList<FoodDTO>)session.getAttribute("likeList");

  if(cartList == null) {
    cartList = new ArrayList<FoodDTO>();
  }
  if (likeList == null) {
    likeList = new ArrayList<FoodDTO>();
  }

  int cartSize = cartList.size();
  int likeSize = likeList.size();
%>
<fmt:setLocale value='<%=request.getParameter("language")%>'/>
<fmt:bundle basename="bundle.message">
<!-- Topbar Start -->
<div class="container-fluid">
  <div class="row bg-secondary py-2 px-xl-5">
    <div class="col-lg-6 d-none d-lg-block">
      <div class="d-inline-flex align-items-center">
        <a class="text-dark" href="?language=ko">Korean</a>
        <span class="text-muted px-2">|</span>
        <a class="text-dark" href="?language=en">English</a>
      </div>
    </div>
    <div class="col-lg-6 text-center text-lg-right">
      <div class="d-inline-flex align-items-center">
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
          <i class="fab fa-instagram"></i>
        </a>
        <a class="text-dark pl-2" href="">
          <i class="fab fa-youtube"></i>
        </a>
      </div>
    </div>
  </div>
  <div class="row align-items-center py-3 px-xl-5">
    <div class="col-lg-3 d-none d-lg-block">
      <a href="home.do" class="text-decoration-none">
        <h1 class="m-0 display-5 font-weight-semi-bold" style="letter-spacing: 7px;"><img style="margin-right: 10px; width:58px;" src="/resources/img/icon.png"><fmt:message key="title"/></h1>
      </a>
    </div>
    <div class="col-lg-6 col-6 text-left">
      <form action="searchFoodName.do" method="get">
        <div class="input-group">
          <input type="text" name="searchFoodName" class="form-control" placeholder="Search for products">
          <div class="input-group-append">
              <span class="input-group-text bg-transparent text-primary">
                <i class="fa fa-search"></i>
              </span>
          </div>
        </div>
      </form>
    </div>
    <div class="col-lg-3 col-6 text-right">
      <a href="likeFood.do" class="btn border">
        <i class="fas fa-heart text-primary"></i>
        <span class="badge"><%=likeSize%></span>
      </a>
      <a href="cart.do" class="btn border">
        <i class="fas fa-shopping-cart text-primary"></i>
        <span class="badge"><%=cartSize%></span>
      </a>
    </div>
  </div>
</div>
</fmt:bundle>
<!-- Topbar End -->
