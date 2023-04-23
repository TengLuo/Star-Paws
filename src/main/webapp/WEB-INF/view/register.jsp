<%@ page import="jhu.petstore.entity.db.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous">
</script>
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
<%
  User user= (User)session.getAttribute("user");
  String firstName = user != null ? user.getFirstName() : "Null";
  String lastName = user != null ? user.getLastName() : "Null";
  String email = user != null ? user.getEmail() : "Null";
  String userId = user != null ? user.getUserId() : "Null";

//  if (user == null) {
//    user = new UserData();
//  }
%>
<div class="register-container">
  <div id="response-error"></div>
  <form method="POST" onsubmit="return handleSubmit('/spring_mvc_war_exploded/register')">
    <!-- Name input -->
    <div class="form-outline mb-4">
      <label class="form-label" for="first_name">First Name</label>
      <input type="text" id="first_name" class="form-control" required value="<%= firstName %>" />
    </div>

    <div class="form-outline mb-4">
      <label class="form-label" for="last_name">Last Name</label>
      <input type="text" id="last_name" class="form-control" required value="<%= lastName %>"/>
    </div>

    <!-- Username input -->
    <div class="form-outline mb-4">
      <label class="form-label" for="user_id">Username</label>
      <input type="text" id="user_id" class="form-control" required value="<%= userId %>"/>
    </div>

    <!-- Email input -->
    <div class="form-outline mb-4">
      <label class="form-label" for="email">Email</label>
      <input type="email" id="email" class="form-control" required value="<%= email %>"/>
    </div>

    <!-- Password input -->
    <div class="form-outline mb-4">
      <label class="form-label" for="password">Password</label>
      <input type="password" id="password" class="form-control" required/>
    </div>

    <!-- Checkbox -->
    <div class="form-check d-flex justify-content-center mb-4">
      <label class="form-check-label" for="registerCheck">
        <input class="form-check-input me-2 check-bottom" type="checkbox" value="" id="registerCheck" checked
               aria-describedby="registerCheckHelpText" required/>
        I have read and agree to the terms
      </label>
    </div>

    <!-- Submit button -->
    <button id="submit-form" class="btn btn-primary btn-block mb-3">Sign in</button>
  </form>
</div>
<jsp:include page="footer.jsp" />
<script>
  function handleSubmit(url) {
    return fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include',
      body: JSON.stringify({
        "user_id": document.getElementById("user_id").value,
        "password": document.getElementById("password").value,
        "first_name": document.getElementById("first_name").value,
        "last_name": document.getElementById("last_name").value,
        "email": document.getElementById("email").value
      })
    }).then((response) => {
      if (response.status !== 200) {
        document.getElementById('response-error').innerHTML = "Email/UserID is existed";
      }
    })
  };
  // function handleSubmit(url) {
  //   $.post(url, $('form').serialize() ,function(data){
  //     console.log(data);
  //   });
  //   return;
  // }
</script>
</body>
</html>
