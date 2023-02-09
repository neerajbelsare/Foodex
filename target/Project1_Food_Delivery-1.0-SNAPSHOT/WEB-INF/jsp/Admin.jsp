<%--
  Created by IntelliJ IDEA.
  User: NEERAJ BELSARE
  Date: 03-02-2023
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
          crossorigin="anonymous">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<c:url value="/resources/css/admin.css" />" rel="stylesheet">
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
            <a href="Restaurants">
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
</section>

<div class="one"></div>

<footer class="text-center text-lg-start bg-white text-muted footer-main">
    <section class="">
        <div class="container text-center text-md-start mt-5">
            <div class="row mt-3">
                <div class="col-md-2 col-lg-2 mx-auto col-xl-2 mb-4">
                    <img src="<c:url value="/resources/img/logo-exp-light.png" />" alt="Foodex Logo" style="width: 200px;"/>
                </div>
                <div class="col-md-2 col-lg-2 mx-auto col-xl-2 mb-4">
                </div>
                <div class="col-md-2 col-lg-2 mx-auto col-xl-2 mb-4">
                </div>
                <div class="col-md-2 col-lg-2 mx-auto col-xl-2 mb-4">
                </div>
            </div>

            <div class="row mt-3">
                <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                    <h6 class="text-uppercase fw-bold mb-4">
                        About Foodex
                    </h6>
                    <p>
                        <a href="#!" class="text-reset">Who We Are</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Blog</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Contact Us</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Work With Us</a>
                    </p>
                </div>

                <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                    <h6 class="text-uppercase fw-bold mb-4">
                        For Restaurants
                    </h6>
                    <p>
                        <a href="#!" class="text-reset">Pricing</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Partner With Us</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Ride With Us</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Contact</a>
                    </p>
                </div>

                <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                    <h6 class="text-uppercase fw-bold mb-4">
                        Learn More
                    </h6>
                    <p>
                        <a href="#!" class="text-reset">Terms</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Privacy</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Security</a>
                    </p>
                    <p>
                        <a href="#!" class="text-reset">Rules and Regulations</a>
                    </p>
                </div>

                <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
                    <h6 class="text-uppercase fw-bold mb-4">
                        Follow Foodex
                    </h6>
                    <i class="fa-brands fa-instagram social-icon"></i>
                    <i class="fa-brands fa-facebook-f social-icon"></i>
                    <i class="fa-brands fa-youtube social-icon"></i>
                    <i class="fa-brands fa-linkedin-in social-icon"></i>
                    <i class="fa-brands fa-twitter social-icon"></i>
                </div>

            </div>
        </div>
    </section>

    <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.025);">
        © 2023 Copyright:
        <a class="text-reset fw-bold" href="#">Foodex.com</a>
    </div>
</footer>
<script>
    let arrow = document.querySelectorAll(".arrow");
    for (var i = 0; i < arrow.length; i++) {
        arrow[i].addEventListener("click", (e)=>{
            let arrowParent = e.target.parentElement.parentElement;//selecting main parent of arrow
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
