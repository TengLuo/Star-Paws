<%@ page import="jhu.petstore.entity.db.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="lombok.Data" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="jhu.petstore.entity.db.Product" %>

<%--
  Created by IntelliJ IDEA.
  User: teng
  Date: 4/15/2023
  Time: 11:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="bootstrap.jsp" %>
<html>
<head>
    <title>Cart</title>
</head>
<body>
<%
/*
    Product p1 = new Product(1, "Pedigree Complete Nutrition Grilled Steak & Vegetable Flavor Dog Kibble Adult Dry Dog Food", "https://image.chewy.com/is/image/catalog/362455_MAIN._AC_SL600_V1668014570_.jpg", 29.98, "dog", 5);
    Product p2 = new Product(6, "Purina Pro Plan LIVECLEAR Adult 7+ Prime Plus Longer Life Formula Dry Cat Food", "https://image.chewy.com/is/image/catalog/276045_MAIN._AC_SL600_V1649125370_.jpg", 23.48, "cat", 6);
    Product p3 = new Product(7, "Fancy Feast Savory Puree Naturals Salmon & Tuna Flavored in a Demi-Glace Squeezable Adult Cat Treats", "\thttps://image.chewy.com/is/image/catalog/645806_MAIN._AC_SL600_V1664894516_.jpg", 3.5, "cat", 7);
*/

    List<Product> cart = (List<Product>) session.getAttribute("cart");
    int itemNum = (cart != null) ? cart.size() : 0;
    DecimalFormat df = new DecimalFormat("#.##");
    int shipping = 0;
    double subTotal = 0;
    double total = 0;
    double tax = 0.08;
    if(cart != null){
        for (Product product : cart) {
            double itemPrice = product.getPrice() * product.getQuantity();
            subTotal += itemPrice;
        }

        subTotal = Double.parseDouble(df.format(subTotal));
        total = subTotal * (1 + tax) + shipping;
        total = Double.parseDouble(df.format(total));
    }


%>
<jsp:include page="header.jsp"/>

<section class="h-100 h-custom" style="background-color: #eee;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col">
                <div class="card">
                    <div class="card-body p-4">
                        <div class="row">
                            <div class="col-lg-7">
                                <h5 class="mb-3"><a href="${pageContext.request.contextPath}/shop" class="text-body"><i
                                        class="fas fa-long-arrow-alt-left me-2"></i>Continue shopping</a></h5>
                                <hr>
                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <div>
                                        <p class="mb-1">Shopping cart</p>
                                        <p class="mb-0">You have <%=itemNum%> items in your cart</p>
                                    </div>
                                </div>
                                <% if (cart != null) { %>
                                <% for (Product product : cart) { %>
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div style="width: 100px;">
                                                <img src="<%= product.getImg() %>"
                                                     class="img-fluid rounded-3"
                                                     alt="<%= product.getName() %>" width="100%">
                                            </div>
                                            <div class="ms-3 d-flex justify-content-between align-items-center" style="width: calc(100% - 100px);">
                                                <div style="word-wrap: break-word;">
                                                    <h6 class="mb-0"><%= product.getName() %></h6>
                                                </div>
                                                <div class="text-end">
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <h6 class="mb-0 me-2"><%= product.getQuantity() %></h6>
                                                        <h6 class="mb-0">$<%= product.getPrice() %></h6>
                                                        <form method="post" action="/spring_mvc_war_exploded/cart/deleteItem">
                                                            <input type="hidden" name="itemId" value="<%= product.getId() %>">
                                                            <button class="btn btn-sm btn-outline-primary ms-2" type="submit">Delete</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <% } %>
                                <% } %>
                            </div>


                            <div class="col-lg-5">
                                <div class="card bg-primary text-white rounded-3">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-center mb-4">
                                            <h5 class="mb-0">Card details</h5>
                                        </div>

                                        <p class="small mb-2">Card type</p>
                                        <a href="#!" type="submit" class="text-white"><i
                                                class="fab fa-cc-mastercard fa-2x me-2"></i></a>
                                        <a href="#!" type="submit" class="text-white"><i
                                                class="fab fa-cc-visa fa-2x me-2"></i></a>
                                        <a href="#!" type="submit" class="text-white"><i
                                                class="fab fa-cc-amex fa-2x me-2"></i></a>
                                        <a href="#!" type="submit" class="text-white"><i
                                                class="fab fa-cc-paypal fa-2x"></i></a>

                                        <form class="mt-4">
                                            <div class="form-outline form-white mb-4">
                                                <input type="text" id="typeName" class="form-control form-control-lg"
                                                       siez="17"
                                                       placeholder="Cardholder's Name"/>
                                                <label class="form-label" for="typeName">Cardholder's Name</label>
                                            </div>

                                            <div class="form-outline form-white mb-4">
                                                <input type="text" id="typeText" class="form-control form-control-lg"
                                                       siez="17"
                                                       placeholder="1234 5678 9012 3457" minlength="19" maxlength="19"/>
                                                <label class="form-label" for="typeText">Card Number</label>
                                            </div>

                                            <div class="row mb-4">
                                                <div class="col-md-6">
                                                    <div class="form-outline form-white">
                                                        <input type="text" id="typeExp"
                                                               class="form-control form-control-lg"
                                                               placeholder="MM/YYYY" size="7" id="exp" minlength="7"
                                                               maxlength="7"/>
                                                        <label class="form-label" for="typeExp">Expiration</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-outline form-white">
                                                        <input type="password" id="typeText2"
                                                               class="form-control form-control-lg"
                                                               placeholder="&#9679;&#9679;&#9679;" size="1"
                                                               minlength="3" maxlength="3"/>
                                                        <label class="form-label" for="typeText">Cvv</label>
                                                    </div>
                                                </div>
                                            </div>

                                        </form>

                                        <hr class="my-4">

                                        <div class="d-flex justify-content-between">
                                            <p class="mb-2">Subtotal</p>
                                            <p class="mb-2">$<%= subTotal %>
                                            </p>
                                        </div>

                                        <div class="d-flex justify-content-between">
                                            <p class="mb-2">Shipping</p>
                                            <p class="mb-2">$<%= shipping %>
                                            </p>
                                        </div>

                                        <div class="d-flex justify-content-between mb-4">
                                            <p class="mb-2">Total(Incl. taxes)</p>
                                            <p class="mb-2">$<%= total %>
                                            </p>
                                        </div>

                                        <a href="${pageContext.request.contextPath}/checkout" class="btn btn-info btn-block btn-lg <% if (cart == null || cart.isEmpty()) { %>disabled<% } %>">
                                            <div class="d-flex justify-content-between">
                                                <span>$<%= total %></span>
                                                <span>Checkout <i class="fas fa-long-arrow-alt-right ms-2"></i></span>
                                            </div>
                                        </a>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<jsp:include page="footer.jsp"/>
</body>
</html>
