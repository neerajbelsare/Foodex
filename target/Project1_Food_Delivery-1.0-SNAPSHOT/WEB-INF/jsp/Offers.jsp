<%--
  Created by IntelliJ IDEA.
  User: NEERAJ BELSARE
  Date: 11-02-2023
  Time: 18:32
  To change this template use File | Settings | File Templates.
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
          crossorigin="anonymous">

        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
          crossorigin="anonymous">
        
         <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,0" />

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@3.6.12/dist/css/splide.min.css">
        
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,0" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,0" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

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
    <body onload="findMyCoordinates()">
        <nav class="navbar navbar-expand-lg nav-main navbar-light" id="nav-main">
            <div class="container-fluid">
                <img src="<c:url value="/resources/img/logo-exp-light.png" />" alt="Foodex Logo" width="120px" style="margin-left: 40px;" />
                <input type="text" placeholder="Enter your Location" value="<%= session.getAttribute("currentLocation")%>" class="location-input">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse"></div>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-auto" style="display: flex; align-items: center">
                        <li class="nav-item">
                            <a class="nav-link nav-reg" href="#"><span class="material-symbols-outlined nav-icons">search</span>Search</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-reg" href="browse"><span class="material-symbols-outlined nav-icons">restaurant_menu</span>Items</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-reg" href="restaurants"><span class="material-symbols-outlined">storefront</span>Restaurants</a>
                        </li>

                        <%
                            boolean flag = false;
                            Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
                            if (loggedIn == null || !loggedIn) {
                        %>

                        <li class="nav-item">
                            <a class="nav-link nav-reg" href="register"><span class="material-symbols-outlined nav-icons">person</span>Sign Up</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link nav-reg" href="login"><span class="material-symbols-outlined nav-icons">login</span>Login</a>
                        </li>

                        <%
                        } else {
                            try {
                                String usnm = (String) session.getAttribute("userName");
                                String pwd = (String) session.getAttribute("password");
                                String prefix_u = "admin";
                                String prefix_p = "admin@123";

                                Class.forName("com.mysql.cj.jdbc.Driver");

                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
                                PreparedStatement stmt = con.prepareStatement("select * from restaurants where username=?");
                                stmt.setString(1, usnm);

                                PreparedStatement stmt2 = con.prepareStatement("select * from users where username=? and password=?");
                                stmt2.setString(1, usnm);
                                stmt2.setString(2, pwd);

                                ResultSet rs = stmt.executeQuery();
                                ResultSet rs1 = stmt2.executeQuery();

                        %>

                        <li class="nav-item">
                            <ul>
                                <a href="#" class="display-picture"><img src="<c:url value="/resources/img/user-icon-default.png" />" alt="User Icon"></a>
                            </ul>
                            <div class="card hidden">
                                <ul>
                                    <%
                                        if(usnm.startsWith(prefix_u) && pwd.startsWith(prefix_p)) {
                                            flag = true;
                                    %>
                                    <li><a href="admin" target="_blank">Dashboard</a></li>
                                    <li><a href="account">Account</a></li>
                                    <li><a href="settings">Settings</a></li>
                                    <li><a href="#">Log Out</a></li>
                                    <%
                                        }
                                        if(!flag){
                                            if(rs.next()){
                                                if(rs.getString("username").equals(usnm)){
                                                    flag = true;

                                    %>
                                    <li><a href="dashboard" target="_blank">Dashboard</a></li>
                                    <li><a href="account">Account</a></li>
                                    <li><a href="settings">Settings</a></li>
                                    <li><a href="#">Log Out</a></li>
                                    <%
                                                }}}

                                        if(!flag){
                                            while(rs1.next()){
                                                if(rs1.getString("username").equals(usnm) && rs1.getString("password").equals(pwd)) {
                                                    flag = true;
                                    %>

                                    <li><a href="account">Account</a></li>
                                    <li><a href="settings">Settings</a></li>
                                    <li><a href="#">Log Out</a></li>
                                    <%
                                                }}}
                                    %>
                                </ul>
                            </div>

                            <%
                                    }catch (Exception k) {
                                        System.out.println(k);
                                    }
                                }
                            %>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <div class="container-fluid" style="background: linear-gradient(48deg, rgba(23,26,41,1) 0%, rgb(20,23,37) 76%, rgb(32,37,56) 95%);">
            <div class="row">
                <div class="splide">
                    <div class="splide__track">
                        <div class="splide__list">
                            <div class="col-sm-4 splide__slide m-2">
                                <div class="card text-white">
                                    <div class="card-body">
                                        <img src="<c:url value="/resources/img/carousel-1.jpg" />" style="width: 80%;">
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 splide__slide m-2">
                                <div class="card-body">
                                    <img src="<c:url value="/resources/img/carousel-2.jpg" />" style="width: 80%">
                                </div>
                            </div>
                            <div class="col-sm-4 splide__slide m-2">
                                <div class="card-body">
                                    <img src="<c:url value="/resources/img/carousel-3.jpg" />" style="width: 80%">
                                </div>
                            </div>
                            <div class="col-sm-4 splide__slide m-2">
                                <div class="card-body">
                                    <img src="<c:url value="/resources/img/carousel-4.jpg" />" style="width: 80%">
                                </div>
                            </div>
                            <div class="col-sm-4 splide__slide m-2">
                                <div class="card-body">
                                    <img src="<c:url value="/resources/img/carousel-5.jpg" />" style="width: 80%">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <%
                    String usnm = (String) session.getAttribute("userName");
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
                        PreparedStatement stmt1 = con.prepareStatement("select count(*) from offers");

                        ResultSet rst = stmt1.executeQuery();
                        while (rst.next()) {
                                    cnt1 = rst.getInt(1);
                                }
                                
                        PreparedStatement stmt2 = con.prepareStatement("select count(*) from restaurants");

                        ResultSet rs1 = stmt2.executeQuery();
                        while (rs1.next()) {
                                    cnt = rs1.getInt(1);
                                }
                        }
                    catch (Exception k)
                    {
                    System.out.println(k.getMessage());
                        }
                    %>
                    <h2 >Hello <%=session.getAttribute("userName")%>, <%=cnt%> Restaurant provides you with <%=cnt1%> astonishing offers</h2>
                </div>            
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
                            String query = "select * from offers where offer_id like '%"+searchQuery+"%' or offer_name like '%"+searchQuery+"%'";

                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery(query);
