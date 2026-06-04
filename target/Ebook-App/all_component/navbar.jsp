<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!-- TOP HEADER -->
<div class="top-header">
  <div class="container top-header-inner">

    <a href="index.jsp" class="brand-logo">
      <div class="logo-icon"><i class="fas fa-book-open"></i></div>
      <span class="brand-text">Saturni <span>E-Books</span></span>
    </a>

    <!-- Live search -->
    <div class="search-wrapper" id="searchWrapper">
      <i class="fas fa-search si"></i>
      <input type="search" id="liveSearchInput" name="ch"
             placeholder="Search books, authors, genres..."
             autocomplete="off">
      <button type="button" class="btn-search" id="searchBtn">Search</button>

      <!-- Live dropdown -->
      <div class="search-dropdown" id="searchDropdown">
        <div class="sdrop-empty" id="sdropEmpty" style="display:none">No books found.</div>
        <div id="sdropResults"></div>
        <div class="sdrop-footer" id="sdropFooter" style="display:none">
          <i class="fas fa-search" style="margin-right:6px"></i>See all results
        </div>
      </div>
    </div>

    <!-- Auth actions -->
    <div class="header-actions">
      <c:if test="${not empty userobj}">
        <a href="checkout.jsp" class="cart-icon-link" title="Cart">
          <i class="fas fa-shopping-cart"></i>
        </a>
        <a href="edit_profile.jsp" class="btn-hdr btn-hdr-outline">
          <i class="fas fa-user"></i> ${userobj.name}
        </a>
        <a href="logout" class="btn-hdr btn-hdr-secondary">
          <i class="fas fa-sign-out-alt"></i> Logout
        </a>
      </c:if>
      <c:if test="${empty userobj}">
        <a href="login.jsp"    class="btn-hdr btn-hdr-outline"><i class="fas fa-sign-in-alt"></i> Login</a>
        <a href="register.jsp" class="btn-hdr btn-hdr-primary"><i class="fas fa-user-plus"></i> Register</a>
      </c:if>
    </div>
  </div>
</div>

<!-- STICKY NAV -->
<nav class="navbar navbar-expand-lg site-navbar">
  <div class="container">
    <button class="navbar-toggler" type="button" data-toggle="collapse"
        data-target="#mainNav" aria-controls="mainNav" aria-expanded="false">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="mainNav">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item"><a class="nav-link" href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
        <li class="nav-item"><a class="nav-link" href="all_recent_book.jsp"><i class="fas fa-clock"></i> Recent</a></li>
        <li class="nav-item"><a class="nav-link" href="all_new_book.jsp"><i class="fas fa-star"></i> New Books</a></li>
        <li class="nav-item"><a class="nav-link" href="all_old_book.jsp"><i class="fas fa-archive"></i> Old Books</a></li>
        <li class="nav-item"><a class="nav-link" href="sell_book.jsp"><i class="fas fa-tag"></i> Sell a Book</a></li>
      </ul>
      <div class="nav-end-btns d-flex" style="gap:8px">
        <a href="setting.jsp" class="btn btn-nav-glass btn-sm"><i class="fas fa-cog"></i> Settings</a>
        <a href="helpline.jsp" class="btn btn-nav-glass btn-sm"><i class="fas fa-headset"></i> Help</a>
      </div>
    </div>
  </div>
</nav>

<script>
(function() {
  var input    = document.getElementById('liveSearchInput');
  var dropdown = document.getElementById('searchDropdown');
  var results  = document.getElementById('sdropResults');
  var empty    = document.getElementById('sdropEmpty');
  var footer   = document.getElementById('sdropFooter');
  var btn      = document.getElementById('searchBtn');
  var timer    = null;

  var genreClass = {
    'programming':'cover-programming','fiction':'cover-fiction',
    'science':'cover-science','history':'cover-history',
    'self-help':'cover-selfhelp','mathematics':'cover-mathematics'
  };

  function coverClass(genre, cat) {
    if (cat === 'Old') return 'cover-old';
    var g = (genre||'').toLowerCase().replace(/[\s-]/g,'');
    for (var k in genreClass) {
      if (g.indexOf(k.replace('-','')) >= 0) return genreClass[k];
    }
    return 'cover-general';
  }

  function search(term) {
    if (!term || term.length < 2) { closeDropdown(); return; }

    fetch('search_api.jsp?ch=' + encodeURIComponent(term))
      .then(function(r){ return r.json(); })
      .then(function(books) {
        results.innerHTML = '';
        if (!books.length) {
          empty.style.display  = 'block';
          footer.style.display = 'none';
        } else {
          empty.style.display  = 'none';
          footer.style.display = 'block';
          books.forEach(function(b) {
            var cc  = coverClass(b.genre, b.cat);
            var ltr = b.name.charAt(0).toUpperCase();
            var el  = document.createElement('a');
            el.href = 'view_books.jsp?bid=' + b.id;
            el.className = 'sdrop-item';
            el.innerHTML =
              '<div class="sdrop-icon css-cover ' + cc + '" style="width:38px;height:54px;border-radius:4px 7px 7px 4px;padding:4px;box-shadow:3px 4px 10px rgba(0,0,0,.25)">' +
                '<span style="font-size:.9rem;font-weight:800;color:rgba(255,255,255,.3);position:absolute">' + ltr + '</span>' +
              '</div>' +
              '<div>' +
                '<div class="sdrop-name">' + b.name + '</div>' +
                '<div class="sdrop-sub">' + b.author + ' &bull; <span style="color:var(--primary-light)">' + (b.genre||b.cat) + '</span></div>' +
              '</div>' +
              '<div class="sdrop-price">' + b.price + ' L</div>';
            results.appendChild(el);
          });
          footer.onclick = function() {
            window.location.href = 'search.jsp?ch=' + encodeURIComponent(input.value);
          };
        }
        dropdown.classList.add('open');
      })
      .catch(function(){ closeDropdown(); });
  }

  function closeDropdown() {
    dropdown.classList.remove('open');
    results.innerHTML = '';
    empty.style.display = footer.style.display = 'none';
  }

  input.addEventListener('input', function() {
    clearTimeout(timer);
    var val = this.value.trim();
    if (!val) { closeDropdown(); return; }
    timer = setTimeout(function(){ search(val); }, 320);
  });

  input.addEventListener('keydown', function(e) {
    if (e.key === 'Enter') {
      closeDropdown();
      window.location.href = 'search.jsp?ch=' + encodeURIComponent(this.value.trim());
    }
    if (e.key === 'Escape') closeDropdown();
  });

  btn.addEventListener('click', function() {
    var v = input.value.trim();
    if (v) window.location.href = 'search.jsp?ch=' + encodeURIComponent(v);
  });

  document.addEventListener('click', function(e) {
    if (!document.getElementById('searchWrapper').contains(e.target)) closeDropdown();
  });
})();
</script>
