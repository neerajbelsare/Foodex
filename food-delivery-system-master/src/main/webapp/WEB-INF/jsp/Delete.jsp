<%-- 
    Document   : Delete
    Created on : Jan 26, 2023, 10:24:11 PM
    Author     : mrina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div align="center">
            <h1>Enter Details</h1>
        <form action="deleteuser" method="post">
            Enter valid Email <input type="text" name="a">
            <br><br>
            Enter Your Password <input type="text" name="b">
                <br><br>
                <input type="submit" value="click">
                <br><br>
                <b>(* Form returns back, if entered invalid or non existing Email ID or Password)
        </form>
        </div>
    </body>
</html>
