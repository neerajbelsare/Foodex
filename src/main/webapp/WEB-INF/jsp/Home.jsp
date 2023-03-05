<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <%@ include file="header.jsp" %>

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
                    <div class="card-body">
                        <h5 class="card-title">Fast and reliable delivery service</h5>
                    </div>
                </div>
            </div>

            <div class="col col-card">
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title">Real-time tracking</h5>
                    </div>
                </div>
            </div>

            <div class="col col-card">
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title">Wide variety of food options</h5>
                    </div>
                </div>
            </div>
        </div>
        <div class="row row-2-cards">
            <div class="col col-card">
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title">Customizable options</h5>
                    </div>
                </div>
            </div>

            <div class="col col-card">
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title">Discounts and deals</h5>
                    </div>
                </div>
            </div>

            <div class="col col-card">
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <h5 class="card-title">Contactless delivery options</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp"%>

<script>
    const http = new XMLHttpRequest();
    let result = document.querySelector("#search-loc");

    document.querySelector("#gps-button").addEventListener("click", () => {
        findMyCoordinates()
    })

    function findMyCoordinates() {
        if(navigator.geolocation){
            navigator.geolocation.getCurrentPosition((position) => {
                    const latitude = position.coords.latitude;
                    const longitude = position.coords.longitude;
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
