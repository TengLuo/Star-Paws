<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="bootstrap.jsp" %>
<html>
<head>
    <title>Home</title>
</head>
<body>
<%@ include file="header.jsp" %>


<!-- Offer Start -->
<div class="container-fluid bg-offer my-5 py-5">
    <div class="container py-5">
        <div class="row gx-5 justify-content-start">
            <div class="col-lg-7">
                <div class="border-start border-5 border-dark ps-5 mb-5">
                    <h6 class="text-dark text-uppercase">Special Offer</h6>
                    <h1 class="display-5 text-uppercase text-white mb-0">Save 50% on all items your first order</h1>
                </div>
                <a href="${pageContext.request.contextPath}/shop" class="btn btn-light py-md-3 px-md-5 me-3">Shop Now</a>
            </div>
        </div>
    </div>
</div>
<!-- Offer End -->






<%@ include file="footer.jsp" %>
</body>
</html>