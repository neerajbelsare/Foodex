<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Foodex | Contact US</title>
</head>
<body>
    <%@ include file="header-bg-dark.jsp"%>
    
<div align="center">
    <h3>Your problems are our problems, please tell us what bothers you!!</h3>
    <form action="contact" method="post">
        <select name = "dropdown">
            <option value = "Difficulty in ordering online" selected>Difficulty in ordering online</option>
            <option value = "Want to give suggestions/feedback">Want to give suggestions/feedback</option>
            <option value = "Problems faced while running the app/website">
                Problems faced while running the app/website</option>
            <option value = "Information incorrect/outdated">Information incorrect/outdated</option>
        </select>
        <br><br>
        Enter Your Full Name <input type="text" id="name" name="name">
<!--        <p id = "error-msg1" class = "error-msg">Unknown error</p>-->
        <br><br>
        Enter Your Email <input type="text" id="email" name="email">
<!--        <p id = "error-msg2" class = "error-msg">Unknown error</p>-->
        <br><br>
        <textarea rows = "5" cols = "60" placeholder="Enter your problem" name ="description" id="text">
            </textarea>
<!--        <p id = "error-msg3" class = "error-msg">Unknown error</p>-->
        <br><br>
        <input type="submit" value="Submit">
    </form>
</div>
    
    <%@ include file="footer.jsp"%>
    
    <script>
        function onContClick(){
        if (document.getElementById('name').value.length === 0)
        {
            document.getElementById('name').style.borderBottom = '2px solid red'
            document.getElementById('error-msg1').style.display = 'block'
            document.getElementById('error-msg1').innerHTML = 'This is a required field!'
        }

        if (document.getElementById('email').value.length === 0)
        {
            document.getElementById('email').style.borderBottom = '2px solid red'
            document.getElementById('error-msg2').style.display = 'block'
            document.getElementById('error-msg2').innerHTML = 'This is a required field!'
        }

        if (document.getElementById('text').value.length === 0)
        {
            document.getElementById('text').style.borderBottom = '2px solid red'
            document.getElementById('error-msg3').style.display = 'block'
            document.getElementById('error-msg3').innerHTML = 'This is a required field!'
        }

        if(document.getElementById('name').value.length === 0 ||
            document.getElementById('email').value.length === 0 ||
            document.getElementById('text').value.length === 0
        )
        {
            document.getElementById("register-submit").style.backgroundColor = '#949494'
            document.getElementById("register-submit").disabled = true
        }

        else {
            document.getElementById('error-msg1').style.display = 'none'
            document.getElementById('error-msg2').style.display = 'none'
            document.getElementById('error-msg3').style.display = 'none'
        }
    }
    </script>    
</body>
</html>