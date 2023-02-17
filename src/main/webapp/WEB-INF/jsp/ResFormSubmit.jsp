
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
          crossorigin="anonymous">
    <title>Form Submitted | Foodex</title>
</head>
<body style="font-family: 'Poppins', sans-serif">
<%@ include file="header-bg-dark.jsp"%>
<br><br><br><br><br>
<div class="container">
    <div class="row">
        <div class="col">
            <h2 align="center" style="font-weight: 600; display: block;">Congratulations!</h2><br>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <p align="center" style="color: #6b6b6b; font-size: 1.5em; display: block">Thank you for registering your restaurant with us! Your requested has been submitted. Our team will verify all the credentials and
                let you know through your email address.</p><br>
        </div>
    </div>
    <div class="row">
        <div class="col" style="display: flex; justify-content: center; align-items: center">
            <a href="home"><button class="btn btn-primary" style="background-color: #1e53ff; color: white; border-radius: 30px; padding: 10px; outline: none; border: none">Return Home</button></a>
        </div>
    </div>
</div>
<br><br><br><br><br>
<%@ include file="footer.jsp"%>
</body>
</html>
