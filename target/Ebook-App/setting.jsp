<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Saturni E-Books | Settings</title>
<%@include file="all_component/allCss.jsp"%>
<style>
.settings-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(230px, 1fr)); gap: 20px; }
.settings-item {
  background: white; border-radius: 18px;
  padding: 28px 24px; text-align: center;
  box-shadow: var(--shadow-sm); border: 1px solid var(--border);
  transition: var(--t); text-decoration: none; display: block;
}
.settings-item:hover {
  transform: translateY(-6px); box-shadow: var(--shadow-lg);
  border-color: rgba(108,99,255,.2); text-decoration: none;
}
.settings-item .si-icon {
  width: 60px; height: 60px; border-radius: 16px;
  display: flex; align-items: center; justify-content: center;
  font-size: 1.5rem; color: white; margin: 0 auto 16px;
}
.settings-item .si-title {
  font-size: .95rem; font-weight: 700; color: var(--text-primary); margin-bottom: 6px;
}
.settings-item .si-desc {
  font-size: .78rem; color: var(--text-muted); line-height: 1.5;
}
</style>
</head>
<body>
<c:if test="${empty userobj}"><c:redirect url="login.jsp"/></c:if>
<%@ include file="all_component/navbar.jsp"%>

<div style="background:var(--light);padding:50px 0;min-height:80vh">
  <div class="container">

    <div class="section-header reveal" style="text-align:left;margin-bottom:36px">
      <div class="section-tag"><i class="fas fa-cog"></i> &nbsp;Account</div>
      <h2 class="section-title">Settings</h2>
      <p style="margin-top:8px;color:var(--text-muted);font-size:.88rem">
        Welcome back, <strong style="color:var(--primary)">${userobj.name}</strong>
      </p>
    </div>

    <div class="settings-grid">

      <a href="sell_book.jsp" class="settings-item reveal d1">
        <div class="si-icon" style="background:linear-gradient(135deg,#f9ca24,#e17b20)">
          <i class="fas fa-tag"></i>
        </div>
        <div class="si-title">Sell a Book</div>
        <div class="si-desc">List your old books for sale</div>
      </a>

      <a href="old_book.jsp" class="settings-item reveal d2">
        <div class="si-icon" style="background:linear-gradient(135deg,var(--primary),var(--primary-dark))">
          <i class="fas fa-book"></i>
        </div>
        <div class="si-title">My Listed Books</div>
        <div class="si-desc">Manage books you've listed</div>
      </a>

      <a href="edit_profile.jsp" class="settings-item reveal d3">
        <div class="si-icon" style="background:linear-gradient(135deg,#00d2d3,#48dbfb)">
          <i class="fas fa-user-edit"></i>
        </div>
        <div class="si-title">Edit Profile</div>
        <div class="si-desc">Update your name, email & phone</div>
      </a>

      <a href="order.jsp" class="settings-item reveal d4">
        <div class="si-icon" style="background:linear-gradient(135deg,#a29bfe,#6c63ff)">
          <i class="fas fa-box"></i>
        </div>
        <div class="si-title">My Orders</div>
        <div class="si-desc">View your order history</div>
      </a>

      <a href="checkout.jsp" class="settings-item reveal d1">
        <div class="si-icon" style="background:linear-gradient(135deg,var(--secondary),#e0506f)">
          <i class="fas fa-shopping-cart"></i>
        </div>
        <div class="si-title">My Cart</div>
        <div class="si-desc">View items in your cart</div>
      </a>

      <a href="helpline.jsp" class="settings-item reveal d2">
        <div class="si-icon" style="background:linear-gradient(135deg,#43e97b,#38f9d7)">
          <i class="fas fa-headset"></i>
        </div>
        <div class="si-title">Help Center</div>
        <div class="si-desc">Get support & contact us</div>
      </a>

      <a href="logout" class="settings-item reveal d3">
        <div class="si-icon" style="background:linear-gradient(135deg,#ff7675,#d63031)">
          <i class="fas fa-sign-out-alt"></i>
        </div>
        <div class="si-title">Logout</div>
        <div class="si-desc">Sign out of your account</div>
      </a>

    </div>
  </div>
</div>

<%@ include file="all_component/footer.jsp"%>
</body>
</html>
