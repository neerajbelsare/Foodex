        <%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    ArrayList<Integer> counts = null;
    ArrayList<String> dates = null;

    ArrayList<Integer> counts1 = null;
    ArrayList<String> dates1 = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8", "root", "root");

        PreparedStatement stmt = con.prepareStatement("SELECT COUNT(*) as count, DATE(created_at) as date FROM users GROUP BY DATE(created_at) order by created_at");

        ResultSet rs = stmt.executeQuery();

        counts = new ArrayList<Integer>();
        dates = new ArrayList<String>();

        while (rs.next()) {
            counts.add(rs.getInt("count"));
            dates.add(rs.getString("date"));
        }

        PreparedStatement stmt1 = con.prepareStatement("SELECT COUNT(*) as count from restaurants where rating >= 4 and rating < 5");

        ResultSet rs1 = stmt1.executeQuery();
        counts1 = new ArrayList<Integer>();
        dates1 = new ArrayList<String>();

        while (rs1.next()) {
            counts1.add(rs1.getInt("count"));
            dates1.add("4-5");
        }

        PreparedStatement stmt2 = con.prepareStatement("SELECT COUNT(*) as count from restaurants where rating >= 3 and rating < 4");

        ResultSet rs2 = stmt2.executeQuery();

        while (rs2.next()) {
            counts1.add(rs2.getInt("count"));
            dates1.add("3-4");
        }

        PreparedStatement stmt3 = con.prepareStatement("SELECT COUNT(*) as count from restaurants where rating >= 2 and rating < 3");

        ResultSet rs3 = stmt3.executeQuery();

        while (rs3.next()) {
            counts1.add(rs3.getInt("count"));
            dates1.add("2-3");
        }

        PreparedStatement stmt4 = con.prepareStatement("SELECT COUNT(*) as count from restaurants where rating >= 0 and rating < 2");

        ResultSet rs4 = stmt4.executeQuery();

        while (rs4.next()) {
            counts1.add(rs4.getInt("count"));
            dates1.add("0-2");
        }
    } catch (Exception e) {
        System.out.println(e);
    }

%>

<html>
<head>
    <meta charset="UTF-8">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
          crossorigin="anonymous">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<c:url value="/resources/css/admin.css" />" rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <title>Admin Dashboard | Foodex</title>
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
            <a href="Restaurantdashboard">
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
    </ul>
</div>
<section class="home-section">
    <div class="home-content">
        <i class='bx bx-menu' ></i>
    </div>
    <div class="container">
        <div class="row">
            <div class="col">
                <h4>User Analytics</h4>
                <canvas id="myChart" width="400" height="150"></canvas>
            </div>
        </div><br><br>
        <div class="row">
            <div class="col" style="width: 50%!important;">
                <h4>Restaurant Analytics</h4>
                <canvas id="myChart1" width="50" height="10"></canvas>
            </div>
        </div>
    </div>
</section>

<script>
    var data = {
        labels: <%= dates %>,
        datasets: [
            {
                label: "Number of Users",
                data: <%= counts %>,
                fill: false,
                borderColor: "rgb(75, 192, 192)",
                lineTension: 0.1
            }
        ]
    };
</script>

<script>
    var ctx = document.getElementById('myChart').getContext('2d');
    var chart = new Chart(ctx, {
        type: 'line',
        data: data
    });

    var ctx1 = document.getElementById('myChart1').getContext('2d');
    var myChart1 = new Chart(ctx1, {
        type: 'pie',
        data: {
            labels: <%= dates1%>,
            datasets: [{
                label: 'Restaurant Rating Distribution',
                data: <%= counts1%>,
                backgroundColor: [
                    'rgba(99,255,112,0.2)',
                    'rgba(235,157,54,0.2)',
                    'rgba(255,232,86,0.2)',
                    'rgba(255,86,86,0.2)'
                ],
                borderColor: [
                    'rgb(138,255,99)',
                    'rgb(255,131,8)',
                    'rgba(255, 206, 86, 1)',
                    'rgb(255,0,0)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: 'Restaurant Rating Distribution'
                }
            }
        }
    });
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
</body>
</html>
