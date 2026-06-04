<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Saturni E-Books | Checkout</title>
<%@include file="all_component/allCss.jsp"%>
<style>
.checkout-wrap { padding: 50px 0; min-height: 80vh; }
.checkout-card {
  background: white; border-radius: 20px;
  box-shadow: var(--shadow-md); border: 1px solid var(--border);
  overflow: hidden;
}
.checkout-card-header {
  background: linear-gradient(135deg, var(--dark-2), var(--dark-3));
  padding: 20px 28px; color: white;
  display: flex; align-items: center; gap: 12px;
}
.checkout-card-header h5 { margin: 0; font-weight: 700; font-size: 1rem; }
.checkout-card-body { padding: 24px 28px; }

.cart-table { width: 100%; }
.cart-table th {
  font-size: .75rem; font-weight: 700; text-transform: uppercase;
  letter-spacing: .8px; color: var(--text-muted);
  padding: 0 0 14px; border-bottom: 2px solid var(--border);
}
.cart-table td {
  padding: 14px 0; border-bottom: 1px solid rgba(108,99,255,.07);
  font-size: .9rem; color: var(--text-primary);
}
.cart-table tr:last-child td { border-bottom: none; }
.cart-table .book-name-cell { font-weight: 600; }
.cart-table .price-cell { color: var(--secondary); font-weight: 700; }

.total-row {
  background: linear-gradient(135deg, rgba(108,99,255,.08), rgba(108,99,255,.04));
  border-radius: 12px; padding: 14px 18px; margin-top: 16px;
  display: flex; justify-content: space-between; align-items: center;
}
.total-row .label { font-weight: 700; color: var(--text-primary); }
.total-row .value { font-size: 1.2rem; font-weight: 800; color: var(--primary); }

.btn-remove {
  background: transparent; color: var(--secondary);
  border: 1.5px solid var(--secondary); padding: 5px 12px;
  border-radius: 16px; font-size: .72rem; font-weight: 700;
  font-family: 'Poppins', sans-serif; cursor: pointer;
  transition: var(--t); text-decoration: none;
  display: inline-flex; align-items: center; gap: 4px;
}
.btn-remove:hover { background: var(--secondary); color: white; }

.form-row-m { display: flex; gap: 16px; flex-wrap: wrap; margin-bottom: 16px; }
.form-col { flex: 1; min-width: 160px; }
.form-select-m {
  width: 100%; border: 2px solid #e9ecef; border-radius: 12px;
  padding: 12px 16px; font-size: .9rem;
  font-family: 'Poppins', sans-serif; transition: var(--t);
  background: #fafbff; color: var(--text-primary);
  appearance: none;
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='8' viewBox='0 0 12 8'%3E%3Cpath fill='%236b7280' d='M6 8L0 0h12z'/%3E%3C/svg%3E");
  background-repeat: no-repeat; background-position: right 16px center;
}
.form-select-m:focus { border-color: var(--primary); box-shadow: 0 0 0 4px rgba(108,99,255,.1); outline: none; }

