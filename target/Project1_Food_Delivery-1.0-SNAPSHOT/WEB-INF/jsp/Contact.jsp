<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Contact US</title>
</head>
<body>
<div align="center">
    <h1>Your problems are our problems, please tell us what bothers you!!</h1>
    <form action="contact" method="post">
        <!--                    <td>How can we help you:</td>-->
        <select name = "dropdown">
            <option value = "Difficulty in ordering online" selected>Difficulty in ordering online</option>
            <option value = "Want to give suggestions/feedback">Want to give suggestions/feedback</option>
            <option value = "Problems faced while running the app/website">
                Problems faced while running the app/website</option>
            <option value = "Information incorrect/outdated">Information incorrect/outdated</option>
        </select>
        <br><br>
        Enter Your Full Name <input type="text">
        <br><br>
        Enter Your Email <input type="text">
        <br><br>
        <textarea rows = "5" cols = "60" name = "description">
            </textarea><br><br>
        <input type="submit" value="Submit">
    </form>
</div>
</body>
</html>