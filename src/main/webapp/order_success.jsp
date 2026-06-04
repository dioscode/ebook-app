<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Saturni E-Books | Order Placed!</title>
<%@include file="all_component/allCss.jsp"%>
<style>
.success-bg {
  min-height: 100vh;
  background: linear-gradient(135deg, var(--dark) 0%, var(--dark-2) 55%, #0f3460 100%);
  display: flex; align-items: center; justify-content: center;
  position: relative; overflow: hidden; padding: 40px 16px;
}
.success-bg::before {
  content:''; position:absolute;
  width:500px; height:500px;
  background:radial-gradient(circle,rgba(67,233,123,.18) 0%,transparent 65%);
  top:-120px; right:-60px; pointer-events:none;
}
.success-card {
  background: rgba(255,255,255,.98); border-radius: 28px;
  padding: 52px 48px; max-width: 480px; width: 100%;
  text-align: center; position: relative; z-index: 2;
  animation: scaleIn .5s ease both;
  box-shadow: 0 30px 90px rgba(0,0,0,.3);
}
.success-icon {
  width: 80px; height: 80px; border-radius: 50%;
  background: linear-gradient(135deg, #43e97b, #38f9d7);
  display: flex; align-items: center; justify-content: center;
  margin: 0 auto 24px;
  font-size: 2rem; color: white;
  box-shadow: 0 10px 30px rgba(67,233,123,.4);
  animation: pop .6s cubic-bezier(.34,1.56,.64,1) both;
  animation-delay: .3s;
}
@keyframes pop {
  from { transform: scale(0); opacity: 0; }
  to   { transform: scale(1); opacity: 1; }
}
.success-title {
  font-size: 1.7rem; font-weight: 800; color: var(--text-primary);
  margin-bottom: 12px; letter-spacing: -.4px;
}
.success-desc {
  font-size: .9rem; color: var(--text-muted); line-height: 1.8;
  margin-bottom: 32px;
}
.delivery-chips { display: flex; justify-content: center; gap: 10px; flex-wrap: wrap; margin-bottom: 32px; }
.chip {
  background: rgba(108,99,255,.09); color: var(--primary);
  padding: 7px 16px; border-radius: 20px;
  font-size: .78rem; font-weight: 700; display: flex; align-items: center; gap: 6px;
}
</style>
</head>
<body>
<div class="success-bg">
  <div class="success-card">
    <div class="success-icon"><i class="fas fa-check"></i></div>
    <h2 class="success-title">Order Placed!</h2>
    <p class="success-desc">
      Thank you for your order. We've received your request and will process it right away.
      Expected delivery within <strong>24 hours</strong>.
    </p>
    <div class="delivery-chips">
      <div class="chip"><i class="fas fa-truck-moving"></i> Free Delivery</div>
      <div class="chip"><i class="fas fa-money-bill-wave"></i> Cash on Delivery</div>
      <div class="chip"><i class="fas fa-undo-alt"></i> Easy Returns</div>
    </div>
    <div style="display:flex;gap:12px;justify-content:center;flex-wrap:wrap">
      <a href="order.jsp" class="btn-cta btn-cta-solid" style="font-size:.88rem;padding:11px 24px">
        <i class="fas fa-box"></i> View Orders
      </a>
      <a href="index.jsp" class="btn-cta btn-cta-ghost" style="font-size:.88rem;padding:11px 24px;color:var(--primary);border-color:var(--primary)">
        <i class="fas fa-home"></i> Continue Shopping
      </a>
    </div>
  </div>
</div>
</body>
</html>
