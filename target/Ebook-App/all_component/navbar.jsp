<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!-- TOP HEADER -->
<div class="top-header">
  <div class="container top-header-inner">

    <!-- Brand Logo -->
    <a href="index.jsp" class="brand-logo">
      <div class="logo-icon"><i class="fas fa-book-open"></i></div>
      <span class="brand-text">Saturni <span>E-Books</span></span>
    </a>

    <!-- Search bar -->
    <form class="search-wrapper" action="search.jsp" method="post">
      <i class="fas fa-search si"></i>
      <input type="search" name="ch" placeholder="Search books, authors...">
      <button type="submit" class="btn-search">Search</button>
    </form>

    <!-- Auth / User actions -->
    <div class="header-actions">

      <c:if test="${not empty userobj}">
        <a href="checkout.jsp" class="cart-icon-link" title="Cart">
          <i class="fas fa-shopping-cart"></i>
        </a>
        <a href="edit_profile.jsp" class="btn-hdr btn-hdr-outline">
          <i class="fas fa-user"></i> ${userobj.name}
        </a>
        <a href="logout" class="btn-hdr btn-hdr-secondary">
          <i class="fas fa-sign-out-alt"></i> Logout
        </a>
      </c:if>

      <c:if test="${empty userobj}">
        <a href="login.jsp" class="btn-hdr btn-hdr-outline">
          <i class="fas fa-sign-in-alt"></i> Login
        </a>
        <a href="register.jsp" class="btn-hdr btn-hdr-primary">
          <i class="fas fa-user-plus"></i> Register
        </a>
      </c:if>

    </div>
  </div>
</div>

<!-- STICKY NAVIGATION -->
<nav class="navbar navbar-expand-lg site-navbar">
  <div class="container">

    <button class="navbar-toggler" type="button" data-toggle="collapse"
        data-target="#mainNav" aria-controls="mainNav"
        aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="mainNav">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a class="nav-link" href="index.jsp">
            <i class="fas fa-home"></i> Home
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="all_recent_book.jsp">
            <i class="fas fa-clock"></i> Recent
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="all_new_book.jsp">
            <i class="fas fa-star"></i> New Books
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="all_old_book.jsp">
            <i class="fas fa-archive"></i> Old Books
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="sell_book.jsp">
            <i class="fas fa-tag"></i> Sell a Book
          </a>
        </li>
      </ul>

      <div class="nav-end-btns d-flex" style="gap:8px">
        <a href="setting.jsp" class="btn btn-nav-glass btn-sm">
          <i class="fas fa-cog"></i> Settings
        </a>
        <a href="helpline.jsp" class="btn btn-nav-glass btn-sm">
          <i class="fas fa-headset"></i> Help
        </a>
      </div>
    </div>

  </div>
</nav>
