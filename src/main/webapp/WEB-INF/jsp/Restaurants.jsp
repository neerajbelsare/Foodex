<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: NEERAJ BELSARE
  Date: 04-02-2023
  Time: 18:05
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%int cnt1=0,cnt2=0;%>

<html>
<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,0" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<c:url value="/resources/css/admin.css" />" rel="stylesheet">
    <style>
        .btn-circle.btn-sm {
            width: 150px;
            height: 40px;
            padding: 6px 0px;
            border-radius: 10px;
            font-size: 15px;
            text-align: center;
        }
        .modal-inner{
            background-color: white;
            border: 1px solid black;
            padding: 20px;
            width: 50%;
            height: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        button a {
            text-decoration: none;
            color: black;
        }
    </style>
    <title>Users | Foodex</title>
</head>
<body>
<div class="sidebar close">
    <div class="logo-details">
        <img src="<c:url value="/resources/img/logo.png" />" alt="Foodex Logo" width="35px" style="margin-left: 20px"/>
        <span class="logo_name"><img src="<c:url value="/resources/img/logo-exp.png" />" alt="Foodex Logo" width="120px" style="margin-left: 20px"/></span>
    </div>
    <ul class="nav-links">
        <li>
            <a href="admin">
                <i class='bx bx-grid-alt' ></i>
                <span class="link_name">Overview</span>
            </a>
            <ul class="sub-menu blank">
                <li><a class="link_name" href="admin">Overview</a></li>
            </ul>
        </li>
        <li>
            <a href="users">
                <i class='bx bx-user'></i>
                <span class="link_name">Users</span>
            </a>
            <ul class="sub-menu blank">
                <li><a class="link_name" href="users">Users</a></li>
            </ul>
        </li>
        <li>
            <a href="Restaurantsdash">
                <i class='bx bx-restaurant' ></i>
                <span class="link_name">Restaurants</span>
            </a>
            <ul class="sub-menu blank">
                <li><a class="link_name" href="#">Restaurants</a></li>
            </ul>
        </li>
<!--        <li>
            <div class="iocn-link">
                <a href="#">
                    <i class='bx bx-book-alt' ></i>
                    <span class="link_name">Reports</span>
                </a>
                <i class='bx bxs-chevron-down arrow' ></i>
            </div>
            <ul class="sub-menu">
                <li><a class="link_name" href="#">Reports</a></li>
                <li><a href="#">User Reports</a></li>
                <li><a href="#">Restaurant Reports</a></li>
                <li><a href="#">User Feedback</a></li>
            </ul>
        </li>
        <li>
            <a href="#">
                <i class='bx bx-line-chart' ></i>
                <span class="link_name">Analytics</span>
            </a>
            <ul class="sub-menu blank">
                <li><a class="link_name" href="#">Analytics</a></li>
            </ul>
        </li>-->
    </ul>
</div>
<section class="home-section">
    <div class="home-content">
        <i class='bx bx-menu' ></i>
    </div>

    <br>
    <div class="container">
        <div class="row">
            <div class="col">
                <h4 style="font-family: 'Poppins', sans-serif">All Restaurants</h4><br>
            </div>
        </div>
        
        <div class="row">
        <div class="col">
            <%
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
                    Statement state = con.createStatement();

                    ResultSet rst = state.executeQuery("select count(*) from restaurants");
                    while (rst.next()) {
                        cnt1 = rst.getInt(1);
                    }
                }
                catch (Exception k){
                    System.out.println(k.getMessage());
                }
            %>
            <h6 class="res-heading"><%=cnt1%> restaurants</h6>
        </div>
    </div>
        
        <div class="row">
            <div class="col" style="display: flex; justify-content: center;align-items: center">
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
                        PreparedStatement stmt = con.prepareStatement("select * from restaurants");

                        ResultSet rs = stmt.executeQuery();
                %>

                        <table class="table table-striped table-hover users-table">
                            <tr>
                                <th>FSSAI Number</th>
                                <th>Name of Restaurant</th>
                                <th>Name of The Manager</th>
                                <th>Email</th>
                                <th>Phone no. of Manager</th>
                                <th>Address</th>
                                <th>Restaurant Phone</th>
                                <th>Cuisine</th>
                                <th>Timing Open</th>
                                <th>Timing Close</th>
                                <th>Type</th>
                                <th>Delete</th>
                            </tr>
                            <%
                        while (rs.next()) {
                            out.println("<tr>");
                            %>
                            <td><%= rs.getString("res_id")%></td>
                            <td><%= rs.getString("res_name")%></td>
                            <td><%= rs.getString("manager")%></td>
                            <td><%= rs.getString("email")%></td>
                            <td><%= rs.getString("phone")%></td>
                            <td><%= rs.getString("address")%></td>
                            <td><%= rs.getString("res_phone")%></td>
                            <td><%= rs.getString("cuisine")%></td>
                            <td><%= rs.getString("timing_open")%></td>
                            <td><%= rs.getString("timing_close")%></td>
                            <td><%= rs.getString("type")%></td>
                            <td><form action="restrodelete" method="post">
                                    <button type="submit" style="border: none;">
                                            <span class="material-symbols-rounded">delete</span>
                                    </button><br>
                                    <input name="res_id" value="<%= rs.getLong("res_id")%>" hidden>
                                </form>
                            </td>
                            <%
                            out.println("</tr>");
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
                    <button class="btn btn-warning btn-circle btn-sm" type="button">
                        <a href="partner">Add a restaurant</a>
                    </button>
                    
<!--                    <button class="btn btn-warning btn-circle btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop2" type="button">
                        Delete a restaurant
                    </button>
                    
                    <div class="modal fade" id="staticBackdrop2" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Enter restaurant ID to delete</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="restrodelete" method="post">
                                        <label for="res_id">Enter FSSAI no.: </label>
                                        <input type="text" id="res_id" name="res_id">
                                        <br><br>
                                        <input class="btn btn-warning btn-circle btn-sm" onclick="return confirm('Are you sure you want to delete this item?');" type="submit" value="Submit">
                                      </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-warning btn-circle btn-sm" data-bs-dismiss="modal">Clear All</button>
                                    <button type="button" class="btn btn-warning btn-circle btn-sm">Add</button>
                                </div>
                            </div>
                        </div>
                    </div>-->
            </div>
    </div>
</section>

<script>
      var modal = document.getElementById("update-name");

      var links = document.getElementsByTagName("a");

      for (var i = 0; i < links.length; i++) {
        var link = links[i];
        if (link.href.endsWith("#update-name")) {
          link.onclick = function(e) {
            e.preventDefault();
            modal.style.display = "block";
          };
        }
      }

      var span = document.getElementsByClassName("close")[0];

      span.onclick = function() {
        modal.style.display = "none";
      }

      window.onclick = function(event) {
        if (event.target == modal) {
          modal.style.display = "none";
        }
      }
    </script>            
            
<script>
    let arrow = document.querySelectorAll(".arrow");
    for (var i = 0; i < arrow.length; i++) {
        arrow[i].addEventListener("click", (e)=>{
            let arrowParent = e.target.parentElement.parentElement;
            arrowParent.classList.toggle("showMenu");
        });
    }
    let sidebar = document.querySelector(".sidebar");
    let sidebarBtn = document.querySelector(".bx-menu");
    console.log(sidebarBtn);
    sidebarBtn.addEventListener("click", ()=>{
        sidebar.classList.toggle("close");
    });
</script>

<%@ include file="footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
