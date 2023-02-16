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
<%int cnt=0;int cnt1=0;%>
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
            h2{
                margin-top: 10px;
            }
            .btn-circle.btn-sm {
                width: 150px;
                height: 40px;
                padding: 6px 0px;
                border-radius: 10px;
                font-size: 15px;
                text-align: center;
            }
            button a {
                text-decoration: none;
                color: black;
            }
        </style>
    </head>
    <body>
        
        <%@ include file="header-bg-dark.jsp" %>
        
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
                        
                        PreparedStatement stmt1 = con.prepareStatement("select count(*) from items where res_id in (select res_id from restaurants where username = ?)");
                        stmt1.setString(1, usnm);

                        ResultSet rst = stmt1.executeQuery();
                        while (rst.next()) {
                                    cnt1 = rst.getInt(1);
                                }

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
                    <h2 >Hello <%=session.getAttribute("userName")%>, <%=cnt%> Restaurants are under you, with <%=cnt1%> Items</h2>
                </div>            
            </div>
                <div class="row" style="margin-top: 10px;">
                <div class="col">
                    <form method="get">
                        <input type="text" name="search" placeholder="Search...">
                        <input type="submit" value="Search">
                    </form>
                </div>
                <button class="btn btn-warning btn-circle btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop2" type="button">
                        Delete an item
            </button>
            </div>
                <div class="row">
                    <div class="col">
                        <%
                    String searchQuery = request.getParameter("search");
                    boolean isSearched = false;
                    
                    if (searchQuery != null && !searchQuery.isEmpty()){
                    isSearched=true;
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
                            String query = "select * from items where item_id like '%"+searchQuery+"%' or item_name like '%"+searchQuery+"%'";

                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery(query);
//                            out.print("<table>");
                            %>
                            <table class="table table-striped table-hover users-table">
                            <tr>
                                <th>Item ID</th>
                                <th>Item name</th>
                                <th>Price</th>
                                <th>Rating</th>
                                <th>Description</th>
                            </tr>
                            <%
                        while (rs.next()) {
                            out.println("<tr>");%>
                            <td><%= rs.getString("item_id")%></td>
                            <td><%= rs.getString("item_name")%></td>
                            <td><%= rs.getString("price")%></td>
                            <td><%= rs.getString("rating")%></td>
                            <td><%= rs.getString("description")%></td>                            
                            <%out.println("</tr>");
                        }%>
                        </table>
                            <%
                            rs.close();
                            stmt.close();
                            con.close();
                        } catch (Exception e) {
                            out.print("Error: " + e.getMessage());
                        }
                    }
                %>
                    </div>
                </div>
                    <div class="row">
                        <div class="col">
                            All existing <%=cnt1%> Items!!
                        </div>
                    </div>
            <div class="row">
            <div class="col" style="display: flex; justify-content: center;align-items: center;margin-top: 10px;">
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
                        PreparedStatement stmt = con.prepareStatement("select * from items where res_id in (select res_id from restaurants where username = ?)");
                        stmt.setString(1, usnm);
                        
                        ResultSet rs = stmt.executeQuery();
                %>
                        <table class="table table-striped table-hover users-table">
                            <tr>
                                <th>Item ID</th>
                                <th>Item name</th>
                                <th>Price</th>
                                <th>Rating</th>
                                <th>Description</th>
                            </tr>
                            <%
                        while (rs.next()) {
                            out.println("<tr>");%>
                            <td><%= rs.getString("item_id")%></td>
                            <td><%= rs.getString("item_name")%></td>
                            <td><%= rs.getString("price")%></td>
                            <td><%= rs.getString("rating")%></td>
                            <td><%= rs.getString("description")%></td>                            
                            <%out.println("</tr>");
                        }%>
                        </table>

            <%rs.close();
                        stmt.close();
                        con.close();
                    } catch (SQLException e) {
                        out.println("SQL Error: " + e.getMessage());
                    } catch (ClassNotFoundException e) {
                        out.println("Class Not Found Error: " + e.getMessage());
                    }
                %>
            </div>
        </div>
            <div class="row">
                <div class="col">
                    
                    <div class="modal fade" id="staticBackdrop2" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Enter item ID to delete</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="itemdelete" method="post">
                                        <label for="item_id">Enter the item ID: </label>
                                        <input type="text" id="item_id" name="item_id">
                                        <br><br>
                                        <input class="btn btn-warning btn-circle btn-sm" onclick="return confirm('Are you sure you want to delete this item?');" type="submit" value="Submit">
                                      </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-warning btn-circle btn-sm" data-bs-dismiss="modal">Clear All</button>
<!--                                    <button type="button" class="btn btn-warning btn-circle btn-sm">Add</button>-->
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
    </div>
                    <div class="row">
                        <div class="col">
                            <a href="dashboard" class="text-reset">
                                <button class="btn btn-warning btn-circle btn-sm" type="submit">
                                    Back
                                </button>
                            </a>
                        </div>
                    </div>
        </div>         
            
        
<!--        <div class="one"></div>-->
        
        <%@ include file="footer.jsp" %>
        
    </body>
</html>
