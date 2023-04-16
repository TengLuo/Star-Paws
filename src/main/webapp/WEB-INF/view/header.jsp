<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-white navbar-light shadow-sm py-2 py-lg-0 px-3 px-lg-0">
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
                    <a href="${pageContext.request.contextPath}/contactUs" class="dropdown-item">Contact Us</a>
                </div>
            </div>
            <a href="${pageContext.request.contextPath}/shop" class="nav-item nav-link">Shop</a>
            <div>

            </div>
            <a href="${pageContext.request.contextPath}/cart" class="nav-item nav-link">
                <i class="bi bi-cart" ></i> Cart
            </a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle bg-primary text-white px-md-3" data-bs-toggle="dropdown">
                    <i class="bi bi-person"></i>
                    <span>Account</span></a>
                <div class="dropdown-menu m-0">
                    <a href="${pageContext.request.contextPath}/signIn" class="dropdown-item">Sign In</a>
                    <a href="${pageContext.request.contextPath}/register" class="dropdown-item">Register</a>
                </div>
            </div>
        </div>
    </div>
</nav>

</body>
</html>
