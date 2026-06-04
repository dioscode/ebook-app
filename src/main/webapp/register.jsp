<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Saturni E-Books | Register</title>
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

    <h2 class="auth-title">Create Account</h2>
    <p class="auth-sub">Join thousands of readers today &mdash; it&apos;s free</p>

    <!-- Alerts -->
    <c:if test="${not empty succMsg}">
      <div class="alert-m alert-m-success">
        <i class="fas fa-check-circle"></i> ${succMsg}
      </div>
      <c:remove var="succMsg" scope="session"/>
    </c:if>

    <c:if test="${not empty failedMsg}">
      <div class="alert-m alert-m-danger">
        <i class="fas fa-exclamation-circle"></i> ${failedMsg}
      </div>
      <c:remove var="failedMsg" scope="session"/>
    </c:if>

    <!-- Form -->
    <form action="register" method="post">

      <div class="fg">
        <label class="fl">Full Name</label>
        <input type="text" name="fname" class="fc"
               placeholder="John Doe" required>
      </div>

      <div class="fg">
        <label class="fl">Email Address</label>
        <input type="email" name="email" class="fc"
               placeholder="you@example.com" required>
      </div>

      <div class="fg">
        <label class="fl">Phone Number</label>
        <input type="number" name="phno" class="fc"
               placeholder="+355 69 000 0000" required>
      </div>

      <div class="fg">
        <label class="fl">Password</label>
        <input type="password" name="password" class="fc"
               placeholder="Create a strong password" required>
      </div>

      <div class="fg" style="display:flex;align-items:center;gap:10px">
        <input type="checkbox" name="check" id="terms"
               style="width:16px;height:16px;accent-color:var(--primary)" required>
        <label for="terms" style="font-size:.82rem;color:var(--text-muted);margin:0;cursor:pointer">
          I agree to the <a href="#" class="auth-link">Terms &amp; Conditions</a>
        </label>
      </div>

      <button type="submit" class="btn-auth">
        <i class="fas fa-user-plus" style="margin-right:8px"></i> Create Account
      </button>

    </form>

    <p class="auth-footer-txt">
      Already have an account?
      <a href="login.jsp" class="auth-link">Sign in</a>
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
