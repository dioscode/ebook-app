<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.DB.DBConnect,com.DAO.BookDAOImpl,com.entity.BookDtls,com.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Saturni E-Books | Book Details</title>
<%@include file="all_component/allCss.jsp"%>
<%@include file="all_component/book_card_helpers.jsp"%>
<style>
.book-detail-wrap { padding: 60px 0; min-height: 70vh; }
.detail-card { background:white;border-radius:24px;box-shadow:var(--shadow-md);border:1px solid var(--border);overflow:hidden; }
.detail-cover {
  background:linear-gradient(135deg,#eef0ff,#e0dcff);
  display:flex;align-items:center;justify-content:center;
  padding:50px 30px;min-height:360px;position:relative;
}
.detail-cover::before { content:'';position:absolute;width:200px;height:200px;background:radial-gradient(circle,rgba(108,99,255,.15) 0%,transparent 70%);top:-50px;right:-50px; }
.detail-css-cover {
  width:160px;height:220px;border-radius:4px 12px 12px 4px;
  position:relative;z-index:1;
  box-shadow:15px 15px 40px rgba(0,0,0,.28), -5px -5px 15px rgba(255,255,255,.6);
  transition:var(--t);
}
.detail-css-cover::before { content:'';position:absolute;left:0;top:0;width:10px;height:100%;background:rgba(0,0,0,.2);border-radius:4px 0 0 4px; }
.detail-css-cover::after  { content:'';position:absolute;inset:0;background:linear-gradient(160deg,rgba(255,255,255,.2) 0%,transparent 60%); }
.detail-css-cover:hover   { transform:scale(1.04) rotate(-2deg); }
.detail-css-cover .css-cover-initial { font-size:4rem; }
.detail-css-cover .css-cover-title   { font-size:.8rem; }
.detail-css-cover .css-cover-author  { font-size:.68rem; }
.detail-info { padding:40px 36px; }
.detail-title { font-size:1.9rem;font-weight:800;color:var(--text-primary);letter-spacing:-.5px;margin-bottom:6px;line-height:1.2; }
.detail-author { font-size:.95rem;color:var(--text-muted);margin-bottom:14px;display:flex;align-items:center;gap:8px; }
.feature-grid { display:grid;grid-template-columns:repeat(3,1fr);gap:14px;margin-bottom:30px; }
.feature-item { background:var(--light);border-radius:14px;padding:18px 12px;text-align:center;border:1px solid var(--border);transition:var(--t); }
.feature-item:hover { background:rgba(108,99,255,.06);border-color:rgba(108,99,255,.2);transform:translateY(-3px); }
.fi-icon { font-size:1.4rem;margin-bottom:8px; }
.fi-label { font-size:.75rem;font-weight:600;color:var(--text-muted);line-height:1.4; }
.contact-box { background:linear-gradient(135deg,rgba(108,99,255,.08),rgba(108,99,255,.04));border:1px solid rgba(108,99,255,.18);border-radius:14px;padding:18px 20px;margin-bottom:22px; }
.price-badge { display:inline-block;background:linear-gradient(135deg,var(--secondary),#e0506f);color:white;padding:8px 20px;border-radius:20px;font-size:1.1rem;font-weight:800;box-shadow:0 4px 14px rgba(255,101,132,.3);margin-bottom:24px; }
.btn-detail-cart { background:linear-gradient(135deg,var(--secondary),#e0506f);color:white;border:none;padding:13px 28px;border-radius:25px;font-size:.9rem;font-weight:700;font-family:'Poppins',sans-serif;text-decoration:none;display:inline-flex;align-items:center;gap:8px;transition:var(--t);cursor:pointer;box-shadow:0 6px 20px rgba(255,101,132,.32); }
.btn-detail-cart:hover { transform:translateY(-3px);box-shadow:0 12px 30px rgba(255,101,132,.44);color:white; }
.btn-detail-back { background:transparent;color:var(--primary);border:2px solid var(--primary);padding:12px 26px;border-radius:25px;font-size:.9rem;font-weight:700;font-family:'Poppins',sans-serif;text-decoration:none;display:inline-flex;align-items:center;gap:8px;transition:var(--t); }
.btn-detail-back:hover { background:var(--primary);color:white;transform:translateY(-2px);text-decoration:none; }
</style>
</head>
<body>
<%@ include file="all_component/navbar.jsp"%>

<%
int bid = Integer.parseInt(request.getParameter("bid"));
BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
BookDtls b = dao.getBookById(bid);
User u = (User) session.getAttribute("userobj");
String cc = coverClass(b.getGenre(), b.getBookCategory());
String gc = genreBadgeClass(b.getGenre());
String genre = (b.getGenre()!=null&&!b.getGenre().isEmpty()) ? b.getGenre() : b.getBookCategory();
%>

<div class="book-detail-wrap" style="background:var(--light)">
  <div class="container">
    <nav style="margin-bottom:24px;font-size:.82rem;color:var(--text-muted)">
      <a href="index.jsp" style="color:var(--primary);text-decoration:none">Home</a>
      <span style="margin:0 8px;opacity:.5">/</span>
      <span>Book Details</span>
    </nav>
    <div class="detail-card reveal">
      <div class="row no-gutters">
        <div class="col-md-4">
          <div class="detail-cover">
            <div class="detail-css-cover css-cover <%=cc%>">
              <span class="css-cover-initial"><%=initial(b.getBookName())%></span>
              <div class="css-cover-title"><%=b.getBookName()%></div>
              <div class="css-cover-author"><%=b.getAuthor()%></div>
            </div>
          </div>
        </div>
        <div class="col-md-8">
          <div class="detail-info">
            <div style="display:flex;gap:8px;flex-wrap:wrap;margin-bottom:12px">
              <span class="book-badge <%="Old".equals(b.getBookCategory())?"badge-old":"badge-new"%>" style="position:static"><%=b.getBookCategory()%></span>
              <span class="genre-badge <%=gc%>"><i class="fas fa-bookmark"></i> <%=genre%></span>
            </div>
            <h1 class="detail-title"><%=b.getBookName()%></h1>
            <div class="detail-author"><i class="fas fa-pen-nib" style="color:var(--primary);font-size:.8rem"></i><%=b.getAuthor()%></div>
            <div class="price-badge"><i class="fas fa-tag" style="margin-right:6px;opacity:.8"></i><%=b.getPrice()%> L</div>
            <% if("Old".equals(b.getBookCategory())){ %>
            <div class="contact-box">
              <p style="font-weight:700;color:var(--primary);margin-bottom:4px"><i class="fas fa-address-card" style="margin-right:6px"></i>Contact Seller</p>
              <p style="margin:0;font-size:.88rem"><i class="fas fa-envelope" style="margin-right:6px;color:var(--text-muted)"></i><%=b.getEmail()%></p>
            </div>
            <% } %>
            <div class="feature-grid">
              <div class="feature-item"><div class="fi-icon" style="color:var(--secondary)"><i class="fas fa-money-bill-wave"></i></div><div class="fi-label">Cash on Delivery</div></div>
              <div class="feature-item"><div class="fi-icon" style="color:var(--primary)"><i class="fas fa-undo-alt"></i></div><div class="fi-label">Return Available</div></div>
              <div class="feature-item"><div class="fi-icon" style="color:var(--accent)"><i class="fas fa-truck-moving"></i></div><div class="fi-label">Free Shipping</div></div>
            </div>
            <div style="display:flex;gap:12px;flex-wrap:wrap;align-items:center">
              <% if("Old".equals(b.getBookCategory())){ %>
                <a href="index.jsp" class="btn-detail-back"><i class="fas fa-arrow-left"></i> Continue Shopping</a>
              <% } else { %>
                <% if(u==null){ %>
                  <a href="login.jsp" class="btn-detail-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                <% } else { %>
                  <a href="cart?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>" class="btn-detail-cart"><i class="fas fa-cart-plus"></i> Add to Cart</a>
                <% } %>
                <a href="javascript:history.back()" class="btn-detail-back"><i class="fas fa-arrow-left"></i> Back</a>
              <% } %>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<%@ include file="all_component/footer.jsp"%>
</body>
</html>
