<%@page import="org.springframework.ui.Model"%>
<%@page import="org.springframework.stereotype.Controller"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="org.springframework.web.bind.annotation.GetMapping" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.OutputStream" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%int cnt=0;%>
<!DOCTYPE html>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
          crossorigin="anonymous">

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
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@3.6.12/dist/css/splide.min.css">
    <title>Foodex | Browse</title>
    <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">

    <style>
        td{
            padding: 30px 62px 50px 0;
        }
    </style>
</head>

<nav class="navbar navbar-expand-lg nav-main navbar-light" id="nav-main">
    <div class="container-fluid">
        <img src="<c:url value="/resources/img/logo-exp-light.png" />" alt="Foodex Logo" width="120px" style="margin-left: 40px;" />
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse"></div>
        <div class="collapse navbar-collapse " id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-auto" style="display: flex; align-items: center">
                <li class="nav-item">
                    <a class="nav-link nav-reg" href="login"><span class="material-symbols-outlined nav-icons">search</span>Search</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-reg" href="browse"><span class="material-symbols-outlined">restaurant_menu</span>Items</a>
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
                        <a href="#" class="display-picture"><img src="https://i.pravatar.cc/85" alt="User Icon"></a>
                    </ul>
                    <div class="card hidden">
                        <ul>
                            <%
                                if(usnm.startsWith(prefix_u) && pwd.startsWith(prefix_p)) {
                                    flag = true;
                            %>
                            <li><a href="admin" target="_blank">Dashboard</a></li>
                            <li><a href="#">Profile</a></li>
                            <li><a href="#">Account</a></li>
                            <li><a href="#">Settings</a></li>
                            <li><a href="#">Log Out</a></li>
                            <%
                                }
                                if(!flag){
                                    while(rs.next()){
                                        if(rs.getString("username").equals(usnm)){
                                            flag = true;

                            %>
                            <li><a href="dashboard" target="_blank">Dashboard</a></li>
                            <li><a href="#">Profile</a></li>
                            <li><a href="#">Account</a></li>
                            <li><a href="#">Settings</a></li>
                            <li><a href="#">Log Out</a></li>
                            <%
                                        }}}

                                if(!flag){
                                    while(rs1.next()){
                                        if(rs1.getString("username").equals(usnm) && rs1.getString("password").equals(pwd)) {
                                            flag = true;
                            %>

                            <li><a href="">Profile</a></li>
                            <li><a href="#">Account</a></li>
                            <li><a href="#">Settings</a></li>
                            <li><a href="#">Log Out</a></li>
                        </ul>
                    </div>
                    <%
                                        }}}}catch (Exception k) {
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

<body>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Filter Options</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="grid">
                    <div class="col-1">
                        <div class="ele" id="ele1">
                            <p class="filter not-selectable">Sort By</p>
                            <p class="selection">Selected</p>
                        </div>
                        <div class="ele" id="ele2">
                            <p class="filter not-selectable">Cuisine</p>
                            <p class="selection">Selected</p>
                        </div>
                        <div class="ele" id="ele3">
                            <p class="filter not-selectable">Rating</p>
                            <p class="selection">Selected</p>
                        </div>
                        <div class="ele" id="ele4">
                            <p class="filter not-selectable">Cost</p>
                            <p class="selection">Selected</p>
                        </div>
                    </div>
                    <div class="col-1">

                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-second" data-bs-dismiss="modal">Clear All</button>
                <button type="button" class="btn-prim">Apply</button>
            </div>
        </div>
    </div>
</div>
<br><br><br>
<div class="container">
    <div class="row">
        <div class="col">
            <button class="filter-icon" data-bs-toggle="modal" data-bs-target="#staticBackdrop" type="button"><span class="material-symbols-outlined" style="color: #1e53ff; margin-right: 5px;">filter_alt</span>Filter</button>
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
                        cnt = rst.getInt(1);
                    }
                }
                catch (Exception k){
                    System.out.println(k.getMessage());
                }
            %>
            <h4 class="res-heading"><%=cnt%> Restaurants</h4>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col">
            <table style="width: 100%;">
                <%
                    int colind = 0;
                    try{
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
                        PreparedStatement stmt=con.prepareStatement("select * from restaurants");
                        ResultSet rs = stmt.executeQuery();

                %>
                <%
                    while(rs.next()){
                %>
                <td>
                    <% String m=rs.getString("res_name"); long z = rs.getLong("res_id");%>
                    <div class="card" style="width: 14rem;">
                        <img src="<c:url value='/displayImage'/>" class="card-img-top" alt="...">
                            <h5 class="card-title"><%=m%></h5>
                            <p class="card-text"><%= rs.getString("address") %><br><%= rs.getString("res_phone") %><br>
                                <%= rs.getString("cuisine") %><br><%= rs.getString("timing_open") %> -
                                <%= rs.getString("timing_close") %><br><%= rs.getString("type") %><br></p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </td>
                <%colind++;%>
                    <% if (colind%4 == 0)
                    {
                    %></tr><tr>
                    <%}%>
                    <%
                    }}
                    catch (Exception k){
                        System.out.println(k.getMessage());
                    }
                %>
            </table>
        </div>
    </div>
</div>


        <%@ include file="footer.jsp" %>

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
</body>
</html>