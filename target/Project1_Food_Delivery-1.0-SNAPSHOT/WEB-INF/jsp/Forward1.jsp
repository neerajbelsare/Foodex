<%-- 
    Document   : Forward1
    Created on : Jan 26, 2023, 10:24:52 PM
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
        <% String m=(String) request.getAttribute("EM");
        %>
        <div align="center">
        <form action="deletefin" method="get">
            <h1>Enter Code Sent to this Email ID: <%=m%></h1>
            <br>
            Code <input type="text" name="a">
            <br><br>
                <input type="submit" value="click">
        </form>
        </div>
    </body>
</html>
