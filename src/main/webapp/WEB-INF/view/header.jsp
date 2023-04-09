<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="bootstrap.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-white navbar-light shadow-sm py-3 py-lg-0 px-3 px-lg-0">
    <a href="${pageContext.request.contextPath}/home" class="navbar-brand ms-lg-5">
        <h1 class="m-0 text-uppercase text-dark"><i class="bi bi-shop fs-1 text-primary me-3"></i>Star Paws</h1>
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav ms-auto py-0">
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Home</a>
                <div class="dropdown-menu m-0">
                    <a href="${pageContext.request.contextPath}/aboutUs" class="dropdown-item">About US</a>
                    <a href="${pageContext.request.contextPath}/faq" class="dropdown-item">FAQ</a>
                </div>
            </div>
            <a href="about.html" class="nav-item nav-link">Shop</a>
            <a href="service.html" class="nav-item nav-link">Account</a>
            <a href="product.html" class="nav-item nav-link">Cart</a>

            <a href="${pageContext.request.contextPath}/contactUs" class="nav-item nav-link nav-contact bg-primary text-white px-5 ms-lg-5">Contact <i class="bi bi-arrow-right"></i></a>
        </div>
    </div>
</nav>

</body>
</html>
