
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Star Paws</title>
</head>
<body>
Initial Post Team Project

<a href="${pageContext.request.contextPath}/demo">/demo.action Go to Demo JSP</a>
<br>
<a href="${pageContext.request.contextPath}/test">/test.action Go to Demo JSP</a>
<br>
<hr>


<form action="receiveProperty" method="post">
    name: <input type="text" name="username"> <br>
    email: <input type="text" name="email"> <br>
    <input type="submit" value="submit">
</form>

<h2>save user to pojo</h2>
<form action="receiveParam" method="post">
    Name: <input type="text" name="name"> <br>
    Email: <input type="text" name="email"> <br>
    <input type="submit" value="submit">
</form>
<br>
<h3>Save User</h3>
<form action="saveUser" method="post">
    Name: <input type="text" name="name"> <br>
    Email: <input type="text" name="email"> <br>
    <input type="submit" value="submit">
</form>
<br>

<a href="getUsers">Return Json list for user</a>
<hr>
<a href="doReturnView">Click link go to show page</a>

<img src="static/images/p1.png" alt="p1">
</body>
</html>
