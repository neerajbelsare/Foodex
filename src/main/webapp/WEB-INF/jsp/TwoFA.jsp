<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
          crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <link href="<c:url value="/resources/css/settings.css" />" rel="stylesheet">
    <title>Two Factor Authentication | Foodex</title>
</head>
<body>
<%@ include file="header-bg-dark.jsp"%>
<br><br>
<div class="container">
    <div class="row">
        <div class="col" style="display: flex; justify-content: center; align-items: center">
            <h3 style="font-weight: 700">Enter Two-Factor Code From Google Authenticator</h3><br><br>
        </div>
    </div>
    <br><br>
    <div class="row">
        <div class="col">
            <form action="twofa" method="post" id="form">
                <input class="form-control form-check twofa-input" placeholder="Two-Factor Code" name="a" style="width: 40%" required/><br>
                <input class="btn btn-primary twofa-input" value="Submit" type="submit">
            </form>
        </div>
    </div>
</div>

<%@ include file="footer.jsp"%>
</body>
</html>
