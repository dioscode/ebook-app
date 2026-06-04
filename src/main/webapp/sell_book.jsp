<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Saturni E-Books | Sell a Book</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<c:if test="${empty userobj}"><c:redirect url="login.jsp"/></c:if>
<%@ include file="all_component/navbar.jsp"%>

<div class="auth-bg" style="min-height:auto;padding:60px 16px">
  <div class="auth-card" style="max-width:500px">

    <div class="auth-logo-wrap">
      <div class="auth-logo-icon" style="background:linear-gradient(135deg,#f9ca24,#e17b20)">
        <i class="fas fa-tag"></i>
      </div>
      <div class="auth-brand-name" style="color:#e17b20">Sell <span style="color:var(--primary)">a Book</span></div>
    </div>

    <h2 class="auth-title">List Your Book</h2>
    <p class="auth-sub">Fill in the details and upload a photo</p>

    <c:if test="${not empty succMsg}">
      <div class="alert-m alert-m-success"><i class="fas fa-check-circle"></i> ${succMsg}</div>
      <c:remove var="succMsg" scope="session"/>
    </c:if>
    <c:if test="${not empty failedMsg}">
      <div class="alert-m alert-m-danger"><i class="fas fa-exclamation-circle"></i> ${failedMsg}</div>
      <c:remove var="failedMsg" scope="session"/>
    </c:if>

    <form action="add_old_book" method="post" enctype="multipart/form-data">
      <input type="hidden" name="user" value="${userobj.email}">

      <div class="fg">
        <label class="fl">Book Name</label>
        <input type="text" name="bname" class="fc" placeholder="e.g. The Great Gatsby" required>
      </div>
      <div class="fg">
        <label class="fl">Author Name</label>
        <input type="text" name="author" class="fc" placeholder="e.g. F. Scott Fitzgerald" required>
      </div>
      <div class="fg">
        <label class="fl">Price (L)</label>
        <input type="number" name="price" class="fc" placeholder="e.g. 800" min="1" required>
      </div>
      <div class="fg">
        <label class="fl">Book Cover Photo</label>
        <input type="file" name="bimg" accept="image/*" class="fc" style="padding:10px 16px;cursor:pointer">
        <small style="color:var(--text-muted);font-size:.75rem;margin-top:4px;display:block">JPG, PNG accepted</small>
      </div>

      <button type="submit" class="btn-auth" style="background:linear-gradient(135deg,#f9ca24,#e17b20)">
        <i class="fas fa-upload" style="margin-right:8px"></i> List My Book
      </button>
    </form>

    <p class="auth-footer-txt" style="margin-top:18px">
      <a href="old_book.jsp" class="auth-link"><i class="fas fa-list" style="margin-right:4px"></i>My Listed Books</a>
    </p>

  </div>
</div>

<%@ include file="all_component/footer.jsp"%>
</body>
</html>
