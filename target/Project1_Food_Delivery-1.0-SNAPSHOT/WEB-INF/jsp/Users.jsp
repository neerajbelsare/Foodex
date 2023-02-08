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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
          crossorigin="anonymous">
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
            <a href="#">
                <i class='bx bx-restaurant' ></i>
                <span class="link_name">Restaurants</span>
            </a>
            <ul class="sub-menu blank">
                <li><a class="link_name" href="#">Restaurants</a></li>
            </ul>
        </li>
        <li>
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
        </li>
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
                <h4 style="font-family: 'Poppins', sans-serif">All Users</h4><br>
            </div>
        </div>
        
        <div class="row">
        <div class="col">
            <%
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
                    Statement state = con.createStatement();

                    ResultSet rst = state.executeQuery("select count(*) from users");
                    while (rst.next()) {
                        cnt1 = rst.getInt(1);
                    }
                }
                catch (Exception k){
                    System.out.println(k.getMessage());
                }
            %>
            <h6 class="res-heading"><%=cnt1%> active users</h6>
        </div>
    </div>
        
        <div class="row">
            <div class="col" style="display: flex; justify-content: center;align-items: center">
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
                        PreparedStatement stmt = con.prepareStatement("select * from users");

                        ResultSet rs = stmt.executeQuery();

                        int columnCount = rs.getMetaData().getColumnCount();
                        int columnIndex = 0;
                %>

                        <table class="table table-striped table-hover users-table">
                            <tr>
                                <th>Username</th>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>Address</th>
                            </tr>
                            <%
                        while (rs.next()) {
                            out.println("<tr>");
                            for (int i = 1; i <= columnCount - 1; i++) {
                                out.println("<td>" + rs.getString(i) + "</td>");
                                columnIndex++;
                                if (columnIndex % 5 == 0) {
                                    out.println("</tr><tr>");
                                }
                            }
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
                    <button class="btn btn-warning btn-circle btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop" type="button">
                        Add a user
                    </button>
                    
                    <div class="modal fade" id="staticBackdrop" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Filter Options</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="users" method="post">
                                        <label for="username">Username: </label>
                                        <input type="text" id="username" name="username">
                                        <br><br>
                                        <label for="name">Name: </label>
                                        <input type="text" id="name" name="name">
                                        <br><br>
                                        <label for="phone">Phone Number: </label>
                                        <input type="text" id="phone" name="phone">
                                        <br><br>
                                        <label for="email">Email: </label>
                                        <input type="email" id="email" name="email">
                                        <br><br>
                                        <label for="address">Address: </label>
                                        <input type="text" id="address" name="address">
                                        <br><br>
                                        <label for="password">Create a password: </label>
                                        <input type="password" id="password" name="password">
                                        <br><br>
                                        <input class="btn btn-warning btn-circle btn-sm" type="submit" value="Submit">
                                      </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-warning btn-circle btn-sm" data-bs-dismiss="modal">Clear All</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <button class="btn btn-warning btn-circle btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop1" type="button">
                        Update user info
                    </button>
                    
                    <div class="modal fade" id="staticBackdrop1" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Filter </h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    
                                    <button class="btn btn-warning btn-circle btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop3" type="button">
                                        Update user info
                                    </button>
                                    
                                    <div class="modal fade" id="staticBackdrop3" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Filter Options</h1>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    hello
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn-second" data-bs-dismiss="modal">Clear All</button>
                                                    <button type="button" class="btn-prim">Apply</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-warning btn-circle btn-sm" data-bs-dismiss="modal">Clear All</button>
<!--                                    <button type="button" class="btn btn-warning btn-circle btn-sm">Add</button>-->
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <button class="btn btn-warning btn-circle btn-sm" data-bs-toggle="modal" data-bs-target="#staticBackdrop2" type="button">
                        Delete a user
                    </button>
                    
                    <div class="modal fade" id="staticBackdrop2" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Filter Options</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="userdelete" method="post">
                                        <label for="username">Enter username: </label>
                                        <input type="text" id="username" name="username">
                                        <br><br>
                                        <input class="btn btn-warning btn-circle btn-sm" type="submit" value="Submit">
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
</section>

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
