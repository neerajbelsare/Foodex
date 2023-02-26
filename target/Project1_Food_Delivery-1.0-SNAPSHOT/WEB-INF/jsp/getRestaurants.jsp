<%-- 
    Document   : getRestaurants
    Created on : Feb 26, 2023, 8:08:37 PM
    Author     : mrina
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
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
String query = request.getParameter("query");
if (query != null && query.length() > 2) {
  try {
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
    PreparedStatement ps = conn.prepareStatement("select res_name from restaurants where res_name like ?");
    ps.setString(1, "%" + query + "%");
    ResultSet rs = ps.executeQuery();
    while (rs.next()) {
      out.println("<a class='dropdown-item' href='#'>" + rs.getString("name") + "</a>");
    }
    rs.close();
    ps.close();
    conn.close();
  } catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
  }
}
%>

    </body>
</html>
