<%@ page import="jhu.petstore.entity.db.Product" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="bootstrap.jsp" %>
<html>
<head>
    <title>Star Paw Checkout</title>
</head>
<style>
    @import url('https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700');
    body{
        background: url('http://all4desktop.com/data_images/original/4236532-background-images.jpg');
        font-family: 'Roboto Condensed', sans-serif;
        color: #262626;
        margin: 5% 0;
    }
    .container{
        margin-top: 30px;
        width: 100%;
        padding-right: 15px;
        padding-left: 15px;
        margin-right: auto;
        margin-left: auto;
        max-width: 1250px;
    }
    .container .d-flex{
        display: flex;
        flex-direction: row;
        background: #f6f6f6;
        border-radius: 0 0 5px 5px;
        padding: 25px;
    }
    .container form{
        flex: 4;
    }
    .container .order-info{
        flex: 2;
    }
    .container .title{
        background: -webkit-gradient(linear, left top, right bottom, color-stop(0, #5195A8), color-stop(100, #7AB730));
        background: #7AB730;
        border-radius:5px 5px 0 0 ;
        padding: 20px;
    }
    .container h2{
        margin: 0;
        padding-left: 15px;
        color: #FFFFFF;
    }
    .container .required{
        color: red;
    }
    .container label, table{
        display: block;
        margin: 15px;
    }
    .container label>span{
        float: left;
        width: 25%;
        margin-top: 12px;
        padding-right: 10px;
    }
    .container input[type="text"], input[type="tel"], input[type="email"], select
    {
        width: 70%;
        height: 30px;
        padding: 5px 10px;
        margin-bottom: 10px;
        border: 1px solid #dadada;
        color: #888;
    }
    .container select{
        width: 70%;
        height: 30px;
        padding: 5px 10px;
        margin-bottom: 10px;
    }
    .container .order-info{
        margin-top: 15px;
        height: auto;
        padding: 20px;
        border: 1px solid #dadada;
    }
    .container table{
        margin: 0;
        padding: 0;
    }
    .container th{
        border-bottom: 1px solid #dadada;
        padding: 10px 0;
    }
    .container tr>td:nth-child(1){
        text-align: left;
        color: #2d2d2a;
        width: 70%;
    }

    .container tr>td:nth-child(2){
        width: 10%;
    }

    .container tr>td:nth-child(3){
        text-align: right;
        color: #52ad9c;
        width: 20%;
    }
    .container td{
        /*border-bottom: 1px solid #dadada;*/
        padding: 15px 10px 10px 0;
        vertical-align: top;
    }

    .container p{
        display: block;
        color: #888;
        margin: 0;
        padding-left: 25px;
    }
    .container .order-info>div{
        padding: 15px 0;
    }
    .container .order-button{
        padding: 10px;
        border: none;
        border-radius: 30px;
        background: #52ad9c;
        color: #fff;
        font-size: 15px;
        font-weight: bold;
        width: 125px;
        margin: 15px;
        text-align: center;
        left: 45%;
        position: relative;
    }
    .container .order-button:hover{
        cursor: pointer;
        background: #428a7d;
    }
</style>
<body>
<%
    List<Product> cart = (List<Product>) session.getAttribute("cart");
    int itemNum = (cart != null) ? cart.size() : 0;
    DecimalFormat df = new DecimalFormat("#.##");
    int shipping = 0;
    double subTotal = 0;
    double total = 0;
    double tax = 0.08;
    if(cart != null){
        for (Product product : cart) {
            double itemPrice = product.getPrice() * product.getQuantity();
            subTotal += itemPrice;
        }

        subTotal = Double.parseDouble(df.format(subTotal));
        total = subTotal * (1 + tax) + shipping;
        total = Double.parseDouble(df.format(total));
    }


%>
<jsp:include page="header.jsp" />
<div class="container">
    <div class="title">
        <h2>Product Order Form</h2>
    </div>
    <div class="d-flex">
        <form id="address-form" method="POST" onsubmit="return handleOrder()">
            <label>
                <span class="fname">First Name <span class="required">*</span></span>
                <input type="text" name="fname" id="fname" required>
            </label>
            <label>
                <span class="lname">Last Name <span class="required">*</span></span>
                <input type="text" name="lname" id="lname" required>
            </label>
            <label>
                <span>Country <span class="required">*</span></span>
                <select name="selection" required>
                    <option value="select">Select a country...</option>
                    <option value="US">United States</option>
                </select>
            </label>
            <label>
                <span>Street Address <span class="required">*</span></span>
                <input type="text" name="houseadd" id="houseadd" placeholder="House number and street name" required>
            </label>
            <label>
                <span>&nbsp;</span>
                <input type="text" name="apartment" id="apartment" placeholder="Apartment, suite, unit etc. (optional)">
            </label>
            <label>
                <span>Town / City <span class="required">*</span></span>
                <input type="text" name="city" id="city" required>
            </label>
            <label>
                <span>State / County <span class="required">*</span></span>
                <input type="text" name="city" id="state" required>
            </label>
            <label>
                <span>Postcode / ZIP <span class="required">*</span></span>
                <input type="number" name="zipcode" id="zipcode" required>
            </label>
            <label>
                <span>Phone <span class="required">*</span></span>
                <input type="tel" name="telephone" required>
            </label>
            <label>
                <span>Email Address <span class="required">*</span></span>
                <input type="email" name="email" id="emailAddress" required>
            </label>
            <input type="submit" class="order-button" value="Place Order">
        </form>
        <div class="order-info">
            <table>
                <tr style="border-bottom: 1px solid #dadada;">
                    <th colspan="2">Your order information</th>
                </tr>
                <% if (cart != null) { %>
                <% for (Product product : cart) { %>
                <tr>
                    <td class="product-name"><%= product.getName() %></td>
                    <td class="product-quant"><%= product.getQuantity() %></td>
                    <td class="product-total">$<%= product.getPrice() %></td>
                </tr>
                <% } %>
                <% } %>
                <tr>
                    <td>Total(Incl. taxes)</td>
                    <td></td>
                    <td>$<%= total %></td>
                </tr>
                <tr>
                    <td>Shipping</td>
                    <td></td>
                    <td>Free</td>
                </tr>
            </table><br>
            <div>
                <input type="radio" name="dbt" value="dbt" checked> Direct Bank Transfer
            </div>
            <p>
                Make your payment directly into our bank account. Please use your Order ID as the payment reference. Your order will not be shipped until the funds have cleared in our account.
            </p>
        </div><!-- order-info -->
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
<script>
    const handleOrder = () => {
        const address = document.getElementById("houseadd").value + "," + document.getElementById("city").value + "," + document.getElementById("state").value + "," + document.getElementById("zipcode").value
        fetch('/spring_mvc_war_exploded/order', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({
                "order_date": new Date().toLocaleString(),
                "address": address,
                "email": document.getElementById("emailAddress").value,
                "first_name": document.getElementById("fname").value,
                "last_name": document.getElementById("lname").value
            })
        }).then((response) => {
            if (response.status !== 200) {
                document.getElementById('signIn-error').innerHTML = "You failed to create a order";
            } else {
                window.location.href = "${pageContext.request.contextPath}/confirmation";
            }
        })
        return false
    }
</script>
</html>