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
    }
    .container{
        max-width: 1140px;
    }
    .d-flex{
        display: flex;
        flex-direction: row;
        background: #f6f6f6;
        border-radius: 0 0 5px 5px;
        padding: 25px;
    }
    .order-info{
        flex: 2;
    }
    .title{
        background: -webkit-gradient(linear, left top, right bottom, color-stop(0, #5195A8), color-stop(100, #7AB730));
        background: #7AB730;
        border-radius:5px 5px 0 0 ;
        padding: 20px;
    }
    h2{
        margin: 0;
        padding-left: 15px;
        color: #FFFFFF;
    }
    .required{
        color: red;
    }
    label, table{
        display: block;
        margin: 15px;
    }
    label>span{
        float: left;
        width: 25%;
        margin-top: 12px;
        padding-right: 10px;
    }
    input[type="text"], input[type="tel"], input[type="email"], select
    {
        width: 70%;
        height: 30px;
        padding: 5px 10px;
        margin-bottom: 10px;
        border: 1px solid #dadada;
        color: #888;
    }
    select{
        width: 70%;
        height: 30px;
        padding: 5px 10px;
        margin-bottom: 10px;
    }
    .order-info{
        margin-top: 15px;
        height: auto;
        padding: 20px;
        border: 1px solid #dadada;
    }
    table{
        margin: 0;
        padding: 0;
    }
    th{
        border-bottom: 1px solid #dadada;
        padding: 10px 0;
    }
    tr>td:nth-child(1){
        text-align: left;
        color: #2d2d2a;
        width: 70%;
    }

    tr>td:nth-child(2){
        width: 10%;
    }

    tr>td:nth-child(3){
        text-align: right;
        color: #52ad9c;
        width: 20%;
    }
    td{
        /*border-bottom: 1px solid #dadada;*/
        padding: 15px 10px 10px 0;
        vertical-align: top;
    }

    p{
        display: block;
        color: #888;
        margin: 0;
        padding-left: 25px;
    }
    .order-info>div{
        padding: 15px 0;
    }

    .confirmation-header-border {
        border-bottom: 1px solid #dadada;
    }
</style>
<body>
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
                                                <h3 style="font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; line-height: 24px; padding: 15px;"> Order Confirmation # 2345678</h3>
                                                <div style="font-weight: 600; padding: 15px;">Delivery Address</div>
                                                <div style="padding-left: 15px;">675 Massachusetts Avenue<br>11th Floor<br>Cambridge, MA 02139</div>
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
                <tr class="confirmation-header-border">
                    <th colspan="2">Your Order Information</th>
                </tr>
                <tr>
                    <td class="product-name">Pedigree Complete Nutrition Grilled Steak & Vegetable Flavor Dog Kibble Adult Dry Dog Food</td>
                    <td class="product-quant">x 2</td>
                    <td class="product-total">$88.00</td>
                </tr>
                <tr>
                    <td class="product-name">Pedigree Complete Nutrition Grilled Steak & Vegetable Flavor Dog Kibble Adult Dry Dog Food</td>
                    <td class="product-quant">x 2</td>
                    <td class="product-total">$88.00</td>
                </tr>
                <tr>
                    <td class="order-subtotal-header">Subtotal</td>
                    <td class="order-placeholder"></td>
                    <td class="order-subtotal">$88.00</td>
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