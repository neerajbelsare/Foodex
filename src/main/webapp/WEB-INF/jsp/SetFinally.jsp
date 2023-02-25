<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
              rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
              crossorigin="anonymous">
        <title>Password Reset | Foodex</title>
        <style>
            * {
                font-family: 'Poppins', sans-serif;
            }
        </style>
    </head>
    <body>
    <%@ include file="header-bg-dark.jsp"%>
        <div align="center">
        <br>
        <form action="login" method="get">
            <br><br><h3 style="font-weight: 700">Your password has been reset successfully!</h3>
            <br>
            <br>
            <a href="login" class="btn-primary btn">Return to Login</a>
        </form>
        </div>
    <%@ include file="footer.jsp"%>
    </body>
</html>
