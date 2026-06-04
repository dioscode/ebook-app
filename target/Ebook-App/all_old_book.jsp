<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.DB.DBConnect,com.DAO.BookDAOImpl,com.entity.BookDtls,java.util.List,java.util.LinkedHashSet,java.util.Set"%>
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
<%@include file="all_component/book_card_helpers.jsp"%>

<div class="section-wrap" style="min-height:70vh">
  <div class="container">
    <div class="section-header reveal">
      <div class="section-tag"><i class="fas fa-gem"></i> &nbsp;Pre-Loved</div>
      <h2 class="section-title">Old Books</h2>
      <div class="section-div"></div>
    </div>

    <%
    BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
    List<BookDtls> list = dao.getAllOldBook();
    Set<String> genres = new LinkedHashSet<>();
    genres.add("All");
    for (BookDtls b : list) {
      String g = b.getGenre() != null && !b.getGenre().isEmpty() ? b.getGenre() : "General";
      genres.add(g);
    }
    %>

    <div class="genre-filter-bar reveal">
      <% for (String g : genres) { %>
      <button class="genre-pill<%= "All".equals(g) ? " active" : "" %>" data-genre="<%=g%>">
        <% if("All".equals(g)) { %><i class="fas fa-th" style="margin-right:5px"></i><% } %><%=g%>
      </button>
      <% } %>
    </div>

    <div class="row" id="booksGrid">
      <%
      int idx = 0;
      for (BookDtls b : list) {
        String cc = coverClass(b.getGenre(), b.getBookCategory());
        String gc = genreBadgeClass(b.getGenre());
        String genre = (b.getGenre() != null && !b.getGenre().isEmpty()) ? b.getGenre() : "General";
      %>
      <div class="col-6 col-md-4 col-lg-3 mb-4 reveal d<%=(idx%4)+1%>" data-genre="<%=genre%>">
        <div class="book-card">
          <div class="book-cover">
            <span class="book-badge badge-old">Old</span>
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
              <a href="view_books.jsp?bid=<%=b.getBookid()%>" class="btn-bc btn-bc-view"><i class="fas fa-eye"></i> View Details</a>
              <span class="book-price"><%=b.getPrice()%> L</span>
            </div>
          </div>
        </div>
      </div>
      <% idx++; } %>
    </div>

    <div id="noResults" style="display:none;text-align:center;padding:50px 0">
      <i class="fas fa-filter" style="font-size:3rem;color:var(--primary);opacity:.25"></i>
      <p style="color:var(--text-muted);margin-top:16px;font-weight:500">No books in this genre yet.</p>
    </div>
  </div>
</div>

<script>
document.querySelectorAll('.genre-pill').forEach(function(pill) {
  pill.addEventListener('click', function() {
    document.querySelectorAll('.genre-pill').forEach(function(p){ p.classList.remove('active'); });
    this.classList.add('active');
    var sel = this.dataset.genre;
    var cards = document.querySelectorAll('#booksGrid [data-genre]');
    var visible = 0;
    cards.forEach(function(c) {
      c.style.display = (sel === 'All' || c.dataset.genre === sel) ? (visible++,'') : 'none';
    });
    document.getElementById('noResults').style.display = visible ? 'none' : 'block';
  });
});
</script>

<%@ include file="all_component/footer.jsp"%>
</body>
</html>
