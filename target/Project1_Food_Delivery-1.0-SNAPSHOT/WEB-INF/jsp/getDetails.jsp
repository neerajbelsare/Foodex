<%-- 
    Document   : get_data
    Created on : Feb 12, 2023, 11:43:21 AM
    Author     : mrina
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                long resId = Long.parseLong(request.getParameter("res_id"));
                System.out.println(resId);

                // Connect to database and prepare statement
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
                PreparedStatement stmt = con.prepareStatement("SELECT * FROM restaurants WHERE res_id = ?");
                stmt.setLong(1, resId);

                // Execute query and get result set
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    %>
                    <p><%= rs.getString("res_name") %></p>
                    <p><%= rs.getString("address") %></p>
                    <%
                } else {
                    %>
                    <p>No data found.</p>
                    <%
                }

                // Clean up resources
                rs.close();
                stmt.close();
                con.close();
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        %>
    </body>
</html>