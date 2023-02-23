<%-- 
    Document   : DisplayProfile
    Created on : Jan 28, 2023, 5:52:14 PM
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
<!--        obj.addAttribute("NM",rs.getString("name"));
                obj.addAttribute("PHN",rs.getString("phone_number"));
                obj.addAttribute("USNM",rs.getString("username"));
                obj.addAttribute("EM",rs.getString("email"));-->
        <% String p=(String) request.getAttribute("NM");
        String q=(String) request.getAttribute("PHN");
        String r=(String) request.getAttribute("USNM");
        String s=(String) request.getAttribute("EM");
        String t=(String) request.getAttribute("ADD");
        %>
        <div align="center">
        <form action="success" method="get">
            <h1>Name:<%=p%></h1>
            <br>
            Username:<%=r%>
            Phone Number:<%=q%>
            Email:<%=s%>
            Address: <%=t%>
            <br><br>
                <input type="submit" value="Back to Dashboard">
        </form>
        </div>
    </body>
</html>
