<%--
  Created by IntelliJ IDEA.
  User: teng
  Date: 4/9/2023
  Time: 1:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="bootstrap.jsp" %>
<html>
<head>
    <title>Faq</title>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container-fluid py-5">
    <div class="container">
        <div class="row gx-5">
            <div class="col-lg-5 mb-5 mb-lg-0" style="min-height: 500px;">
                <div class="position-relative h-100">
                    <img class="position-absolute w-100 h-100 rounded" src="https://www.petsworld.in/blog/wp-content/uploads/2015/09/rockstar-cat.jpg" style="object-fit: cover;">
                </div>
            </div>
            <div class="col-lg-7">
                <div class="border-start border-5 border-primary ps-5 mb-5">
                    <h6 class="text-primary text-uppercase">Frequently Asked Questions</h6>
                    <h1 class="display-5 text-uppercase mb-0">Your questions about Star-Paws, answered here.</h1>
                </div>
                <div class="bg-light p-4">
                    <div class="accordion" id="faqAccordion">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingOne">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                    What types of products do you carry in your store?
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#faqAccordion">
                                <div class="accordion-body">
                                    We carry a wide variety of pet supplies, including food, treats, toys, and accessories for dogs, cats.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    Can I return or exchange a product if I am not satisfied?
                                </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#faqAccordion">
                                <div class="accordion-body">
                                    We stand behind the quality of our products and want you to be completely satisfied with your purchase. If you are not happy with an item, please contact us within 30 days of your purchase to arrange for a return or exchange.
                                </div>
                            </div>
                        </div>
                        <!-- Add more questions and answers in the same format -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
