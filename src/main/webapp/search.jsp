<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.DB.DBConnect,com.DAO.BookDAOImpl,com.entity.BookDtls,com.entity.User,java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Saturni E-Books | Search</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<%@ include file="all_component/navbar.jsp"%>
<%@include file="all_component/book_card_helpers.jsp"%>
<% User u = (User) session.getAttribute("userobj");
   String ch = request.getParameter("ch"); if (ch == null) ch = "";
   BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
   List<BookDtls> list = dao.getBookBySearch(ch);
%>

<div class="section-wrap" style="min-height:70vh">
  <div class="container">
    <div class="section-header reveal">
      <div class="section-tag"><i class="fas fa-search"></i> &nbsp;Results</div>
      <h2 class="section-title">"<%=ch%>"</h2>
      <div class="section-div"></div>
      <p style="margin-top:12px;color:var(--text-muted);font-size:.88rem">
        <strong style="color:var(--primary)"><%=list.size()%></strong> book<%= list.size()!=1?"s":""%> found
      </p>
    </div>

    <div class="row">
      <% int idx=0; for (BookDtls b : list) {
        String cc = coverClass(b.getGenre(), b.getBookCategory());
        String gc = genreBadgeClass(b.getGenre());
        String genre = (b.getGenre()!=null&&!b.getGenre().isEmpty()) ? b.getGenre() : b.getBookCategory();
      %>
      <div class="col-6 col-md-4 col-lg-3 mb-4 reveal d<%=(idx%4)+1%>">
        <div class="book-card">
          <div class="book-cover">
            <% if(b.getBookCategory().equals("Old")){ %><span class="book-badge badge-old">Old</span>
            <% } else { %><span class="book-badge badge-new">New</span><% } %>
            <div class="css-cover <%=cc%>">
              <span class="css-cover-initial"><%=initial(b.getBookName())%></span>
              <div class="css-cover-title"><%=b.getBookName()%></div>
              <div class="css-cover-author"><%=b.getAuthor()%></div>
            </div>
          </div>
          <div class="book-body">
            <div class="book-name"><%=b.getBookName()%></div>
            <div class="book-author"><i class="fas fa-pen-nib" style="font-size:.7rem;margin-right:4px"></i><%=b.getAuthor()%></div>
            <span class="genre-badge <%=gc%>"><i class="fas fa-bookmark"></i> <%=genre%></span>
            <div class="book-actions">
              <% if(b.getBookCategory().equals("Old")){ %>
                <a href="view_books.jsp?bid=<%=b.getBookid()%>" class="btn-bc btn-bc-view"><i class="fas fa-eye"></i> View</a>
              <% } else { %>
                <% if(u==null){ %><a href="login.jsp" class="btn-bc btn-bc-cart"><i class="fas fa-cart-plus"></i> Cart</a>
                <% } else { %><a href="cart?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>" class="btn-bc btn-bc-cart"><i class="fas fa-cart-plus"></i> Cart</a><% } %>
                <a href="view_books.jsp?bid=<%=b.getBookid()%>" class="btn-bc btn-bc-view"><i class="fas fa-eye"></i> View</a>
              <% } %>
              <span class="book-price"><%=b.getPrice()%> L</span>
            </div>
          </div>
        </div>
      </div>
      <% idx++; } %>
      <% if(list.isEmpty()){ %>
      <div class="col-12 text-center py-5 reveal">
        <i class="fas fa-search" style="font-size:3rem;color:var(--primary);opacity:.25"></i>
        <p style="color:var(--text-muted);margin-top:16px;font-weight:500">No books found for "<%=ch%>".</p>
        <a href="index.jsp" class="btn-view-all" style="margin-top:12px;display:inline-flex">Back to Home</a>
      </div>
      <% } %>
    </div>
  </div>
</div>

<%@ include file="all_component/footer.jsp"%>
</body>
</html>
