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
    <title>Account</title>
</head>
<style>
    .account-container {
        width: 1200px;
        margin: 0 auto;
        margin-top: 30px;
    }
</style>
<body>
<jsp:include page="header.jsp"/>
<div class="account-container">
    <ul class="nav nav-tabs" id="myTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Profile</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="order-history-tab" data-toggle="tab" href="#order-history" role="tab" aria-controls="order-history" aria-selected="false">Order History</a>
        </li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-tab">
            <div class="profile-container">

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