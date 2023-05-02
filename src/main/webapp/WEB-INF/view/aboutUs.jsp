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
    <title>About Us</title>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container-fluid py-5">
    <div class="container">
        <div class="row gx-5">
            <div class="col-lg-5 mb-5 mb-lg-0" style="min-height: 500px;">
                <div class="position-relative h-100">
                    <img class="position-absolute w-100 h-100 rounded" src="https://www.petsworld.in/blog/wp-content/uploads/2015/05/dog-kitten.jpg" style="object-fit: cover;">
                </div>
            </div>
            <div class="col-lg-7">
                <div class="border-start border-5 border-primary ps-5 mb-5">
                    <h6 class="text-primary text-uppercase">About Us</h6>
                    <h1 class="display-5 text-uppercase mb-0">At Star-Paws, we're committed to providing the best products and services to keep your pets happy and healthy all the the time.</h1>
                </div>
                <div class="bg-light p-4">
                    <ul class="nav nav-pills justify-content-between mb-3" id="pills-tab" role="tablist">
                        <li class="nav-item w-50" role="presentation">
                            <button class="nav-link text-uppercase w-100 active" id="pills-1-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-1" type="button" role="tab" aria-controls="pills-1"
                                    aria-selected="true">Our Mission</button>
                        </li>
                        <li class="nav-item w-50" role="presentation">
                            <button class="nav-link text-uppercase w-100" id="pills-2-tab" data-bs-toggle="pill"
                                    data-bs-target="#pills-2" type="button" role="tab" aria-controls="pills-2"
                                    aria-selected="false">Our Vision</button>
                        </li>
                    </ul>
                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-1" role="tabpanel" aria-labelledby="pills-1-tab">
                            <p class="mb-0">Our mission is to make pet ownership as joyful and stress-free as possible for both you and your pet. That's why we offer a wide range of services and resources to help you give your pet the best possible care, including pet sitting, dog walking, pet nutrition advice, training tips, and much more.</p>
                        </div>
                        <div class="tab-pane fade" id="pills-2" role="tabpanel" aria-labelledby="pills-2-tab">
                            <p class="mb-0">Our vision is to become the go-to destination for pet owners who want the best products. We strive to offer a wide range of innovative and high-quality products at affordable prices, and to provide exceptional customer service that exceeds our customers' expectations.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
