<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Saturni E-Books | Help Center</title>
<%@include file="all_component/allCss.jsp"%>
<style>
.contact-card {
  background: white; border-radius: 20px;
  padding: 36px 32px; box-shadow: var(--shadow-md);
  border: 1px solid var(--border); height: 100%;
  transition: var(--t);
}
.contact-card:hover { transform: translateY(-5px); box-shadow: var(--shadow-lg); }
.contact-icon {
  width: 56px; height: 56px; border-radius: 14px;
  display: flex; align-items: center; justify-content: center;
  font-size: 1.4rem; color: white; margin-bottom: 18px;
}
.contact-title { font-size: 1rem; font-weight: 700; color: var(--text-primary); margin-bottom: 8px; }
.contact-value { font-size: .9rem; color: var(--text-muted); line-height: 1.7; }
.contact-value a { color: var(--primary); text-decoration: none; font-weight: 600; }
.contact-value a:hover { text-decoration: underline; }
</style>
</head>
<body>
<%@ include file="all_component/navbar.jsp"%>

<div style="background:var(--light);padding:60px 0;min-height:70vh">
  <div class="container">

    <div class="section-header reveal">
      <div class="section-tag"><i class="fas fa-headset"></i> &nbsp;Support</div>
      <h2 class="section-title">Help Center</h2>
      <div class="section-div"></div>
      <p style="margin-top:14px;color:var(--text-muted);font-size:.9rem">
        We're here to help. Reach out to us through any of the channels below.
      </p>
    </div>

    <div class="row justify-content-center">

      <div class="col-md-4 mb-4 reveal d1">
        <div class="contact-card">
          <div class="contact-icon" style="background:linear-gradient(135deg,var(--primary),var(--primary-dark))">
            <i class="fas fa-phone-alt"></i>
          </div>
          <div class="contact-title">Phone Support</div>
          <div class="contact-value">
            Available Mon–Fri, 9am–6pm<br>
            <a href="tel:+355671231234">+355 67 123 1234</a>
          </div>
        </div>
      </div>

      <div class="col-md-4 mb-4 reveal d2">
        <div class="contact-card">
          <div class="contact-icon" style="background:linear-gradient(135deg,var(--secondary),#e0506f)">
            <i class="fas fa-envelope"></i>
          </div>
          <div class="contact-title">Email Support</div>
          <div class="contact-value">
            We reply within 24 hours<br>
            <a href="mailto:support@saturni.al">support@saturni.al</a>
          </div>
        </div>
      </div>

      <div class="col-md-4 mb-4 reveal d3">
        <div class="contact-card">
          <div class="contact-icon" style="background:linear-gradient(135deg,#43e97b,#38f9d7)">
            <i class="fas fa-map-marker-alt"></i>
          </div>
          <div class="contact-title">Visit Us</div>
          <div class="contact-value">
            Rr. Myslym Shyri<br>
            Tiranë, Shqipëri
          </div>
        </div>
      </div>

    </div>

    <!-- FAQ section -->
    <div style="margin-top:40px;max-width:680px;margin-left:auto;margin-right:auto" class="reveal">
      <h3 style="font-size:1.3rem;font-weight:800;color:var(--text-primary);margin-bottom:20px;text-align:center">
        Frequently Asked Questions
      </h3>

      <div style="background:white;border-radius:16px;border:1px solid var(--border);overflow:hidden;box-shadow:var(--shadow-sm)">
        <div style="padding:18px 24px;border-bottom:1px solid var(--border)">
          <div style="font-weight:700;font-size:.9rem;color:var(--primary);margin-bottom:6px">
            <i class="fas fa-question-circle" style="margin-right:8px"></i>How do I buy a book?
          </div>
          <div style="font-size:.85rem;color:var(--text-muted);line-height:1.7">
            Browse books, add them to cart, and complete checkout with your delivery details.
          </div>
        </div>
        <div style="padding:18px 24px;border-bottom:1px solid var(--border)">
          <div style="font-weight:700;font-size:.9rem;color:var(--primary);margin-bottom:6px">
            <i class="fas fa-question-circle" style="margin-right:8px"></i>How do I sell an old book?
          </div>
          <div style="font-size:.85rem;color:var(--text-muted);line-height:1.7">
            Log in, go to Settings → Sell a Book, fill in the details and upload a cover photo.
          </div>
        </div>
        <div style="padding:18px 24px">
          <div style="font-weight:700;font-size:.9rem;color:var(--primary);margin-bottom:6px">
            <i class="fas fa-question-circle" style="margin-right:8px"></i>What payment methods are available?
          </div>
          <div style="font-size:.85rem;color:var(--text-muted);line-height:1.7">
            Currently we support Cash on Delivery (COD) only.
          </div>
        </div>
      </div>
    </div>

  </div>
</div>

<%@ include file="all_component/footer.jsp"%>
</body>
</html>
