<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Saturni E-Books | Edit Profile</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<c:if test="${empty userobj}"><c:redirect url="login.jsp"/></c:if>
<%@ include file="all_component/navbar.jsp"%>

<div style="background:var(--light);padding:50px 0;min-height:80vh">
  <div class="container">

    <nav style="margin-bottom:24px;font-size:.82rem;color:var(--text-muted)">
      <a href="index.jsp" style="color:var(--primary);text-decoration:none">Home</a>
      <span style="margin:0 8px;opacity:.5">/</span>
      <a href="setting.jsp" style="color:var(--primary);text-decoration:none">Settings</a>
      <span style="margin:0 8px;opacity:.5">/</span>
      <span>Edit Profile</span>
    </nav>

    <div class="row justify-content-center">
      <div class="col-md-6">
        <div style="background:white;border-radius:22px;box-shadow:var(--shadow-md);border:1px solid var(--border);overflow:hidden" class="reveal">

          <div style="background:linear-gradient(135deg,var(--dark-2),var(--dark-3));padding:22px 30px;color:white;display:flex;align-items:center;gap:12px">
            <div style="width:40px;height:40px;background:linear-gradient(135deg,var(--primary),var(--secondary));border-radius:10px;display:flex;align-items:center;justify-content:center">
              <i class="fas fa-user-edit"></i>
            </div>
            <div>
              <h5 style="margin:0;font-weight:700">Edit Profile</h5>
              <p style="margin:0;font-size:.78rem;opacity:.6">Update your account information</p>
            </div>
          </div>

          <div style="padding:30px">

            <c:if test="${not empty succMsg}">
              <div class="alert-m alert-m-success"><i class="fas fa-check-circle"></i> ${succMsg}</div>
              <c:remove var="succMsg" scope="session"/>
            </c:if>
            <c:if test="${not empty failedMsg}">
              <div class="alert-m alert-m-danger"><i class="fas fa-exclamation-circle"></i> ${failedMsg}</div>
              <c:remove var="failedMsg" scope="session"/>
            </c:if>

            <form action="update_profile" method="post">
              <input type="hidden" name="id" value="${userobj.id}">

              <div class="fg">
                <label class="fl">Full Name</label>
                <input type="text" name="fname" class="fc" value="${userobj.name}" required>
              </div>
              <div class="fg">
                <label class="fl">Email Address</label>
                <input type="email" name="email" class="fc" value="${userobj.email}" required>
              </div>
              <div class="fg">
                <label class="fl">Phone Number</label>
                <input type="number" name="phno" class="fc" value="${userobj.phno}" required>
              </div>
              <div class="fg">
                <label class="fl">Current Password <span style="color:var(--text-muted);font-weight:400">(required to save changes)</span></label>
                <input type="password" name="password" class="fc" placeholder="Enter your current password" required>
              </div>

              <button type="submit" class="btn-auth" style="margin-top:4px">
                <i class="fas fa-save" style="margin-right:8px"></i> Save Changes
              </button>
            </form>

          </div>
        </div>
      </div>
    </div>

  </div>
</div>

<%@ include file="all_component/footer.jsp"%>
</body>
</html>
