<%@ page import="jhu.petstore.entity.db.User" %><%--
  Created by IntelliJ IDEA.
  User: teng
  Date: 4/15/2023
  Time: 11:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ include file="bootstrap.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
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
  <title>Sign In</title>
</head>
<style>
  .signin-container {
    margin: 0 auto;
    margin-top: 100px;
    margin-bottom: 100px;
    width: 500px;
    height: 500px;
  }
</style>
<body>
<jsp:include page="header.jsp" />
<div class="signin-container">
  <form action="/spring_mvc_war_exploded/login" method="POST">
    <!-- Email input -->
    <div class="form-outline mb-4">
      <input type="email" id="form2Example1" class="form-control" />
      <label class="form-label" for="form2Example1">Email address</label>
    </div>

    <!-- Password input -->
    <div class="form-outline mb-4">
      <input type="password" id="form2Example2" class="form-control" />
      <label class="form-label" for="form2Example2">Password</label>
    </div>

    <!-- Submit button -->
    <button type="button" class="btn btn-primary btn-block mb-4">Sign in</button>

    <!-- Register buttons -->
    <div class="text-center">
      <p>Not a member? <a href="${pageContext.request.contextPath}/register-page">Register</a></p>
      <p>or sign up with:</p>
      <button type="button" class="btn btn-link btn-floating mx-1">
        <i class="fab fa-facebook-f"></i>
      </button>

      <button type="button" class="btn btn-link btn-floating mx-1">
        <i class="fab fa-google"></i>
      </button>

      <button type="button" class="btn btn-link btn-floating mx-1">
        <i class="fab fa-twitter"></i>
      </button>

      <button type="button" class="btn btn-link btn-floating mx-1">
        <i class="fab fa-github"></i>
      </button>
    </div>
  </form>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
