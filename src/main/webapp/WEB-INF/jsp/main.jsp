<%@ page import="java.io.InputStream" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.util.Base64" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,0" />
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@3.6.12/dist/css/splide.min.css">
    <title>Foodex | Browse</title>
    <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">

    <style>
        td{
            padding: 30px 64px 50px 0;
        }
        .btn-circle.btn-sm {
            width: 100px;
            height: 40px;
            padding: 6px 0px;
            border-radius: 10px;
            font-size: 10px;
            text-align: center;
        }
<<<<<<< Updated upstream
        .card-title,.card-text {
            margin-bottom: 4px;
        }
        /*.card-title,.card-text {*/
        /*    margin-bottom: 4px;*/
        /*}*/
        /*.card-body {*/
        /*    padding-top: 10rem;*/
        /*}*/
=======
>>>>>>> Stashed changes
        .truncate {
            color:#494949;
            font-size: 12px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            width: 70%;
          }
        .inline-div {
            width: 100%;
            position: sticky;
            height: 18px;
            vertical-align: top;
        }
        a{
            text-decoration: none;
        }
        text-container {
            display: inline-block;
        }
        .text-container .text-desc {
            font-size: 12px;
            text-align: center;
            display: none;
            position: absolute;
            top: 100%;
            left: 50%;
            transform: translateX(-50%);
            background-color: lightgray;
            padding: 5px;
            width: 60%;
            border-radius: 100px;
        }
        .text-container:hover .text-desc {
            display: block;
        }
        
    </style>
</head>

<nav class="navbar navbar-expand-lg nav-main navbar-light" id="nav-main">
    <div class="container-fluid">
        <img src="<c:url value="/resources/img/logo-exp-light.png" />" alt="Foodex Logo" width="120px" style="margin-left: 40px;" />
        <input type="text" value="<%= session.getAttribute("currentLocation")%>" class="location-input">
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
                    <a class="nav-link nav-reg" href="offers"><span class="material-symbols-outlined nav-icons">loyalty</span>Offers</a>
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
                        <a href="#" class="display-picture"><img src="https://i.pravatar.cc/85" alt="User Icon"></a>
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
                                    while(rs1.next()){
                                        if(rs1.getString("username").equals(usnm)){
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

                <li class="nav-item">
                    <a class="nav-link nav-reg" href="register"><span class="material-symbols-outlined nav-icons">shopping_cart</span>Cart</a>
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
<br>

<div class="container">
    <div class="row">
        <div class="col"><h1>Items</h1></div></div><br>
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

                    ResultSet rst = state.executeQuery("select count(*) from items");
                    while (rst.next()) {
                        cnt = rst.getInt(1);
                    }
                }
                catch (Exception k){
                    System.out.println(k.getMessage());
                }
            %>
            <h4 class="res-heading"><%=cnt%> Items</h4>
        </div>
    </div>
</div>

<div class="container">
        <div class="container">
            <div class="row">
                <div class="col">
                    <table>
                        <%
                            int colind = 0;
                            try{
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");

                            PreparedStatement stmt = con.prepareStatement("select * from items, item_images where items.item_id = item_images.item_id order by rand()");
                            ResultSet rs = stmt.executeQuery();

                            while(rs.next()){
                                long m = rs.getLong("res_id");

                                PreparedStatement state = con.prepareStatement("select * from restaurants where res_id=?");
                                state.setLong(1, m);
                                ResultSet rst = state.executeQuery();
                                String l="";
                                while(rst.next()){
                                    l=rst.getString("res_name");
                                }

                                Blob imageBlob = rs.getBlob("data");
                                InputStream imageStream = imageBlob.getBinaryStream();
                                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                                byte[] buffer = new byte[4096];
                                int n = 0;
                                while (-1 != (n = imageStream.read(buffer))) {
                                    outputStream.write(buffer, 0, n);
                                }
                                byte[] imageBytes = outputStream.toByteArray();
                        %>
                        <td>
                            <div class="card" style="width: 14rem;">
                                    <img class="card-img-top" alt="..." src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(imageBytes) %>"/>
                                    <h4 class="card-title"><%= rs.getString("item_name")%></h4>
                                    <p class="card-text">
                                        <a href="#">
                                            <%=l%><br>
                                        </a>
                                        
                                        <%float rate = rs.getFloat("rating");
                                        int x = (int) rate;
                                        for (int i=0; i<x; i++)
                                        {%>
                                            <span class="material-symbols-rounded" style="color: #3EC70B;">
                                                star
                                            </span>
                                        <%}
                                        if (rate%1!=0)
                                        {%>
                                            <span class="material-symbols-rounded" style="color: #3EC70B;">
                                                star_half
                                            </span>
                                        <%}
                                        %>
                                        <br>

                                        <div class="inline-div grid1" style="margin-bottom: 5px;">
                                            <div class="text-container">
                                                <div class="truncate"><%= rs.getString("description") %></div>
                                                <div align="left" class="text-desc"><%= rs.getString("description") %></div>
                                            </div>
                                            <div class="price" align="right">Rs. <%= rs.getFloat("price") %></div>
                                        </div>

                                        <div align="center" style="display: inline-block; margin-top: 1px; margin-bottom: 0">
                                            <button type="button" class="btn btn-warning btn-circle btn-sm" style="margin-right: 20px;">
                                                <span class="material-symbols-outlined">add_shopping_cart</span>
                                            </button>
                                            <select name="quantity" autocomplete="off" data-action="a-dropdown-select" >
                                                <option value="1" selected="">1</option>
                                                <option value="2">2 </option>
                                                <option value="3">3 </option>
                                                <option value="4">4 </option>
                                            </select>
                                        </div>
                                    </p>
                            </div>
                        </td>
                        <%colind++;%>
                            <% if (colind%4==0)
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

    <%@ include file="footer.jsp"%>

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
</div>
</body>
</html>