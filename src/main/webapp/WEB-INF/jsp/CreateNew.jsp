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
        <title>Set New Password | Foodex</title>
    </head>
    <body>
        <div align="center">
            <h1>Enter New Password</h1>
        <form action="create" method="post">
            Enter new password <input type="text" name="a">
            <br><br>
            Re-enter new password <input type="text">
            <br><br>
                <input type="submit" value="click">
        </form>
        </div>
    </body>
</html>
