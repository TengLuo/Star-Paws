<%@ page import="jhu.petstore.entity.db.User" %>
<%@ page import="jhu.petstore.util.UserOrder" %>
<%@ page import="java.util.List" %>
<%@ page import="jhu.petstore.util.OrderItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="bootstrap.jsp" %>
<html>
<head>
    <title>Account</title>
</head>
<style>
    .account-container {
        width: 1200px;
        margin: 0 auto;
        margin-top: 30px;
    }

    .account-container .modal-dialog {
        max-width: 1200px;
    }

    .tab-pane {
        padding: 30px;
    }

    .row {
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .col-sm-10 {
        width: 300px;
    }

    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        padding-top: 100px;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgb(0, 0, 0);
        background-color: rgba(0, 0, 0, 0.4);
    }

    .modal-content {
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
    }
</style>
<body>
<%
    User user = (User) session.getAttribute("user_profile");
    String userId = (String) session.getAttribute("user_id");
    String firstName = user.getFirstName();
    String lastName = user.getLastName();
    String email = user.getEmail();

    List<UserOrder> orders = (List<UserOrder>) session.getAttribute("order_history");
%>
<jsp:include page="header.jsp"/>
<div class="account-container">
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile"
               aria-selected="false">Profile</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="order-history-tab" data-toggle="tab" href="#order-history" role="tab"
               aria-controls="order-history" aria-selected="false">Order History</a>
        </li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-tab">
            <div class="profile-container">
                <form id="register-form" method="POST"
                      onsubmit="return handleSubmit('/spring_mvc_war_exploded/register')">
                    <div class="mb-3 row">
                        <label for="firstName" class="col-sm-2 col-form-label">First Name: </label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control-plaintext" id="firstName"
                                   value="<%= firstName %>">
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="lastName" class="col-sm-2 col-form-label">Last Name: </label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control-plaintext" id="lastName"
                                   value="<%= lastName %>"/>
                        </div>
                    </div>

                    <div class="mb-3 row">
                        <label for="userId" class="col-sm-2 col-form-label">User Id: </label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control-plaintext" id="userId"
                                   value="<%= userId %>"/>
                        </div>
                    </div>


                    <div class="mb-3 row">
                        <label for="user_email" class="col-sm-2 col-form-label">Email: </label>
                        <div class="col-sm-10">
                            <input type="text" readonly class="form-control-plaintext" id="user_email"
                                   value="<%= email %>"/>
                        </div>
                    </div>

                </form>
            </div>
        </div>

        <div class="tab-pane" id="order-history" role="tabpanel" aria-labelledby="order-history-tab">
            <table id="tbOrderHistory" class="table border ps-table w-100 mb-3">
                <thead>
                <tr>
                    <th class="font-weight-bold py-2 border-0 quantity">Order Number</th>
                    <th class="font-weight-bold py-2 border-0 ">Created Date</th>
                    <th class="font-weight-bold py-2 border-0 ">Action</th>
                </tr>
                </thead>
                <tbody>
                <% if (orders != null) { %>
                <% for (UserOrder order : orders) { %>
                    <tr>
                        <td><%= order.getOrderNumber() %></td>
                        <td><%= order.getOrderDate() %></td>
                        <td><button data="<%= order.getOrderNumber() %>" class="view-detail" onclick="openModal(this)">View detail</button></td>
                    </tr>
                <% } %>
                <% } %>
                </tbody>
                <tbody>
                </tbody>
            </table>
            <% if (orders != null) { %>
            <% for (UserOrder order : orders) { %>
                <div id="<%= order.getOrderNumber() %>" class="modal" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Order Detail</h5>
                                <button type="button" class="signIn-close close" data="<%= order.getOrderNumber() %>" onclick="closeModal(this)">&times;</button>
                            </div>
                            <div class="modal-body">
                                <table class="table border ps-table w-100 mb-3">
                                    <thead>
                                        <tr>
                                            <th class="font-weight-bold py-2 border-0 quantity">Product Name</th>
                                            <th class="font-weight-bold py-2 border-0 ">Product Quant</th>
                                            <th class="font-weight-bold py-2 border-0 ">Unit Price</th>
                                            <th class="font-weight-bold py-2 border-0 ">Total Price</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (OrderItem item : order.getItem()) { %>
                                        <tr>
                                            <td><%= item.getProductName() %></td>
                                            <td><%= item.getProductQuant() %></td>
                                            <td><%= item.getProductPrice() %> </td>
                                            <td><%= item.getTotalPrice() %> </td>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            <% } %>
            <% } %>
            </div>
    </div>

    <script>
        $(function () {
            $('#myTab li:last-child a').tab('show')
        })

        function openModal (ele) {
            document.getElementById(ele.getAttribute("data")).style.display = "block";
        }

        function closeModal (ele) {
            document.getElementById(ele.getAttribute("data")).style.display = "none";
        }
    </script>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>