//                            out.print("<table>");
                            %>
                            <table class="table table-striped table-hover users-table">
                            <tr>
                                <th>Offer ID</th>
                                <th>Offer name</th>
                                <th>Value of the Offer</th>
                                <th>Description</th>
                                <th>Offer code</th>
                                <th>Copy code</th>
                            </tr>
                            <%
                        while (rs.next()) {
                            out.println("<tr>");%>
                            <td><%= rs.getString("offer_id")%></td>
                            <td><%= rs.getString("offer_name")%></td>
                            <td><%= rs.getString("offer_value")%></td>
                            <td><%= rs.getString("description")%></td>
                            <td><%= rs.getString("offer_code")%></td>
                            <td><p id="text-to-copy" data-text="<%= rs.getString("offer_code")%>" hidden></p><button style="border: none; background-color: none;" onclick="copyText()"><span class="material-symbols-rounded">content_copy</span>Copy</button></td>
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
                            All existing <%=cnt1%> Offers!!
                        </div>
                    </div>
            <div class="row">
            <div class="col" style="display: flex; justify-content: center;align-items: center;margin-top: 10px;">
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
                        PreparedStatement stmt = con.prepareStatement("select * from offers");
                        
                        ResultSet rs = stmt.executeQuery();
                %>
                        <table class="table table-striped table-hover users-table">
                            <tr>
                                <th>Offer ID</th>
                                <th>Offer name</th>
                                <th>Value of the Offer</th>
                                <th>Description</th>
                                <th>Offer code</th>
                                <th>Copy code</th>
                            </tr>
                            <%
                        while (rs.next()) {
                            out.println("<tr>");%>
                            <td><%= rs.getString("offer_id")%></td>
                            <td><%= rs.getString("offer_name")%></td>
                            <td><%= rs.getString("offer_value")%></td>
                            <td><%= rs.getString("description")%></td>    
                            <td><%= rs.getString("offer_code")%></td>
                            <td><p id="text-to-copy" data-text="<%= rs.getString("offer_code")%>" hidden></p><button style="border: none; background-color: none;" onclick="copyText()"><span class="material-symbols-rounded">content_copy</span></button></td>
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
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Delete an offer</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="offerdelete" method="post">
                                        <label for="offer_id">Enter the offer ID: </label>
                                        <input type="text" id="item_id" name="offer_id">
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
        </div>         
            
        
<!--        <div class="one"></div>-->
        
        <%@ include file="footer.jsp" %>
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@3.6.12/dist/js/splide.min.js"></script>
        <script>
            var splide = new Splide('.splide', {
                type: 'loop',
                perPage: 4,
                rewind: true,
                autoplay: true,
            });

            splide.mount();
        </script>
        
        <script>
                const div1 = document.getElementById('ele1')

                div1.addEventListener("click", function (){
                    div1.style.backgroundColor = "#f3f3f3";
                    div2.style.backgroundColor = "#ffffff";
                    div3.style.backgroundColor = "#ffffff";
                    div4.style.backgroundColor = "#ffffff";
                });

                const div2 = document.getElementById('ele2')
                const para2 = document.getElementById('ele2')

                para2.addEventListener("click", function (){
                    div2.style.backgroundColor = "#f3f3f3";
                    div1.style.backgroundColor = "#ffffff";
                    div3.style.backgroundColor = "#ffffff";
                    div4.style.backgroundColor = "#ffffff";
                });

                const div3 = document.getElementById('ele3')
                const para3 = document.getElementById('ele3')

                para3.addEventListener("click", function (){
                    div3.style.backgroundColor = "#f3f3f3";
                    div2.style.backgroundColor = "#ffffff";
                    div1.style.backgroundColor = "#ffffff";
                    div4.style.backgroundColor = "#ffffff";
                });

                const div4 = document.getElementById('ele4')
                const para4 = document.getElementById('ele4')

                div4.addEventListener("click", function (){
                    div4.style.backgroundColor = "#f3f3f3";
                    div2.style.backgroundColor = "#ffffff";
                    div3.style.backgroundColor = "#ffffff";
                    div1.style.backgroundColor = "#ffffff";
                });

                let card = document.querySelector(".card");
                let displayPicture = document.querySelector(".display-picture");

                displayPicture.addEventListener("click", function() {
                    card.classList.toggle("hidden")})
        </script>
        
        <script>
            function copyText() {
                const textToCopy = document.getElementById("text-to-copy").getAttribute('data-text');
                const dummy = document.createElement('textarea');
                document.body.appendChild(dummy);
                dummy.value = textToCopy;
                dummy.select();
                document.execCommand('copy');
                document.body.removeChild(dummy);
                alert("Text copied!");
            }
        </script>
        
        <script>
            document.querySelector(".btn-close").addEventListener("click", () => {
                sidebar.style.display = "none";
            });

            const http = new XMLHttpRequest();
            let result = document.querySelector("#currentLoc");

            function findMyCoordinates() {
                if(navigator.geolocation){
                    navigator.geolocation.getCurrentPosition((position) => {
                            const bdcApi = `https://api.bigdatacloud.net/data/reverse-geocode-client?latitude=${position.coords.latitude}&longitude=${position.coords.longitude}`
                            getApi(bdcApi);
                        },
                        (err) => {
                            alert(err.message)
                        })
                } else {
                    alert("Geolocation is not supported by your browser")
                }
            }

            function getApi(bdcApi) {
                http.open("GET", bdcApi);
                http.send();
                http.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        const results = JSON.parse(this.responseText)
                        let final_location = results.locality + ", " + results.city + ", " + results.principalSubdivision + ", " + results.countryName
                        result.value = final_location;
                    }
                };
            }
        </script>
        
    </body>
</html>

