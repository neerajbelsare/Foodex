<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: NEERAJ BELSARE
  Date: 27-01-2023
  Time: 18:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet">
<html>
<head>
    <title>Foodex | Satisfying Your Cravings, One Delivery at a Time</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Source+Code+Pro:wght@900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    
    <script src="https://kit.fontawesome.com/e0a94bc150.js" crossorigin="anonymous"></script>

    <style>
        .main-container {
            background-image: url("<c:url value="/resources/img/main-page-bg.jpg" />");
            background-repeat: no-repeat;
            background-size: cover;
            height: 80%;
        }
    </style>
</head>
<body>
<div class="main-container">
    <nav class="navbar navbar-expand-lg nav-main navbar-dark" id="nav-main">
        <div class="container-fluid">
            <img src="<c:url value="/resources/img/logo-exp.png" />" alt="Foodex Logo" width="120px" style="margin-left: 40px;" />
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse"></div>
            <div class="collapse navbar-collapse " id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 justify-content-center">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact">Contact and Support</a>
                    </li>
                </ul>
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 justify-content-center">
                    <li class="nav-item">
                        <a class="nav-link nav-reg" href="login">Log In</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-reg" href="register">Sign Up</a>
                    </li>
                </ul>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container-fluid jumbotron">
        <div class="row">
            <div class="col">
                <h2 class="header-main">Satisfying Your Cravings, One Delivery at a Time</h2>
            </div>
        </div>
        <div class="row">
            <div class="col search-container">
                <form action="setlocation" method="post" class="search-loc-form">
                    <button class="gps-button" id="gps-button" style="margin-right: 10px;" type="button">
                        <span class="material-symbols-outlined">my_location</span>
                    </button>
                    <input type="search" placeholder="Search for your Location" class="search-loc" id="search-loc" name="location" />
                    <button class="go-button" id="go-button" type="submit">
                        <span class="material-symbols-outlined">arrow_forward</span>
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="features">
    <div class="container-fluid">
        <div class="row">
            <div class="col col-card">
                <div class="card" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Fast and reliable delivery service</h5>
                    </div>
                </div>
            </div>

            <div class="col col-card">
                <div class="card" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Real-time tracking</h5>
                    </div>
                </div>
            </div>

            <div class="col col-card">
                <div class="card" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Wide variety of food options</h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row row-2-cards">
            <div class="col col-card">
                <div class="card" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Customizable options</h5>
                    </div>
                </div>
            </div>

            <div class="col col-card">
                <div class="card" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Discounts and deals</h5>
                    </div>
                </div>
            </div>

            <div class="col col-card">
                <div class="card" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Contactless delivery options</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

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
    const http = new XMLHttpRequest();
    let result = document.querySelector("#search-loc");

    document.querySelector("#gps-button").addEventListener("click", () => {
        findMyCoordinates()
    })

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
