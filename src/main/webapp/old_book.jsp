<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Saturni E-Books | My Books</title>
<%@include file="all_component/allCss.jsp"%>
<style>
.my-books-card {
  background: white; border-radius: 20px;
  box-shadow: var(--shadow-md); border: 1px solid var(--border); overflow: hidden;
}
.my-books-header {
  background: linear-gradient(135deg, var(--dark-2), var(--dark-3));
  padding: 20px 28px; color: white;
  display: flex; align-items: center; justify-content: space-between;
}
.my-books-header h4 { margin: 0; font-weight: 700; font-size: 1rem; display:flex;align-items:center;gap:10px; }
.books-table { width: 100%; border-collapse: collapse; }
.books-table thead th {
  font-size: .72rem; font-weight: 700; text-transform: uppercase;
  letter-spacing: .8px; color: var(--text-muted);
  padding: 14px 20px; background: rgba(108,99,255,.04);
  border-bottom: 2px solid var(--border);
}
.books-table tbody td {
  padding: 14px 20px; font-size: .88rem; color: var(--text-primary);
  border-bottom: 1px solid rgba(108,99,255,.06);
}
.books-table tbody tr:last-child td { border-bottom: none; }
.books-table tbody tr:hover td { background: rgba(108,99,255,.03); }
.btn-del {
  background: transparent; color: var(--secondary);
  border: 1.5px solid var(--secondary); padding: 5px 14px;
  border-radius: 16px; font-size: .73rem; font-weight: 700;
  font-family: 'Poppins', sans-serif; cursor: pointer;
  transition: var(--t); text-decoration: none;
  display: inline-flex; align-items: center; gap: 5px;
}
.btn-del:hover { background: var(--secondary); color: white; text-decoration: none; }
</style>
</head>
<body>
<c:if test="${empty userobj}"><c:redirect url="login.jsp"/></c:if>
<%@ include file="all_component/navbar.jsp"%>

<c:if test="${not empty succMsg}">
<div style="background:rgba(16,185,129,.1);color:#059669;border-left:3px solid #059669;
  padding:12px 20px;font-size:.85rem;font-weight:500;font-family:'Poppins',sans-serif">
  <i class="fas fa-check-circle" style="margin-right:8px"></i>${succMsg}
</div>
<c:remove var="succMsg" scope="session"/>
</c:if>

<div class="section-wrap" style="min-height:70vh">
  <div class="container">
    <nav style="margin-bottom:24px;font-size:.82rem;color:var(--text-muted)">
      <a href="index.jsp" style="color:var(--primary);text-decoration:none">Home</a>
      <span style="margin:0 8px;opacity:.5">/</span>
      <span>My Listed Books</span>
    </nav>

    <div class="my-books-card reveal">
      <div class="my-books-header">
        <h4><i class="fas fa-book"></i> My Listed Books</h4>
        <a href="sell_book.jsp" style="font-size:.8rem;color:rgba(255,255,255,.75);text-decoration:none;display:flex;align-items:center;gap:5px">
          <i class="fas fa-plus-circle"></i> Add New
        </a>
      </div>
      <div>
        <%
        User u = (User) session.getAttribute("userobj");
        BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
        List<BookDtls> list = dao.getBookByOld(u.getEmail(), "Old");
        %>
        <% if (list.isEmpty()) { %>
        <div style="text-align:center;padding:50px 20px">
          <i class="fas fa-book" style="font-size:3rem;color:var(--primary);opacity:.25"></i>
          <p style="color:var(--text-muted);margin-top:16px;font-weight:500">You haven't listed any books yet.</p>
          <a href="sell_book.jsp" class="btn-view-all" style="margin-top:12px;display:inline-flex">List a Book</a>
        </div>
        <% } else { %>
        <div style="overflow-x:auto">
          <table class="books-table">
            <thead>
              <tr>
                <th>#</th>
                <th>Book Name</th>
                <th>Author</th>
                <th>Price</th>
                <th>Status</th>
                <th>Action</th>
              </tr>
            </thead>
            <tbody>
              <% int i=1; for (BookDtls b : list) { %>
              <tr>
                <td style="color:var(--text-muted)"><%=i++%></td>
                <td style="font-weight:600"><%=b.getBookName()%></td>
                <td style="color:var(--text-muted)"><%=b.getAuthor()%></td>
                <td style="color:var(--secondary);font-weight:700"><%=b.getPrice()%> L</td>
                <td>
                  <span style="background:rgba(16,185,129,.1);color:#059669;padding:4px 10px;border-radius:8px;font-size:.72rem;font-weight:700">
                    <%=b.getStatus()%>
                  </span>
                </td>
                <td>
                  <a href="delete_old_book?em=<%=u.getEmail()%>&id=<%=b.getBookid()%>"
                     class="btn-del"
                     onclick="return confirm('Remove this book?')">
                    <i class="fas fa-trash-alt"></i> Remove
                  </a>
                </td>
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