.btn-order-now {
  background: linear-gradient(135deg, #f9ca24, #e17b20);
  color: white; border: none; padding: 13px 30px;
  border-radius: 25px; font-size: .95rem; font-weight: 700;
  font-family: 'Poppins', sans-serif; cursor: pointer;
  transition: var(--t); display: inline-flex; align-items: center; gap: 8px;
}
.btn-order-now:hover { transform: translateY(-2px); box-shadow: 0 10px 28px rgba(249,202,36,.4); }

.btn-continue {
  background: transparent; color: var(--primary);
  border: 2px solid var(--primary); padding: 12px 26px;
  border-radius: 25px; font-size: .9rem; font-weight: 700;
  font-family: 'Poppins', sans-serif; text-decoration: none;
  display: inline-flex; align-items: center; gap: 8px; transition: var(--t);
}
.btn-continue:hover { background: var(--primary); color: white; text-decoration: none; transform: translateY(-2px); }

.alert-checkout {
  border: none; border-radius: 12px; padding: 12px 18px;
  font-size: .85rem; font-weight: 500; font-family: 'Poppins', sans-serif;
  margin-bottom: 20px; display: flex; align-items: center; gap: 10px;
}
.alert-checkout-danger  { background: rgba(239,68,68,.1);  color: #dc2626; border-left: 3px solid #dc2626; }
.alert-checkout-success { background: rgba(16,185,129,.1); color: #059669; border-left: 3px solid #059669; }
</style>
</head>
<body>

<c:if test="${empty userobj}"><c:redirect url="login.jsp"/></c:if>

<%@ include file="all_component/navbar.jsp"%>

<div class="checkout-wrap" style="background: var(--light)">
  <div class="container">

    <nav style="margin-bottom:24px;font-size:.82rem;color:var(--text-muted)">
      <a href="index.jsp" style="color:var(--primary);text-decoration:none">Home</a>
      <span style="margin:0 8px;opacity:.5">/</span>
      <span>Checkout</span>
    </nav>

    <c:if test="${not empty succMsg}">
      <div class="alert-checkout alert-checkout-success"><i class="fas fa-check-circle"></i> ${succMsg}</div>
      <c:remove var="succMsg" scope="session"/>
    </c:if>
    <c:if test="${not empty failedMsg}">
      <div class="alert-checkout alert-checkout-danger"><i class="fas fa-exclamation-circle"></i> ${failedMsg}</div>
      <c:remove var="failedMsg" scope="session"/>
    </c:if>

    <div class="row">

      <!-- Cart items -->
      <div class="col-lg-5 mb-4">
        <div class="checkout-card">
          <div class="checkout-card-header">
            <i class="fas fa-shopping-cart"></i>
            <h5>Your Cart</h5>
          </div>
          <div class="checkout-card-body">
            <%
            User u = (User) session.getAttribute("userobj");
            CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
            List<Cart> cart = dao.getBookByUser(u.getId());
            double totalPrice = 0;
            for (Cart c : cart) { totalPrice += c.getPrice(); }
            %>
            <% if (cart.isEmpty()) { %>
            <div style="text-align:center;padding:30px 0">
              <i class="fas fa-shopping-cart" style="font-size:2.5rem;color:var(--primary);opacity:.25"></i>
              <p style="color:var(--text-muted);margin-top:12px;font-weight:500">Your cart is empty.</p>
              <a href="all_new_book.jsp" class="btn-continue" style="margin-top:8px">Browse Books</a>
            </div>
            <% } else { %>
            <table class="cart-table">
              <thead>
                <tr>
                  <th>Book</th>
                  <th>Author</th>
                  <th style="text-align:right">Price</th>
                  <th style="text-align:right">Action</th>
                </tr>
              </thead>
              <tbody>
                <% for (Cart c : cart) { %>
                <tr>
                  <td class="book-name-cell"><%=c.getBookName()%></td>
                  <td style="color:var(--text-muted)"><%=c.getAuthor()%></td>
                  <td style="text-align:right" class="price-cell"><%=c.getPrice()%> L</td>
                  <td style="text-align:right">
                    <a href="remove_book?bid=<%=c.getBid()%>&uid=<%=c.getUserId()%>&cid=<%=c.getCid()%>"
                       class="btn-remove"><i class="fas fa-trash-alt"></i></a>
                  </td>
                </tr>
                <% } %>
              </tbody>
            </table>
            <div class="total-row">
              <span class="label">Total</span>
              <span class="value"><%=String.format("%.2f", totalPrice)%> L</span>
            </div>
            <% } %>
          </div>
        </div>
      </div>

      <!-- Order form -->
      <div class="col-lg-7 mb-4">
        <div class="checkout-card">
          <div class="checkout-card-header">
            <i class="fas fa-map-marker-alt"></i>
            <h5>Delivery Details</h5>
          </div>
          <div class="checkout-card-body">
            <form action="order" method="post">
              <input type="hidden" name="id" value="${userobj.id}">

              <div class="form-row-m">
                <div class="form-col">
                  <label class="fl">Full Name</label>
                  <input type="text" name="username" class="fc" value="${userobj.name}" required>
                </div>
                <div class="form-col">
                  <label class="fl">Email</label>
                  <input type="email" name="email" class="fc" value="${userobj.email}" required>
                </div>
              </div>
              <div class="form-row-m">
                <div class="form-col">
                  <label class="fl">Phone</label>
                  <input type="number" name="phno" class="fc" value="${userobj.phno}" required>
                </div>
                <div class="form-col">
                  <label class="fl">Address</label>
                  <input type="text" name="address" class="fc" placeholder="Street address" required>
                </div>
              </div>
              <div class="form-row-m">
                <div class="form-col">
                  <label class="fl">City</label>
                  <input type="text" name="city" class="fc" placeholder="City" required>
                </div>
                <div class="form-col">
                  <label class="fl">State / Region</label>
                  <input type="text" name="state" class="fc" placeholder="State" required>
                </div>
                <div class="form-col">
                  <label class="fl">ZIP Code</label>
                  <input type="text" name="zipcode" class="fc" placeholder="ZIP" required>
                </div>
              </div>
              <div class="fg" style="margin-bottom:24px">
                <label class="fl">Payment Method</label>
                <select name="payment" class="form-select-m" required>
                  <option value="noselect">--- Select Payment ---</option>
                  <option value="COD">Cash On Delivery</option>
                </select>
              </div>

              <div style="display:flex;gap:12px;flex-wrap:wrap;align-items:center">
                <button type="submit" class="btn-order-now">
                  <i class="fas fa-check"></i> Place Order
                </button>
                <a href="index.jsp" class="btn-continue">
                  <i class="fas fa-arrow-left"></i> Continue Shopping
                </a>
              </div>
            </form>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>

<%@ include file="all_component/footer.jsp"%>
</body>
</html>
