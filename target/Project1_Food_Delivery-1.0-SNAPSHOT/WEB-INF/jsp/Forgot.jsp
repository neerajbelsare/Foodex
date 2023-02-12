<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
              rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
              crossorigin="anonymous">
        <link href="<c:url value="/resources/css/forgot.css" />" rel="stylesheet">
        <title>Forgot Password | Foodex</title>
    </head>
    <body>
    <%@ include file="header-bg-dark.jsp"%>
    <div class="main-container1">
        <div class="forgot-pass-div">
            <br><br><h3 style="font-weight: 800!important;">Forgot your Password?</h3><br><br>
            <p style="color: #6b6b6b; text-align: center; margin-left: 40px; margin-right: 40px">We understand that forgetting your password can be
                frustrating. To reset your password, please fill your details. You will receive a link on your email if your account exists.</p><br><br>

            <form action="forgot" method="post" class="forgot-pass-form" id="form">
                <input type="text" name="a" class="form-input" placeholder="Email" id="email"><br>
                <input type="text" name="b" class="form-input" placeholder="Username" id="username"><br><br>
                <input type="submit" value="   Submit   " class="btn-primary btn"><br><br><br>
            </form>
        </div>
    </div>

    <%@ include file="footer.jsp"%>

    <script>
        const form = document.getElementById("form");
        form.addEventListener("submit", function(event) {
            const a = document.getElementById("email");
            const b = document.getElementById("username");

            if (!a.value || !b.value) {
                alert("All fields are required.");
                event.preventDefault();
            }
        });
    </script>
    </body>
</html>
