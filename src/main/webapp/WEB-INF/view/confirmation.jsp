<%@ page import="jhu.petstore.entity.db.Product" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="bootstrap.jsp" %>
<html>
<head>
    <title>Star Paw Confirmation</title>
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
</style>
<body>
<%
    List<Product> cart = (List<Product>) session.getAttribute("cart");
    float confirmationNum = (float) session.getAttribute("confirmation_num");
    DecimalFormat dfOrder = new DecimalFormat("#");
    dfOrder.setMaximumFractionDigits(8);
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
        <div>
            <table class="confirmation-container" >
                <tr>
                    <td>
                        <table style="max-width:600px;">
                            <tr>
                                <td style="padding: 0px 20px 20px 0px;" >
                                    <table style="max-width:600px;">
                                        <tr>
                                            <td style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px;">
                                                <img src="https://img.icons8.com/carbon-copy/100/000000/checked-checkbox.png" width="125" height="120" style="display: block; border: 0px;" /><br>
                                                <h2 style="font-size: 30px; font-weight: 800; line-height: 36px; color: #333333; margin: 0;">
                                                    Thank You For Your Order!
                                                </h2>
                                                <h3 style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px; padding: 15px;"> Order Confirmation #<%= dfOrder.format(confirmationNum) %></h3>
<%--                                                <div style="font-weight: 600; padding: 15px;">Delivery Address</div>--%>
<%--                                                <div style="padding-left: 15px;">675 Massachusetts Avenue<br>11th Floor<br>Cambridge, MA 02139</div>--%>
                                            </td>
                                        </tr>
                                    </table>
                            </tr>
                        </table>
                </tr>
            </table>
        </div>

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
        </div><!-- order-info -->
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>