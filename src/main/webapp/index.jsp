<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.DB.DBConnect,com.DAO.BookDAOImpl,com.entity.BookDtls,com.entity.User,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Saturni E-Books | Home</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
<%@ include file="all_component/navbar.jsp"%>
<%@include file="all_component/book_card_helpers.jsp"%>
<% User u = (User) session.getAttribute("userobj"); %>

<!-- HERO -->
<section class="hero-section">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-lg-6 hero-content mb-5 mb-lg-0">
        <div class="hero-pill"><i class="fas fa-bolt"></i> Discover Your Next Great Read</div>
        <h1 class="hero-title">Millions of <span class="g-text">Books</span>,<br>One Platform.</h1>
        <p class="hero-desc">Explore new releases, timeless classics, and rare old books. Buy, sell, and discover stories that change your world.</p>
        <div class="hero-cta">
          <a href="all_new_book.jsp" class="btn-cta btn-cta-solid"><i class="fas fa-book-open"></i> Browse Books</a>
          <% if (u == null) { %>
          <a href="register.jsp" class="btn-cta btn-cta-ghost"><i class="fas fa-user-plus"></i> Join Free</a>
          <% } else { %>
          <a href="sell_book.jsp" class="btn-cta btn-cta-ghost"><i class="fas fa-tag"></i> Sell a Book</a>
          <% } %>
        </div>
        <div class="hero-stats">
          <div class="stat-item"><div class="stat-num">500+</div><div class="stat-lbl">Books Available</div></div>
          <div class="stat-item"><div class="stat-num">1.2k</div><div class="stat-lbl">Happy Readers</div></div>
          <div class="stat-item"><div class="stat-num">6</div><div class="stat-lbl">Genres</div></div>
        </div>
      </div>
      <div class="col-lg-6 hero-visual">
        <div class="fbc"><div class="fbc-icon fbc-i1"><i class="fas fa-star" style="color:white"></i></div><div><div class="fbc-title">New Arrivals</div><div class="fbc-sub">Fresh books added every week</div></div></div>
        <div class="fbc"><div class="fbc-icon fbc-i2"><i class="fas fa-clock" style="color:white"></i></div><div><div class="fbc-title">Recent Picks</div><div class="fbc-sub">Trending titles right now</div></div></div>
        <div class="fbc"><div class="fbc-icon fbc-i3"><i class="fas fa-gem" style="color:white"></i></div><div><div class="fbc-title">Rare Old Books</div><div class="fbc-sub">Buy &amp; sell second-hand gems</div></div></div>
      </div>
    </div>
  </div>
</section>

<!-- RECENT BOOKS -->
<section class="section-wrap-alt">
  <div class="container">
    <div class="section-header reveal">
      <div class="section-tag"><i class="fas fa-clock"></i> &nbsp;Just Added</div>
      <h2 class="section-title">Recent Books</h2>
      <div class="section-div"></div>
    </div>
    <div class="row">
      <%
      BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
      List<BookDtls> list2 = dao2.getRecentBook();
      int idx2 = 0;
      for (BookDtls b : list2) {
        String cc2 = coverClass(b.getGenre(), b.getBookCategory());
        String gc2 = genreBadgeClass(b.getGenre());
        String genre2 = (b.getGenre() != null && !b.getGenre().isEmpty()) ? b.getGenre() : b.getBookCategory();
      %>
      <div class="col-6 col-md-4 col-lg-3 mb-4 reveal d<%=(idx2%4)+1%>">
        <div class="book-card">
          <div class="book-cover">
            <span class="book-badge badge-recent">Recent</span>
            <div class="css-cover <%=cc2%>">
              <span class="css-cover-initial"><%=initial(b.getBookName())%></span>
              <div class="css-cover-title"><%=b.getBookName()%></div>
              <div class="css-cover-author"><%=b.getAuthor()%></div>
            </div>
          </div>
          <div class="book-body">
            <div class="book-name"><%=b.getBookName()%></div>
            <div class="book-author"><i class="fas fa-pen-nib" style="font-size:.7rem;margin-right:4px"></i><%=b.getAuthor()%></div>
            <span class="genre-badge <%=gc2%>"><i class="fas fa-bookmark"></i> <%=genre2%></span>
            <div class="book-actions">
              <% if (b.getBookCategory().equals("Old")) { %>
                <a href="view_books.jsp?bid=<%=b.getBookid()%>" class="btn-bc btn-bc-view"><i class="fas fa-eye"></i> View</a>
              <% } else { %>
                <% if (u == null) { %>
                  <a href="login.jsp" class="btn-bc btn-bc-cart"><i class="fas fa-cart-plus"></i> Cart</a>
                <% } else { %>
                  <a href="cart?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>" class="btn-bc btn-bc-cart"><i class="fas fa-cart-plus"></i> Cart</a>
                <% } %>
                <a href="view_books.jsp?bid=<%=b.getBookid()%>" class="btn-bc btn-bc-view"><i class="fas fa-eye"></i> View</a>
              <% } %>
              <span class="book-price"><%=b.getPrice()%> L</span>
            </div>
          </div>
        </div>
      </div>
      <% idx2++; } %>
    </div>
    <div class="text-center mt-4 reveal">
      <a href="all_recent_book.jsp" class="btn-view-all">View All Recent <i class="fas fa-arrow-right"></i></a>
    </div>
  </div>
