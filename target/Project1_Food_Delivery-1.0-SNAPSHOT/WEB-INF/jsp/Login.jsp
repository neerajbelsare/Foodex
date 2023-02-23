<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login to your Account | Foodex</title>
    <link href="<c:url value="/resources/css/login.css" />" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <style>
        .carousel-div{
            background: url("<c:url value="/resources/img/register-carousel1.jpg" />");
            background-repeat: no-repeat;
            background-size: cover;
            height: 100vh;
            z-index: 1;
        }
    </style>
</head>
<body>
<div class="container-fluid carousel-div">
    <div class="row">
        <div class="col register-div logo-div">
            <img src="<c:url value="/resources/img/logo-exp.png" />" alt="Foodex Logo" width="500px" />
        </div>
        <div class="col login-div">
            <form action="loginform" method="post" class="login-form" id="form">
                <h3 class="form-heading">Login</h3><br>
                <p class="form-subhead">New to Foodex? <a href="register" class="link">Create an Account</a></p><br>
                <input type="text" name = "a" placeholder="Username" class="input-login" id="username"/>
                <input type="password" name = "b" placeholder="Password" class="input-login" id="password" />
                <a href="forgot" class="link forgot-pass">Forgot Password?</a><br>
                <input type="submit" value="Login" class="login-submit" />
            </form>
        </div>
    </div>
</div>
<script>
    const form = document.getElementById("form");
    form.addEventListener("submit", function(event) {
    const a = document.getElementById("username");
    const b = document.getElementById("password");

    if (!a.value || !b.value) {
    alert("All fields are required.");
    event.preventDefault();
    }
    });
</script>
</body>
</html>
