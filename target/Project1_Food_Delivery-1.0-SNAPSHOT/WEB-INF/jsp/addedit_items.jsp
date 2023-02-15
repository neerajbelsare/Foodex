<%-- 
    Document   : addedit_items
    Created on : Feb 15, 2023, 12:10:43 AM
    Author     : mrina
--%>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.util.Base64" %>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<%int cnt=0;%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
          crossorigin="anonymous">
        
         <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@3.6.12/dist/css/splide.min.css">
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
        
        <title>Foodex | Restauratns and their items</title>
        
        <style>
/*            h2{
                text-indent: 20px;  
            }*/
            nav{
                background-color: lightgray;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg nav-main navbar-light" id="nav-main">
            <div class="container-fluid">
                <img src="<c:url value="/resources/img/logo-exp-light.png" />" alt="Foodex Logo" width="120px" style="margin-left: 40px;" />
            </div>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <div class="col">
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
                    <h2>Hello <%=session.getAttribute("userName")%>, <%=cnt%> Restaurants are under you</h5>
                </div>            
            </div>
<!--                <div class="row">
                    <div class="col">
                        
                    </div>
                </div>-->
        </div>         
            
        
<!--        <div class="one"></div>-->
        
        <%@ include file="footer.jsp" %>
        
    </body>
</html>
