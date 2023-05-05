<%--
  Created by IntelliJ IDEA.
  User: teng
  Date: 4/9/2023
  Time: 1:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="bootstrap.jsp" %>
<html>
<head>
    <title>Contact Us</title>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container-fluid py-5">
    <div class="container">
        <div class="row gx-5">
            <div class="col-lg-5 mb-5 mb-lg-0" style="min-height: 500px;">
                <div class="position-relative h-100">
                    <img class="position-absolute w-100 h-100 rounded" src="https://www.petsworld.in/blog/wp-content/uploads/2015/09/cat-nikon.jpg" style="object-fit: cover;">
                </div>
            </div>
            <div class="col-lg-7">
                <div class="border-start border-5 border-primary ps-5 mb-5">
                    <h6 class="text-primary text-uppercase">Contact Us</h6>
                    <h1 class="display-5 text-uppercase mb-0">Get in touch with Star-Paws</h1>
                </div>
                <div class="bg-light p-4">
                    <h5>Location:</h5>
                    <p>123 Street, New York, USA</p>
                    <h5>Email:</h5>
                    <p><a href="mailto:info@example.com">info@example.com</a></p>
                    <h5>Mobile:</h5>
                    <p>+012 345 67890</p>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
