<%@ page import="jhu.petstore.entity.db.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DecimalFormat" %><%--
  Created by IntelliJ IDEA.
  User: teng
  Date: 4/15/2023
  Time: 11:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="bootstrap.jsp" %>
<html>
<head>
    <title>Production</title>
</head>
<body>
<%

    List<Product> products = (List<Product>) session.getAttribute("products");
    List<Product> cart = (List<Product>) session.getAttribute("cart");
    DecimalFormat df = new DecimalFormat("#.##");
    double total = 0;
    double tax = 0.08;
    if(cart != null){
        for (Product product : cart) {
            double itemPrice = product.getPrice() * product.getQuantity();
            total += itemPrice;
        }

        total = Double.parseDouble(df.format(total));
        tax = total * 0.08;
        tax = Double.parseDouble(df.format(tax));
    }

    boolean cartCleared = session.getAttribute("cartCleared") != null && (boolean) session.getAttribute("cartCleared");
    if (cartCleared) {
        total = 0;
        tax = 0;
        session.removeAttribute("cartCleared");
    }
%>
<jsp:include page="header.jsp" />

<section class="h-100 h-custom" style="background-color: #eee;">
    <div class="container py-5 h-100">
        <div class="row">
            <div class="col-lg-9">
                <div class="card mb-4">
                    <div class="card-header">
                        <h5 class="mb-0">Shopping Cart</h5>
                    </div>
                    <div class="card-body">
                        <% if (products != null) { %>
                        <% for (Product product : products) { %>
                        <div class="row mb-4">
                            <div class="col-md-5 col-lg-3 col-xl-2">
                                <div class="mb-3 mb-md-0">
                                    <img src="<%= product.getImg() %>" class="img-fluid rounded-3" alt="<%= product.getName() %>" width="100%">
                                </div>
                            </div>
                            <div class="col-md-7 col-lg-9 col-xl-10">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h6 class="mb-0"><%= product.getName() %></h6>
                                    </div>
                                    <div class="text-end">
                                        <h6 class="mb-0">$<%= product.getPrice() %></h6>
                                        <form method="post" action="/spring_mvc_war_exploded/cart/addItem" class="d-inline-flex">
                                            <input type="hidden" name="itemId" value="<%= product.getId() %>">
                                            <input type="number" name="quantity" min="1" value="1" style="width: 60px;">
                                            <button class="btn btn-sm btn-outline-primary ms-2" type="submit">Add</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <% } %>
                        <% } %>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="card mb-4">
                    <div class="card-header">
                        <h5 class="mb-0">Summary</h5>
                    </div>
                    <div class="card-body">
                        <p class="mb-1">Total: $<%= total %></p>
                        <p class="mb-1">Tax: $<%= tax %></p>
                        <form method="post" action="/spring_mvc_war_exploded/cart/proceed">
                            <button class="btn btn-primary w-100" type="submit">Proceed to Checkout</button>
                        </form>
                        <form method="post" action="/spring_mvc_war_exploded/cart/clear">
                            <button class="btn btn-warning w-100" type="submit">Clear</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="footer.jsp" />
</body>
</html>
