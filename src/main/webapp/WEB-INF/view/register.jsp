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
  <title>Register</title>
  <title>Sign In</title>
  <!-- MDB icon -->
  <link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon" />
  <!-- Font Awesome -->
  <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
  />
  <!-- Google Fonts Roboto -->
  <link
          rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"
  />
  <!-- MDB -->
  <link rel="stylesheet" href="css/mdb.min.css" />
</head>
<style>
  .register-container {
    margin: 0 auto;
    margin-top: 100px;
    margin-bottom: 100px;
    width: 500px;
    height: 750px;

      .check-bottom {
        margin-left: -25px;
      }
  }
</style>
<body>
<jsp:include page="header.jsp" />
<div class="register-container">
  <form>
    <!-- Name input -->
    <div class="form-outline mb-4">
      <label class="form-label" for="firstName">First Name</label>
      <input type="text" id="firstName" class="form-control" />
    </div>

    <div class="form-outline mb-4">
      <label class="form-label" for="lastName">Last Name</label>
      <input type="text" id="lastName" class="form-control" />
    </div>

    <!-- Username input -->
    <div class="form-outline mb-4">
      <label class="form-label" for="registerUsername">Username</label>
      <input type="text" id="registerUsername" class="form-control" />
    </div>

    <!-- Email input -->
    <div class="form-outline mb-4">
      <label class="form-label" for="registerEmail">Email</label>
      <input type="email" id="registerEmail" class="form-control" />
    </div>

    <!-- Password input -->
    <div class="form-outline mb-4">
      <label class="form-label" for="registerPassword">Password</label>
      <input type="password" id="registerPassword" class="form-control" />
    </div>

    <!-- Repeat Password input -->
    <div class="form-outline mb-4">
      <label class="form-label" for="registerRepeatPassword">Repeat password</label>
      <input type="password" id="registerRepeatPassword" class="form-control" />
    </div>

    <!-- Checkbox -->
    <div class="form-check d-flex justify-content-center mb-4">
      <label class="form-check-label" for="registerCheck">
        <input class="form-check-input me-2 check-bottom" type="checkbox" value="" id="registerCheck" checked
               aria-describedby="registerCheckHelpText" />
        I have read and agree to the terms
      </label>
    </div>

    <!-- Submit button -->
    <button type="submit" class="btn btn-primary btn-block mb-3">Sign in</button>
  </form>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
