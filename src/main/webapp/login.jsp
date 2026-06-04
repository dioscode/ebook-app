<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Saturni E-Books | Login</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>

<div class="auth-bg">
  <div class="auth-card">

    <!-- Logo -->
    <div class="auth-logo-wrap">
      <div class="auth-logo-icon"><i class="fas fa-book-open"></i></div>
      <div class="auth-brand-name">Saturni <span>Books</span></div>
    </div>

    <h2 class="auth-title">Welcome back</h2>
    <p class="auth-sub">Sign in to your account to continue</p>

    <!-- Alerts -->
    <c:if test="${not empty failedMsg}">
      <div class="alert-m alert-m-danger">
        <i class="fas fa-exclamation-circle"></i> ${failedMsg}
      </div>
      <c:remove var="failedMsg" scope="session"/>
    </c:if>

    <c:if test="${not empty succMsg}">
      <div class="alert-m alert-m-success">
        <i class="fas fa-check-circle"></i> ${succMsg}
      </div>
      <c:remove var="succMsg" scope="session"/>
    </c:if>

    <!-- Form -->
    <form action="login" method="post">

      <div class="fg">
        <label class="fl" for="loginEmail">Email Address</label>
        <input type="email" id="loginEmail" name="email"
               class="fc" placeholder="you@example.com" required>
      </div>

      <div class="fg">
        <label class="fl" for="loginPass">Password</label>
        <input type="password" id="loginPass" name="password"
               class="fc" placeholder="Enter your password" required>
      </div>

      <button type="submit" class="btn-auth">
        <i class="fas fa-sign-in-alt" style="margin-right:8px"></i> Sign In
      </button>

    </form>

    <p class="auth-footer-txt">
      Don&apos;t have an account?
      <a href="register.jsp" class="auth-link">Create one free</a>
    </p>

    <p class="auth-footer-txt" style="margin-top:8px">
      <a href="index.jsp" class="auth-link" style="font-size:.8rem;opacity:.7">
        <i class="fas fa-arrow-left" style="margin-right:4px"></i>Back to Home
      </a>
    </p>

  </div>
</div>

</body>
</html>
