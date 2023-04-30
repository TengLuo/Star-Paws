<%@ page import="jhu.petstore.entity.db.User" %>
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
</style>
<body>
<%
    User user = (User) session.getAttribute("user_profile");
    String userId = (String) session.getAttribute("user_id");
    String firstName = user.getFirstName();
    String lastName = user.getLastName();
    String email = user.getEmail();
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

        <div class="tab-pane" id="order-history" role="tabpanel" aria-labelledby="order-history-tab">Order History</div>
    </div>

    <script>
        $(function () {
            $('#myTab li:last-child a').tab('show')
        })
    </script>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>