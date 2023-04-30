<%@ page import="jhu.petstore.entity.db.Product" %>
<%@ page import="java.util.List" %><%--
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


%>
<jsp:include page="header.jsp" />

<section class="h-100 h-custom" style="background-color: #eee;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col">
                <div class="card">
                    <div class="card-body p-4">
                        <div class="row">
                            <div class="col-lg-7">

                                <% if (products != null) { %>
                                <% for (Product product : products) { %>
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
                                                        <h6 class="mb-0">$<%= product.getPrice() %></h6>
                                                        <form method="post" action="/spring_mvc_war_exploded/cart/addItem">
                                                            <input type="hidden" name="itemId" value="<%= product.getId() %>">
                                                            <button class="btn btn-sm btn-outline-primary ms-2" type="submit">Add</button>
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

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>
