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
  <form>
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

    <!-- 2 column grid layout for inline styling -->
<%--    <div class="row mb-4">--%>
<%--      <div class="col d-flex justify-content-center">--%>
<%--        <!-- Checkbox -->--%>
<%--        <div class="form-check">--%>
<%--          <input class="form-check-input" type="checkbox" value="" id="form2Example31" checked />--%>
<%--          <label class="form-check-label" for="form2Example31"> Remember me </label>--%>
<%--        </div>--%>
<%--      </div>--%>

<%--      <div class="col">--%>
<%--        <!-- Simple link -->--%>
<%--        <a href="#!">Forgot password?</a>--%>
<%--      </div>--%>
<%--    </div>--%>

    <!-- Submit button -->
    <button type="button" class="btn btn-primary btn-block mb-4">Sign in</button>

    <!-- Register buttons -->
    <div class="text-center">
      <p>Not a member? <a href="${pageContext.request.contextPath}/register">Register</a></p>
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
