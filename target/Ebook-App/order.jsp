<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Saturni E-Books | My Orders</title>
<%@include file="all_component/allCss.jsp"%>
<style>
.orders-wrap { padding: 50px 0; min-height: 70vh; }
.orders-card {
  background: white; border-radius: 20px;
  box-shadow: var(--shadow-md); border: 1px solid var(--border); overflow: hidden;
}
.orders-card-header {
  background: linear-gradient(135deg, var(--dark-2), var(--dark-3));
  padding: 22px 32px; color: white;
  display: flex; align-items: center; justify-content: space-between;
}
.orders-card-header h4 { margin: 0; font-weight: 700; font-size: 1.1rem; display:flex;align-items:center;gap:10px; }
.orders-card-body { padding: 0; }
.orders-table { width: 100%; border-collapse: collapse; }
.orders-table thead th {
  font-size: .73rem; font-weight: 700; text-transform: uppercase;
  letter-spacing: .8px; color: var(--text-muted);
  padding: 16px 20px; background: rgba(108,99,255,.04);
  border-bottom: 2px solid var(--border);
}
.orders-table tbody td {
  padding: 16px 20px; font-size: .88rem; color: var(--text-primary);
  border-bottom: 1px solid rgba(108,99,255,.06);
  vertical-align: middle;
}
.orders-table tbody tr:last-child td { border-bottom: none; }
.orders-table tbody tr:hover td { background: rgba(108,99,255,.03); }
.order-id-badge {
  display: inline-block; background: rgba(108,99,255,.1);
  color: var(--primary); padding: 4px 10px; border-radius: 8px;
  font-size: .72rem; font-weight: 700; letter-spacing: .3px;
}
.payment-badge {
  display: inline-block; background: rgba(16,185,129,.1);
  color: #059669; padding: 4px 10px; border-radius: 8px;
  font-size: .72rem; font-weight: 700;
}
.price-cell { color: var(--secondary); font-weight: 700; }
.empty-state { text-align: center; padding: 60px 20px; }
</style>
</head>
<body>
<c:if test="${empty userobj}"><c:redirect url="login.jsp"/></c:if>
<%@ include file="all_component/navbar.jsp"%>

<div class="orders-wrap" style="background: var(--light)">
  <div class="container">

    <nav style="margin-bottom:24px;font-size:.82rem;color:var(--text-muted)">
      <a href="index.jsp" style="color:var(--primary);text-decoration:none">Home</a>
      <span style="margin:0 8px;opacity:.5">/</span>
      <span>My Orders</span>
    </nav>

    <div class="orders-card reveal">
      <div class="orders-card-header">
        <h4><i class="fas fa-box"></i> My Orders</h4>
        <a href="all_new_book.jsp" style="font-size:.8rem;color:rgba(255,255,255,.7);text-decoration:none">
          <i class="fas fa-plus" style="margin-right:4px"></i> Shop More
        </a>
      </div>
      <div class="orders-card-body">
        <%
        User u = (User) session.getAttribute("userobj");
        BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
        List<Book_Order> blist = dao.getBook(u.getEmail());
        %>
        <% if (blist.isEmpty()) { %>
        <div class="empty-state">
          <i class="fas fa-box-open" style="font-size:3rem;color:var(--primary);opacity:.25"></i>
          <p style="color:var(--text-muted);margin-top:16px;font-weight:500">You haven't placed any orders yet.</p>
          <a href="all_new_book.jsp" class="btn-view-all" style="margin-top:12px;display:inline-flex">Browse Books</a>
        </div>
        <% } else { %>
        <div style="overflow-x:auto">
          <table class="orders-table">
            <thead>
              <tr>
                <th>Order ID</th>
                <th>Book Name</th>
                <th>Author</th>
                <th>Price</th>
                <th>Payment</th>
                <th>Address</th>
              </tr>
            </thead>
            <tbody>
              <% for (Book_Order b : blist) { %>
              <tr>
                <td><span class="order-id-badge"><%=b.getOrderId()%></span></td>
                <td style="font-weight:600"><%=b.getBookName()%></td>
                <td style="color:var(--text-muted)"><%=b.getAuthor()%></td>
                <td class="price-cell"><%=b.getPrice()%> L</td>
                <td><span class="payment-badge"><%=b.getPaymentType()%></span></td>
                <td style="color:var(--text-muted);font-size:.82rem;max-width:180px"><%=b.getFulladd()%></td>
              </tr>
              <% } %>
            </tbody>
          </table>
        </div>
        <% } %>
      </div>
    </div>

  </div>
</div>

<%@ include file="all_component/footer.jsp"%>
</body>
</html>
