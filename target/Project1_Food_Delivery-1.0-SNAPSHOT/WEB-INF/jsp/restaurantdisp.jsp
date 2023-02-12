<%@page import="java.util.ArrayList"%>
<%@page import="javax.script.ScriptEngine"%>
<%@page import="javax.script.ScriptEngineManager"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="org.springframework.stereotype.Controller"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="org.springframework.web.bind.annotation.GetMapping" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.util.Base64" %>
<%@ page import="static java.lang.System.out" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%int cnt=0;%>
<!DOCTYPE html>

<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
        .btn-circle.btn-sm {
            width: 100px;
            height: 40px;
            padding: 6px 0px;
            border-radius: 10px;
            font-size: 15px;
            text-align: center;
            margin-top: 10px;
        }
        .card-title,.card-text {
            margin-bottom: 4px;
        }
        .inline-div {
/*            display: inline-block;*/
            width: 100%;
            position: sticky;
            height: 18px;
            vertical-align: top;
        }
        .space{
            margin-bottom: 0%;
        }
        .truncate {
            color:#494949;
            font-size: 15px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            width: 90%;
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

<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="myModalLabel">Info</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="myForm">
                    <input type="text" id="id" name="id" value="">
                </form> 
                <div id="details">Loading...</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-second" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!--<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="myModalLabel">Info</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="details">Loading...</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-second" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>-->

<!--<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="myModalLabel">Info</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="details">Loading...</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-second" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>-->

<!--<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="myModalLabel">Info</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="details">Loading...</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-second" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>-->

<!--<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="myModalLabel">Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
          
        </button>
      </div>
      <div class="modal-body" id="details-body">
        Loading...
      </div>
        <div class="modal-footer">
                <button type="button" class="btn-second" data-bs-dismiss="modal">Close</button>
            </div>
    </div>
  </div>
</div>-->

<!--<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="myModalLabel">Info</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="details">Loading...</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-second" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>-->

<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="myModalLabel">Info</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div id="details">Loading...</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-second" data-bs-dismiss="modal">Close</button>
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
                        PreparedStatement stmt = con.prepareStatement("select * from restaurants, res_images where restaurants.res_id = res_images.res_id order by rand()");
                        ResultSet rs = stmt.executeQuery();

                        while(rs.next()){
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
                    <% String m=rs.getString("res_name");%>
                    <div class="card space" style="width: 14rem;">
                        <img class="card-img-top" alt="..." src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(imageBytes) %>"/>
                        <h4 class="card-title"><%=m%></h4>
                        <p class="card-text"><%= rs.getString("type") %><br>
                        <p class="card-text res-id"><%= rs.getLong("res_id")%><br>
                        <div class="text-desc"><%= rs.getString("cuisine") %></div>
                        <div class="text-container">
                            <div class="truncate"><%= rs.getString("address") %></div>
                                <div class="text-desc"><%= rs.getString("address") %></div>
                        </div>
                        <%= rs.getString("res_phone") %>
                        <br><%= rs.getString("timing_open") %> - <%= rs.getString("timing_close") %>
                        <button class="btn btn-warning btn-circle btn-sm" data-res-id="<%= rs.getLong("res_id") %>" data-bs-toggle="modal" data-bs-target="#myModal" type="button">
                            Details
                        </button>
<!--                        <button class="btn btn-warning btn-circle btn-sm" data-res-id="<%= rs.getLong("res_id") %>" data-bs-toggle="modal" data-bs-target="#myModal" type="button">
                            Details
                        </button>-->
<!--                        <button class="btn btn-warning btn-circle btn-sm" data-res-id="<%= rs.getLong("res_id") %>" data-bs-toggle="modal" data-bs-target="#myModal" type="button">
                            Details
                        </button>-->
<!--                        <button class="btn btn-warning btn-circle btn-sm" data-res-id="<%= rs.getLong("res_id") %>" data-bs-toggle="modal" data-bs-target="#myModal" type="button">
                            Details
                        </button>-->
                        
<!--                        <button class="btn btn-warning btn-circle btn-sm" data-res-id="<%= rs.getLong("res_id") %>" data-bs-toggle="modal" data-bs-target="#myModal" type="button">Details</button>-->
<!--                        <button class="btn btn-warning btn-circle btn-sm" data-res-id="<%= rs.getLong("res_id") %>" type="button">
    Details
</button>-->
                        
<!--                        <button class="btn btn-warning btn-circle btn-sm" data-res-id="<%= rs.getLong("res_id") %>" type="button" onclick="fetchDetails(this)">
    Details
</button>-->
                        
<!--                        <button class="btn btn-warning btn-circle btn-sm" data-res-id="<%= rs.getLong("res_id") %>" type="button">
    Details
</button>-->


                    </div>
                </td>
                <%colind++;%>
                    <% if (colind %4 == 0)
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

            

<<<<<<< Updated upstream
        <%@ include file="footer.jsp" %>
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

=======
<%@ include file="footer.jsp" %>
>>>>>>> Stashed changes

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@3.6.12/dist/js/splide.min.js"></script>

<<<<<<< Updated upstream
            splide.mount();
        </script>
        
        <script>
            
            $(document).on('click', '.btn-warning', function() {
    var resId = $(this).data('res-id');
    $.ajax({
        url: '/getDetails.jsp',
        type: 'POST',
        data: {resId: resId},
        success: function(response) {
            $('#myModal .modal-body').html(response);
            $('#myModal').modal('show');
        },
        error: function(error) {
            console.log('Error fetching details: ', error);
        }
    });
});
            
//    function fetchDetails(button) {
//        // Get the value of the "data-res-id" attribute for the clicked button
//        var resId = button.getAttribute('data-res-id');
//        // Set up an AJAX request to fetch details using the resId value
//        var xhr = new XMLHttpRequest();
//        xhr.open('POST', '/getDetails.jsp');
//        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
//        xhr.onload = function() {
//            if (xhr.status === 200) {
//                // Update the contents of the "details" div with the response data
//                document.getElementById('details').innerHTML = xhr.responseText;
//            } else {
//                // Handle any errors
//                console.log('Error fetching details: ', xhr.statusText);
//            }
//        };
//        xhr.send('resId=' + resId);
//    }
</script>

<!--        <script>
            document.addEventListener('DOMContentLoaded', function() {
  var buttons = document.querySelectorAll('.btn-warning');
  var modalBody = document.getElementById('details');
  var xhr = new XMLHttpRequest();
  
  // Event listener for each "Details" button
  buttons.forEach(function(button) {
    button.addEventListener('click', function() {
      var resId = this.dataset.resId;
      xhr.open('GET', '/get_data.jsp?resId=' + resId, true);
      xhr.onload = function() {
        modalBody.innerHTML = xhr.responseText;
      };
      xhr.send();
    });
  });
});

        </script>-->
        
<!--        <script>
$(document).ready(function() {
  // Get the button and set up a click event listener
  var button = $('.btn-warning');
  button.click(function() {
    // Get the value of the "data-res-id" attribute for the clicked button
    var resId = $(this).data('res-id');
    // Set up an AJAX request to fetch details using the resId value
    $.ajax({
      url: '/get_data.jsp',
      type: 'POST',
      data: {
        resId: resId
      },
      success: function(response) {
        // Update the contents of the "details-body" div with the response data
        $('#details-body').html(response);
      },
      error: function(error) {
        // Handle any errors
        console.log('Error fetching details: ', error);
      }
    });
  });
});
</script>-->
        
<!--        <script>
$(document).ready(function() {
    // Get the button and set up a click event listener
    $('.btn-warning').click(function() {
        // Get the value of the "data-res-id" attribute for the clicked button
        var resId = $(this).data('res-id');
        // Set up an AJAX request to fetch details using the resId value
        $.ajax({
            url: 'get_data.jsp',
            type: 'POST',
            data: {
                resId: resId
            },
            success: function(response) {
                // Update the contents of the "details" div with the response data
                $('#details').html(response);
            },
            error: function(error) {
                // Handle any errors
                console.log('Error fetching details: ', error);
            }
        });
    });
});
</script>-->
        
<!--        <script>
    $(document).ready(function() {
        // Get the button and set up a click event listener
        var button = $('.btn-warning');
        button.click(function() {
            // Get the value of the "data-res-id" attribute for the clicked button
            var resId = $(this).data('res-id');
            // Set up an AJAX request to fetch details using the resId value
            $.ajax({
                url: '/getDetails.jsp',
                type: 'POST',
                data: {
                    resId: resId
                },
                success: function(response) {
                    // Update the contents of the "details" div with the response data
                    $('#details').html(response);
                },
                error: function(error) {
                    // Handle any errors
                    console.log('Error fetching details: ', error);
                }
            });
        });
    });
</script>-->
        
<!--        <script>
  $(document).ready(function() {
    // Get the button and set up a click event listener
    $('.btn-warning').click(function() {
      // Get the value of the "data-res-id" attribute for the clicked button
      var resId = $(this).data('res-id');
      // Set up an AJAX request to fetch details using the resId value
      $.ajax({
        url: '/get_data.jsp',
        type: 'POST',
        data: {
          resId: resId
        },
        success: function(response) {
          // Update the contents of the "details" div with the response data
          $('#details').html(response);
        },
        error: function(error) {
          // Handle any errors
          console.log('Error fetching details: ', error);
        }
      });
    });
  });
</script>-->
        
<!--data-bs-keyboard="false"-->
        
<!--<script>
  $(document).ready(function() {
    // Get the button and set up a click event listener
    var button = $('.btn-warning');
    button.click(function() {
      // Get the value of the "data-res-id" attribute
      var resId = button.attr('data-res-id');
      // Set up an AJAX request to fetch details using the resId value
      $.ajax({
        url: '/get_data.jsp',
        type: 'POST',
        data: {
          resId: resId
        },
        success: function(response) {
          // Update the contents of the "details" div with the response data
          $('#details').html(response);
        },
        error: function(error) {
          // Handle any errors
          console.log('Error fetching details: ', error);
        }
      });
    });
  });
</script>-->

<!--        <script>
            $(document).on('click', '[data-bs-target="#myModal"]', function(){
                var value = $(this).val();
                $.ajax({
                  url: 'get_data.jsp',
                  data: { value: value },
                  success: function(data){
                    $('#modal-content-placeholder').html(data);
                    console.log(data);
                  }
                });
            });
        </script>-->
        
<!--        <script>
            $(document).ready(function() {
            $('#myModal').on('show.bs.modal', function(event) {
              var button = $(event.relatedTarget); // Button that triggered the modal
              var resId = button.data('res-id'); // Extract info from data-* attributes
              $.ajax({
                url: 'get_data.jsp',
                data: {res_id: id},
                success: function(response) {
                  $('#modalContent').html(response);
                }
              });
            });
          });
        </script>-->
        
<!--        <script src="--https://code.jquery.com/jquery-3.6.0.min.js"></script>
        
        <script>
            $(document).ready(function() {
              // Make an AJAX request to the Java servlet
              $.ajax({
                url: "GetDataServlet",
                dataType: "json",
                success: function(data) {
                  // Update the modal-body with the data
                  $(".modal-body").html(data);
                }
              });
            });
        </script>-->
        
<!--        <script>
            var buttons = document.querySelectorAll('.btn');
            buttons.forEach(function(button) {
              button.addEventListener('click', function() {
                var value = button.getAttribute('data-value');
                var input = document.getElementById('myInput');
                input.value = value;
                $('#staticBackdrop5').modal('show');
              });
            });
        </script>
        
        <%-- Use JavaScript to create and show the modal, and to populate it with the HTML markup generated in step 4 --%>
<script>
    // code to create and show modal
    var modal = document.getElementById("myModal");
    modal.style.display = "block";
    // code to populate modal with HTML markup generated in step 4
    var modalContent = document.getElementById("modal-content");
    modalContent.innerHTML = "<--% out.print(data); %>";
</script>-->
        
<!--        <script>-->
<!--//            var id = document.getElementById("myInput").value;
//            localStorage.setItem("id", id);
//            var id = localStorage.getItem("id");
//            alert(id);
//            var myValueField = document.getElementsByName("myValue")[0];
//            myInput.addEventListener("input", function() {
//              myValueField.value = id.value;
//            });
//            function doSomethingWithValue(value) {
//                 ScriptEngineManager factory = new ScriptEngineManager();
//                    // create a new JavaScript engine
//                    ScriptEngine engine = factory.getEngineByName("JavaScript");
//                    // evaluate the JavaScript code and store the result in a variable
//                    engine.eval("var id = document.getElementById('myInput').value;");
//                    Object id = engine.get("id");-->
<!--            }-->
            
<!--        </script>-->

<!--        <script>
            // Store the value in a variable and populate the modal field
            function openModal() {
              var myValue = document.getElementById("myInput").value;
              document.getElementById("myModalInput").value = myValue;
              document.getElementById("myModal").style.display = "block";
            }

            // Use the value in an alert
            var myValue = document.getElementById("myModalInput").value;
            alert(myValue);

            // Use the value in a function
            function doSomethingWithValue(value) {
              // Do something with the value
            }

            doSomethingWithValue(myValue);

            // Close the modal when the user clicks on the close button
            document.getElementsByClassName("close")[0].onclick = function() {
              document.getElementById("myModal").style.display = "none";
            }
        </script>-->

<!--        <script>
            // Get the button and modal elements
            var button = document.getElementById("openModal");
            var modal = document.getElementById("staticBackdrop5");
              var modalValue = document.getElementById("modalValue");

            // Get the value of the data attribute when the button is clicked
            button.addEventListener("click", function() {
              var value = this.getAttribute("data-value");

              // Set the value in the modal
//              var modalValue = modal.querySelector("#modalValue");
              modalValue.innerHTML = "The value passed from the button is: " + value;

              // Display the modal
              modal.style.display = "block";
            });

            // Hide the modal when the user clicks outside of it
            window.addEventListener("click", function(event) {
              if (event.target == modal) {
                modal.style.display = "none";
                modalContent.textContent = "";
              }
            });
        </script>-->
        
<!--        <script>
            let modb = document.querySelector("#openModal")
            modb.addEventListener("click", function (){
                document.querySelector("#modal-res").innerHTML = document.querySelector(".res-id").innerHTML
            })
        </script>-->
=======
<script>
    var splide = new Splide('.splide', {
        type: 'loop',
        perPage: 4,
        rewind: true,
        autoplay: true,
    });
>>>>>>> Stashed changes

    splide.mount();
</script>

<script>
    let modb = document.querySelector("#openModal")
    modb.addEventListener("click", function (){
        document.querySelector("#modal-res").innerHTML = document.querySelector(".res-id").innerHTML
    })
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