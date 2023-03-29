<%--
  Created by IntelliJ IDEA.
  User: luote
  Date: 3/11/2023
  Time: 9:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Star Paws</title>
</head>
<body>
Initial Post Team Project

<a href="${pageContext.request.contextPath}/demo.action">/demo.action Go to Demo JSP</a>
<br>
<a href="${pageContext.request.contextPath}/test.action">/test.action Go to Demo JSP</a>
<br>
<hr>


<form action="receiveProperty.action" method="post">
    name: <input type="text" name="username"> <br>
    email: <input type="text" name="email"> <br>
    <input type="submit" value="submit">
</form>

<h2>save user to pojo</h2>
<form action="receiveParam.action" method="post">
    Name: <input type="text" name="name"> <br>
    Email: <input type="text" name="email"> <br>
    <input type="submit" value="submit">
</form>
<br>
<h3>Save User</h3>
<form action="saveUser.action" method="post">
    Name: <input type="text" name="name"> <br>
    Email: <input type="text" name="email"> <br>
    <input type="submit" value="submit">
</form>
<br>

<a href="getUsers.action">Return Json list for user</a>
<hr>
<a href="doReturnView.action">Click link go to show page</a>

</body>
</html>
