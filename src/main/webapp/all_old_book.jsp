<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Saturni E-Books | Old Books</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<%@ include file="all_component/navbar.jsp"%>

<div class="section-wrap" style="min-height:70vh">
  <div class="container">
    <div class="section-header reveal">
      <div class="section-tag"><i class="fas fa-gem"></i> &nbsp;Pre-Loved</div>
      <h2 class="section-title">Old Books</h2>
      <div class="section-div"></div>
    </div>
    <div class="row">
      <%
      BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
      List<BookDtls> list = dao.getAllOldBook();
      int idx = 0;
      for (BookDtls b : list) {
      %>
      <div class="col-6 col-md-4 col-lg-3 mb-4 reveal d<%=(idx%4)+1%>">
        <div class="book-card">
          <div class="book-cover">
            <span class="book-badge badge-old">Old</span>
            <img alt="<%=b.getBookName()%>" src="book/<%=b.getPhotoName()%>">
          </div>
          <div class="book-body">
            <div class="book-name"><%=b.getBookName()%></div>
            <div class="book-author"><i class="fas fa-pen-nib" style="font-size:.7rem;margin-right:4px"></i><%=b.getAuthor()%></div>
            <span class="book-cat"><i class="fas fa-tag"></i> <%=b.getBookCategory()%></span>
            <div class="book-actions">
              <a href="view_books.jsp?bid=<%=b.getBookid()%>" class="btn-bc btn-bc-view"><i class="fas fa-eye"></i> View Details</a>
              <span class="book-price"><%=b.getPrice()%> L</span>
            </div>
          </div>
        </div>
      </div>
      <% idx++; } %>
      <% if (list.isEmpty()) { %>
      <div class="col-12 text-center py-5 reveal">
        <i class="fas fa-gem" style="font-size:3rem;color:var(--primary);opacity:.3"></i>
        <p style="color:var(--text-muted);margin-top:16px;font-weight:500">No old books available yet.</p>
      </div>
      <% } %>
    </div>
  </div>
</div>

<%@ include file="all_component/footer.jsp"%>
</body>
</html>
