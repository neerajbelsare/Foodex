<%-- 
    Document   : addedit_items
    Created on : Feb 15, 2023, 12:10:43 AM
    Author     : mrina
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%int cnt=0;%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Foodex | Restaurants and their items</title>
    </head>
    <body>
        
        Hello
        <%=session.getAttribute("userName")%>
        <%
        String usnm = (String) session.getAttribute("userName");
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
            PreparedStatement stmt = con.prepareStatement("select count(*) from restaurants where username=?");
            stmt.setString(1, usnm);
            
            ResultSet rs = stmt.executeQuery();
           while (rs.next()) {
                        cnt = rs.getInt(1);
                    }
            }
        catch (Exception k)
        {
        System.out.println(k.getMessage());
            }
        %>
        <br><h4 class="res-heading"><%=cnt%> Restaurants are under You</h4>
        
        <%@ include file="footer.jsp" %>
        
    </body>
</html>
