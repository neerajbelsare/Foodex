<%-- 
    Document   : SetFinally
    Created on : Jan 26, 2023, 10:18:48 PM
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
        <% String m=(String) request.getAttribute("msg");
        %>
        <br>
        <form action="login" method="get">
            <b><%=m%></b>
            <br>
            <br>
                <input type="submit" value="Return to login">
        </form>
        </div>
    </body>
</html>
