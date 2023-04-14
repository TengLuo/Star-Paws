<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="bootstrap.jsp" %>
<html>
<head>
    <title>Star Paws</title>
</head>
<body>
<jsp:include page="header.jsp" />
<h3>Message: ${msg}</h3>
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    Featured
                </div>
                <div class="card-body">
                    <h5 class="card-title">Special title treatment</h5>
                    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="app">
    <h1>{{ msg }}</h1>
    <h1>{{ sayHello() }}</h1>
    <h1>{{20+20}}</h1>
</div>

<script>
    new Vue({
        el: '.app',
        data: {
            msg: '${msg}',
            sayHello: function (){
                console.log('${msg}');
            }
        }
    });
</script>



<%@ include file="footer.jsp" %>
</body>
</html>