</section>

<!-- OLD BOOKS -->
<section class="section-wrap">
  <div class="container">
    <div class="section-header reveal">
      <div class="section-tag"><i class="fas fa-gem"></i> &nbsp;Pre-Loved</div>
      <h2 class="section-title">Old Books</h2>
      <div class="section-div"></div>
    </div>
    <div class="row">
      <%
      BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
      List<BookDtls> list3 = dao3.getOldBook();
      int idx3 = 0;
      for (BookDtls b : list3) {
        String cc3 = coverClass(b.getGenre(), b.getBookCategory());
        String gc3 = genreBadgeClass(b.getGenre());
        String genre3 = (b.getGenre() != null && !b.getGenre().isEmpty()) ? b.getGenre() : "Old";
      %>
      <div class="col-6 col-md-4 col-lg-3 mb-4 reveal d<%=(idx3%4)+1%>">
        <div class="book-card">
          <div class="book-cover">
            <span class="book-badge badge-old">Old</span>
            <div class="css-cover <%=cc3%>">
              <span class="css-cover-initial"><%=initial(b.getBookName())%></span>
              <div class="css-cover-title"><%=b.getBookName()%></div>
              <div class="css-cover-author"><%=b.getAuthor()%></div>
            </div>
          </div>
          <div class="book-body">
            <div class="book-name"><%=b.getBookName()%></div>
            <div class="book-author"><i class="fas fa-pen-nib" style="font-size:.7rem;margin-right:4px"></i><%=b.getAuthor()%></div>
            <span class="genre-badge <%=gc3%>"><i class="fas fa-bookmark"></i> <%=genre3%></span>
            <div class="book-actions">
              <a href="view_books.jsp?bid=<%=b.getBookid()%>" class="btn-bc btn-bc-view"><i class="fas fa-eye"></i> View Details</a>
              <span class="book-price"><%=b.getPrice()%> L</span>
            </div>
          </div>
        </div>
      </div>
      <% idx3++; } %>
    </div>
    <div class="text-center mt-4 reveal">
      <a href="all_old_book.jsp" class="btn-view-all">View All Old Books <i class="fas fa-arrow-right"></i></a>
    </div>
  </div>
</section>

<!-- NEW BOOKS -->
<section class="section-wrap-alt">
  <div class="container">
    <div class="section-header reveal">
      <div class="section-tag"><i class="fas fa-star"></i> &nbsp;Brand New</div>
      <h2 class="section-title">New Books</h2>
      <div class="section-div"></div>
    </div>
    <div class="row">
      <%
      BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
      List<BookDtls> list = dao.getNewBook();
      int idx = 0;
      for (BookDtls b : list) {
        String cc = coverClass(b.getGenre(), b.getBookCategory());
        String gc = genreBadgeClass(b.getGenre());
        String genre = (b.getGenre() != null && !b.getGenre().isEmpty()) ? b.getGenre() : b.getBookCategory();
      %>
      <div class="col-6 col-md-4 col-lg-3 mb-4 reveal d<%=(idx%4)+1%>">
        <div class="book-card">
          <div class="book-cover">
            <span class="book-badge badge-new">New</span>
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
              <% if (u == null) { %>
                <a href="login.jsp" class="btn-bc btn-bc-cart"><i class="fas fa-cart-plus"></i> Cart</a>
              <% } else { %>
                <a href="cart?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>" class="btn-bc btn-bc-cart"><i class="fas fa-cart-plus"></i> Cart</a>
              <% } %>
              <a href="view_books.jsp?bid=<%=b.getBookid()%>" class="btn-bc btn-bc-view"><i class="fas fa-eye"></i> View</a>
              <span class="book-price"><%=b.getPrice()%> L</span>
            </div>
          </div>
        </div>
      </div>
      <% idx++; } %>
    </div>
    <div class="text-center mt-4 reveal">
      <a href="all_new_book.jsp" class="btn-view-all">View All New Books <i class="fas fa-arrow-right"></i></a>
    </div>
  </div>
</section>

<%@ include file="all_component/footer.jsp"%>
</body>
</html>
