<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@3.6.12/dist/css/splide.min.css">
        <title>Foodex | Browse</title>
        <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
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
                        <a class="nav-link nav-reg" href="#"><span class="material-symbols-outlined nav-icons">loyalty</span>Offers</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-reg" href="register"><span class="material-symbols-outlined nav-icons">person</span>Sign Up</a>
                    </li>
                    <li class="nav-item">
                        <form method="post" action="browseform"><button class="nav-link nav-reg" href="login" type="submit"><span class="material-symbols-outlined nav-icons">login</span>Login</button>
                            <input type="text" value="main" name="a" style="display: none;" />
                        </form>
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
                                <p>fjf</p>
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
                <h4 class="res-heading">0 Restaurants</h4>
            </div>
        </div>
    </div>

<%--    <footer class="text-center text-lg-start bg-white text-muted footer-main">--%>
<%--        <section class="">--%>
<%--            <div class="container text-center text-md-start mt-5">--%>
<%--                <div class="row mt-3">--%>
<%--                    <div class="col-md-2 col-lg-2 mx-auto col-xl-2 mb-4">--%>
<%--                        <img src="<c:url value="/resources/img/logo-exp-light.png" />" alt="Foodex Logo" style="width: 200px;"/>--%>
<%--                    </div>--%>
<%--                    <div class="col-md-2 col-lg-2 mx-auto col-xl-2 mb-4">--%>
<%--                    </div>--%>
<%--                    <div class="col-md-2 col-lg-2 mx-auto col-xl-2 mb-4">--%>
<%--                    </div>--%>
<%--                    <div class="col-md-2 col-lg-2 mx-auto col-xl-2 mb-4">--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                <div class="row mt-3">--%>
<%--                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">--%>
<%--                        <h6 class="text-uppercase fw-bold mb-4">--%>
<%--                            About Foodex--%>
<%--                        </h6>--%>
<%--                        <p>--%>
<%--                            <a href="#!" class="text-reset">Who We Are</a>--%>
<%--                        </p>--%>
<%--                        <p>--%>
<%--                            <a href="#!" class="text-reset">Blog</a>--%>
<%--                        </p>--%>
<%--                        <p>--%>
<%--                            <a href="contact" class="text-reset">Contact Us</a>--%>
<%--                        </p>--%>
<%--                        <p>--%>
<%--                            <a href="#!" class="text-reset">Work With Us</a>--%>
<%--                        </p>--%>
<%--                    </div>--%>

<%--                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">--%>
<%--                        <h6 class="text-uppercase fw-bold mb-4">--%>
<%--                            For Restaurants--%>
<%--                        </h6>--%>
<%--                        <p>--%>
<%--                            <a href="#!" class="text-reset">Pricing</a>--%>
<%--                        </p>--%>
<%--                        <p>--%>
<%--                            <a href="#!" class="text-reset">Partner With Us</a>--%>
<%--                        </p>--%>
<%--                        <p>--%>
<%--                            <a href="#!" class="text-reset">Ride With Us</a>--%>
<%--                        </p>--%>
<%--                        <p>--%>
<%--                            <a href="#!" class="text-reset">Contact</a>--%>
<%--                        </p>--%>
<%--                    </div>--%>

<%--                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">--%>
<%--                        <h6 class="text-uppercase fw-bold mb-4">--%>
<%--                            Learn More--%>
<%--                        </h6>--%>
<%--                        <p>--%>
<%--                            <a href="#!" class="text-reset">Terms</a>--%>
<%--                        </p>--%>
<%--                        <p>--%>
<%--                            <a href="#!" class="text-reset">Privacy</a>--%>
<%--                        </p>--%>
<%--                        <p>--%>
<%--                            <a href="#!" class="text-reset">Security</a>--%>
<%--                        </p>--%>
<%--                        <p>--%>
<%--                            <a href="#!" class="text-reset">Rules and Regulations</a>--%>
<%--                        </p>--%>
<%--                    </div>--%>

<%--                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">--%>
<%--                        <h6 class="text-uppercase fw-bold mb-4">--%>
<%--                            Follow Foodex--%>
<%--                        </h6>--%>
<%--                        <i class="fa-brands fa-instagram social-icon"></i>--%>
<%--                        <i class="fa-brands fa-facebook-f social-icon"></i>--%>
<%--                        <i class="fa-brands fa-youtube social-icon"></i>--%>
<%--                        <i class="fa-brands fa-linkedin-in social-icon"></i>--%>
<%--                        <i class="fa-brands fa-twitter social-icon"></i>--%>
<%--                    </div>--%>

<%--                </div>--%>
<%--            </div>--%>
<%--        </section>--%>

<%--        <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.025);">--%>
<%--            © 2023 Copyright:--%>
<%--            <a class="text-reset fw-bold" href="#">Foodex.com</a>--%>
<%--        </div>--%>
<%--    </footer>--%>

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
        </script>
    </body>
</html>


       

    
