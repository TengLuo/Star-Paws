<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        padding-top: 100px;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgb(0,0,0);
        background-color: rgba(0,0,0,0.4);
    }

    /* Modal Content */
    .modal-content {
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
    }

    /* The Close Button */
    .close {
        color: #aaaaaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }

    #register-btn {
        color: #7AB730;
    }

    #response-error {
        text-align: center;
        color: red;
    }

    #signIn-error {
        text-align: center;
        color: red;
    }
</style>
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
                    <div id="signIn" class="dropdown-item">Sign In</div>
                    <div id="register" class="dropdown-item">Register</div>
                    <a href="${pageContext.request.contextPath}/account" class="dropdown-item">Account</a>
                </div>
            </div>
        </div>
    </div>
</nav>

<!-- Modal HTML -->
<div id="signIn-modal" class="modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Sign In</h5>
                <button type="button" class="signIn-close close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div id="signIn-error"></div>
                <form id="signIn-form" method="POST" onsubmit="return handleSignIn('/spring_mvc_war_exploded/login')">
                    <!-- Email input -->
                    <div class="form-outline mb-4">
                        <label class="form-label" for="user_email">Email address</label>
                        <input type="email" id="user_email" class="form-control" />
                    </div>

                    <!-- Password input -->
                    <div class="form-outline mb-4">
                        <label class="form-label" for="user_password">Password</label>
                        <input type="password" id="user_password" class="form-control" />
                    </div>

                    <!-- Submit button -->
                    <input type="submit" class="btn btn-primary btn-block mb-4" value="Sign in">

                    <!-- Register buttons -->
                    <div class="text-center">
                        <p>Not a member?
                            <a id="register-btn">Register</a>
                        </p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="register-modal" class="modal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Register</h5>
                <button type="button" class="register-close close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div id="response-error"></div>
                <form id="register-form" method="POST" onsubmit="return handleSubmit('/spring_mvc_war_exploded/register')">
                    <!-- Name input -->
                    <div class="form-outline mb-4">
                        <label class="form-label" for="first_name">First Name</label>
                        <input type="text" id="first_name" class="form-control" required />
                    </div>

                    <div class="form-outline mb-4">
                        <label class="form-label" for="last_name">Last Name</label>
                        <input type="text" id="last_name" class="form-control" required/>
                    </div>

                    <!-- Username input -->
                    <div class="form-outline mb-4">
                        <label class="form-label" for="user_id">Username</label>
                        <input type="text" id="user_id" class="form-control" required/>
                    </div>

                    <!-- Email input -->
                    <div class="form-outline mb-4">
                        <label class="form-label" for="email">Email</label>
                        <input type="email" id="email" class="form-control" required/>
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
                    <button id="submit-form" class="btn btn-primary btn-block mb-3">Register</button>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    // Get the modal
    var SignInModal = document.getElementById("signIn-modal");
    var RegisterModal = document.getElementById("register-modal");
    // Get the button that opens the modal
    var signInBtn = document.getElementById("signIn");
    var registerBtn = document.getElementById("register-btn");
    // Get the button that closes the modal
    var signInClose = document.getElementsByClassName("signIn-close")[0];
    var registerClose = document.getElementsByClassName("register-close")[0];
    // When the user clicks the button, open the modal
    signInBtn.onclick = function() {
        SignInModal.style.display = "block";
    }
    registerBtn.onclick = function () {
        SignInModal.style.display = "none";
        RegisterModal.style.display = "block";
    }
    // When the user clicks on <span> (x), close the modal
    signInClose.onclick = function() {
        SignInModal.style.display = "none";
    }
    registerClose.onclick = function() {
        RegisterModal.style.display = "none";
    }

    function handleSubmit(url) {
        const form = document.getElementById("register-form");
        const data = new FormData(form);
        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: data
        }).then((response) => {
            if (response.status !== 200) {
                document.getElementById('response-error').innerHTML = "Email/UserID is existed";
            } else {
                RegisterModal.style.display = "none";
                SignInModal.style.display = "block";
            }
        })
        return false;
    };

    function handleSignIn(url) {
        const form = document.getElementById("signIn-form");
        const data = new FormData(form);
        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: data
        }).then((response) => {
            if (response.status !== 200) {
                document.getElementById('signIn-error').innerHTML = "User name and password does not match";
            } else {
                SignInModal.style.display = "none";
            }
        })
        return false;
    };
</script>
</body>
</html>
