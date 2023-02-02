<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: NEERAJ BELSARE
  Date: 30-01-2023
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/addrestaurant.css" />" rel="stylesheet">
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

    <script src="https://kit.fontawesome.com/e0a94bc150.js" crossorigin="anonymous"></script>
    <title>Partner With Us | Foodex</title>
</head>
<body>
<div class="main-container">
    <nav class="navbar navbar-expand-lg nav-main navbar-dark bg-dark" id="nav-main">
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
            </div>
        </div>
    </nav>
</div>

<div class="container">
    <div class="row">
        <div class="col" style="display: flex; justify-content: center; align-content: center">
            <div class="main-details-div">
                <form action="restaurantform" method="post" style="font-family: 'Poppins', sans-serif;" id="form">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col">
                                <br><br><br><div class="details-col col">
                                <br><h4 style="font-weight: 700; margin-left: 20px">1. Restaurant Details</h4>
                                <p style="color: grey; margin-left: 40px; font-size: 0.9em">Name and Address</p>
                                <br><input type="text" id="name" class="form-control form-input" placeholder="Restaurant Name" name="a"/><br>
                                <input type="text" id="address" class="form-control form-input" placeholder="Restaurant Address" name="b"/>
                                <br><br>
                            </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <br><div class="details-col col">
                                <br><h4 style="font-weight: 700; margin-left: 20px">2. Restaurant Contact Details</h4>
                                <p style="color: grey; margin-left: 40px; font-size: 0.9em">Phone Number for enquiries and Manager Information</p>
                                <br><div class="form-input"><input type="text" maxLength="10" id="phone" class="form-control" placeholder="Mobile Number for Enquiries" name="c"/></div><br>
                                <br><p style="color: grey; margin-left: 40px; font-size: 0.9em">Manager Information</p>
                                <input type="text" id="man_name" class="form-control form-input" placeholder="Manager Name" name="d"/>
                                <br><input type="email" id="man_email" class="form-control form-input" placeholder="Manager Email" name="e"/>
                                <br><div class="form-input"><input type="text" maxLength="10" id="phone1" class="form-control" placeholder="Manager Mobile Number" name="f"/></div><br><br>
                            </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <br><div class="details-col col col2 step-2">
                                <br><h4 style="font-weight: 700; margin-left: 20px">3. Restaurant Type</h4>
                                <p style="color: grey; margin-left: 40px; font-size: 0.9em">Select a category for your restaurant</p>
                                <br>
                                <div class="container" style="width: 95%">
                                    <div class="row">
                                        <div class="col">
                                            <input name="g" type="checkbox" class="form-check-input"/> Bakery<br><br>
                                            <input name="g" type="checkbox" class="form-check-input"/> Bhojanalya<br><br>
                                            <input name="g" type="checkbox" class="form-check-input"/> Casual Dining<br><br>
                                            <input name="g" type="checkbox" class="form-check-input"/> Confectionery<br><br>
                                            <input name="g" type="checkbox" class="form-check-input"/> Fine Dining<br><br>
                                            <input name="g" type="checkbox" class="form-check-input"/> Irani Cafe<br><br>
                                            <input name="g" type="checkbox" class="form-check-input"/> Mess<br><br>
                                            <input name="g" type="checkbox" class="form-check-input"/> Pub<br><br>
                                            <input name="g" type="checkbox" class="form-check-input"/> Sweet Shop<br><br><br>
                                        </div>

                                        <div class="col">
                                            <input name="g" type="checkbox" class="form-check-input"/> Bar<br><br>
                                            <input name="g" type="checkbox" class="form-check-input"/> Butcher Shop<br><br>
                                            <input name="g" type="checkbox" class="form-check-input"/> Club<br><br>
                                            <input name="g" type="checkbox" class="form-check-input"/> Dessert Parlour<br><br>
                                            <input name="g" type="checkbox" class="form-check-input"/> Food Court<br><br>
                                            <input name="g" type="checkbox" class="form-check-input"/> Kiosk<br><br>
                                            <input name="g" type="checkbox" class="form-check-input"/> Microbrewery<br><br>
                                            <input name="g" type="checkbox" class="form-check-input"/> Quick Bites<br>
                                        </div>

                                        <div class="col">
                                            <input name="g" type="checkbox" class="form-check-input"/> Beverage Shop<br><br>
                                            <input name="g" type="checkbox" class="form-check-input"/> Café<br><br>
                                            <input name="g" type="checkbox" class="form-check-input"/> Cocktail Bar<br><br>
                                            <input name="g" type="checkbox" class="form-check-input"/> Dhaba<br><br>
                                            <input name="g" type="checkbox" class="form-check-input"/> Food Truck<br><br>
                                            <input name="g" type="checkbox" class="form-check-input"/> Lounge<br><br>
                                            <input name="g" type="checkbox" class="form-check-input"/> Paan Shop<br><br>
                                            <input name="g" type="checkbox" class="form-check-input"/> Shack<br>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <br><div class="details-col col col2">
                                <br><h4 style="font-weight: 700; margin-left: 20px">4. Type of cuisines</h4>
                                <p style="color: grey; margin-left: 40px; font-size: 0.9em">Select options which best describe food your serve</p>
                                <br>
                                <div class="container" style="width: 95%">
                                    <div class="row">
                                        <div class="col">
                                            <input name="h" type="checkbox" class="form-check-input"/> Afghan<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> African<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> American<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Andhra<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Arabian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Asian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Asian Fusion<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Assamese<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Australian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Awadhi<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Bakery<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Bangladeshi<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Bar Food<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> BBQ<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Belgian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Bengali<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Beverages<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Bihari<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Biryani<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Bohri<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Brazilian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> British<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Bubble Tea<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Burger<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Burmese<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Cafe<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Cafe Food<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Cake<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Cantonese<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Charcoal Chicken<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Chettinad<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Chili<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Chinese<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Coffee<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Coffee and Tea<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Continental<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Desserts<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Drinks Only<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Egyptian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Ethiopian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> European<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Fast Food<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Finger Food<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> French<br><br>
                                        </div>

                                        <div class="col">
                                            <input name="h" type="checkbox" class="form-check-input"/> Fried Chicken<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Frozen Yogurt<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Fusion<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Garhwali<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> German<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Goan<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Greek<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Grill<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Gujarati<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Healthy Food<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Himachali<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Hyderabadi<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Ice Cream<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Indian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Indonesian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Iranian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Irish<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Israeli<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Italian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Japanese<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Juices<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Kashmiri<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Kebab<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Kerala<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Konkan<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Korean<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Lebanese<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Lucknowi<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Maharashtrian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Malaysian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Malwani<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Mandi<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Mangalorean<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Mediterranean<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Mexican<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Middle Eastern<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Mishti<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Mithai<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Modern Indian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Momos<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Mongolian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Moroccan<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Mughlai<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Naga<br><br>
                                        </div>

                                        <div class="col">
                                            <input name="h" type="checkbox" class="form-check-input"/> Nepalese<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> North Eastern<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> North Indian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Odia<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Oriental<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Paan<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Pakistani<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Pan Asian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Panini<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Parsi<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Peruvian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Pizza<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Poké<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Portuguese<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Rajasthani<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Raw Meats<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Roast Chicken<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Rolls<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Russian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Salad<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Sandwich<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Seafood<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Sindhi<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Singaporean<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> South American<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> South Indian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Spanish<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Sri Lankan<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Steak<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Street Food<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Sushi<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Swedish<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Tamil<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Tea<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Tex-Mex<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Thai<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Tibetan<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Turkish<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Vietnamese<br><br>
                                            <input name="h" type="checkbox" class="form-check-input"/> Wraps<br><br>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <br><div class="details-col col col2">
                                <br><h4 style="font-weight: 700; margin-left: 20px">5. Restaurant operational hours</h4>
                                <p style="color: grey; margin-left: 40px; font-size: 0.9em">Mark restaurant opening and closing hours</p>
                                <br>
                                <p style="color: grey; margin-left: 40px">Opening Time</p>
                                <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="i">
                                    <option value="1" selected>12:00 AM</option>
                                    <option value="2" >12:15 AM</option>
                                    <option value="3" >12:30 AM</option>
                                    <option value="4" >12:45 AM</option>
                                    <option value="5" >1:00 AM</option>
                                    <option value="6" >1:15 AM</option>
                                    <option value="7" >1:30 AM</option>
                                    <option value="8" >1:45 AM</option>
                                    <option value="9" >2:00 AM</option>
                                    <option value="10" >2:15 AM</option>
                                    <option value="11" >2:30 AM</option>
                                    <option value="12" >2:45 AM</option>
                                    <option value="13" >3:00 AM</option>
                                    <option value="14" >3:15 AM</option>
                                    <option value="15" >3:30 AM</option>
                                    <option value="16" >3:45 AM</option>
                                    <option value="17" >4:00 AM</option>
                                    <option value="18" >4:15 AM</option>
                                    <option value="19" >4:30 AM</option>
                                    <option value="20" >4:45 AM</option>
                                    <option value="21" >5:00 AM</option>
                                    <option value="22" >5:15 AM</option>
                                    <option value="23" >5:30 AM</option>
                                    <option value="24" >5:45 AM</option>
                                    <option value="25" >6:00 AM</option>
                                    <option value="26" >6:15 AM</option>
                                    <option value="27" >6:30 AM</option>
                                    <option value="28" >6:45 AM</option>
                                    <option value="29" >7:00 AM</option>
                                    <option value="30" >7:15 AM</option>
                                    <option value="31" >7:30 AM</option>
                                    <option value="32" >7:45 AM</option>
                                    <option value="33" >8:00 AM</option>
                                    <option value="34" >8:15 AM</option>
                                    <option value="35" >8:30 AM</option>
                                    <option value="36" >8:45 AM</option>
                                    <option value="37" >9:00 AM</option>
                                    <option value="38" >9:15 AM</option>
                                    <option value="39" >9:30 AM</option>
                                    <option value="40" >9:45 AM</option>
                                    <option value="41" >10:00 AM</option>
                                    <option value="42" >10:15 AM</option>
                                    <option value="43" >10:30 AM</option>
                                    <option value="44" >10:45 AM</option>
                                    <option value="45" >11:00 AM</option>
                                    <option value="46" >11:15 AM</option>
                                    <option value="47" >11:30 AM</option>
                                    <option value="48" >11:45 AM</option>
                                    <option value="49" >12:00 PM</option>
                                    <option value="50" >12:15 PM</option>
                                    <option value="51" >12:30 PM</option>
                                    <option value="52" >12:45 PM</option>
                                    <option value="53" >1:00 PM</option>
                                    <option value="54" >1:15 PM</option>
                                    <option value="55" >1:30 PM</option>
                                    <option value="56" >1:45 PM</option>
                                    <option value="57" >2:00 PM</option>
                                    <option value="58" >2:15 PM</option>
                                    <option value="59" >2:30 PM</option>
                                    <option value="60" >2:45 PM</option>
                                    <option value="61" >3:00 PM</option>
                                    <option value="62" >3:15 PM</option>
                                    <option value="63" >3:30 PM</option>
                                    <option value="64" >3:45 PM</option>
                                    <option value="65" >4:00 PM</option>
                                    <option value="66" >4:15 PM</option>
                                    <option value="67" >4:30 PM</option>
                                    <option value="68" >4:45 PM</option>
                                    <option value="69" >5:00 PM</option>
                                    <option value="70" >5:15 PM</option>
                                    <option value="71" >5:30 PM</option>
                                    <option value="72" >5:45 PM</option>
                                    <option value="73" >6:00 PM</option>
                                    <option value="74" >6:15 PM</option>
                                    <option value="75" >6:30 PM</option>
                                    <option value="76" >6:45 PM</option>
                                    <option value="77" >7:00 PM</option>
                                    <option value="78" >7:15 PM</option>
                                    <option value="79" >7:30 PM</option>
                                    <option value="80" >7:45 PM</option>
                                    <option value="81" >8:00 PM</option>
                                    <option value="82" >8:15 PM</option>
                                    <option value="83" >8:30 PM</option>
                                    <option value="84" >8:45 PM</option>
                                    <option value="85" >9:00 PM</option>
                                    <option value="86" >9:15 PM</option>
                                    <option value="87" >9:30 PM</option>
                                    <option value="88" >9:45 PM</option>
                                    <option value="89" >10:00 PM</option>
                                    <option value="90" >10:15 PM</option>
                                    <option value="91" >10:30 PM</option>
                                    <option value="92" >10:45 PM</option>
                                    <option value="93" >11:00 PM</option>
                                    <option value="94" >11:15 PM</option>
                                    <option value="95" >11:30 PM</option>
                                    <option value="96" >11:45 PM</option>
                                </select>

                                <br>
                                <p style="color: grey; margin-left: 40px">Closing Time</p>
                                <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="j">
                                    <option value="1">12:00 AM</option>
                                    <option value="2" >12:15 AM</option>
                                    <option value="3" >12:30 AM</option>
                                    <option value="4" >12:45 AM</option>
                                    <option value="5" >1:00 AM</option>
                                    <option value="6" >1:15 AM</option>
                                    <option value="7" >1:30 AM</option>
                                    <option value="8" >1:45 AM</option>
                                    <option value="9" >2:00 AM</option>
                                    <option value="10" >2:15 AM</option>
                                    <option value="11" >2:30 AM</option>
                                    <option value="12" >2:45 AM</option>
                                    <option value="13" >3:00 AM</option>
                                    <option value="14" >3:15 AM</option>
                                    <option value="15" >3:30 AM</option>
                                    <option value="16" >3:45 AM</option>
                                    <option value="17" >4:00 AM</option>
                                    <option value="18" >4:15 AM</option>
                                    <option value="19" >4:30 AM</option>
                                    <option value="20" >4:45 AM</option>
                                    <option value="21" >5:00 AM</option>
                                    <option value="22" >5:15 AM</option>
                                    <option value="23" selected>5:30 AM</option>
                                    <option value="24" >5:45 AM</option>
                                    <option value="25" >6:00 AM</option>
                                    <option value="26" >6:15 AM</option>
                                    <option value="27" >6:30 AM</option>
                                    <option value="28" >6:45 AM</option>
                                    <option value="29" >7:00 AM</option>
                                    <option value="30" >7:15 AM</option>
                                    <option value="31" >7:30 AM</option>
                                    <option value="32" >7:45 AM</option>
                                    <option value="33" >8:00 AM</option>
                                    <option value="34" >8:15 AM</option>
                                    <option value="35" >8:30 AM</option>
                                    <option value="36" >8:45 AM</option>
                                    <option value="37" >9:00 AM</option>
                                    <option value="38" >9:15 AM</option>
                                    <option value="39" >9:30 AM</option>
                                    <option value="40" >9:45 AM</option>
                                    <option value="41" >10:00 AM</option>
                                    <option value="42" >10:15 AM</option>
                                    <option value="43" >10:30 AM</option>
                                    <option value="44" >10:45 AM</option>
                                    <option value="45" >11:00 AM</option>
                                    <option value="46" >11:15 AM</option>
                                    <option value="47" >11:30 AM</option>
                                    <option value="48" >11:45 AM</option>
                                    <option value="49" >12:00 PM</option>
                                    <option value="50" >12:15 PM</option>
                                    <option value="51" >12:30 PM</option>
                                    <option value="52" >12:45 PM</option>
                                    <option value="53" >1:00 PM</option>
                                    <option value="54" >1:15 PM</option>
                                    <option value="55" >1:30 PM</option>
                                    <option value="56" >1:45 PM</option>
                                    <option value="57" >2:00 PM</option>
                                    <option value="58" >2:15 PM</option>
                                    <option value="59" >2:30 PM</option>
                                    <option value="60" >2:45 PM</option>
                                    <option value="61" >3:00 PM</option>
                                    <option value="62" >3:15 PM</option>
                                    <option value="63" >3:30 PM</option>
                                    <option value="64" >3:45 PM</option>
                                    <option value="65" >4:00 PM</option>
                                    <option value="66" >4:15 PM</option>
                                    <option value="67" >4:30 PM</option>
                                    <option value="68" >4:45 PM</option>
                                    <option value="69" >5:00 PM</option>
                                    <option value="70" >5:15 PM</option>
                                    <option value="71" >5:30 PM</option>
                                    <option value="72" >5:45 PM</option>
                                    <option value="73" >6:00 PM</option>
                                    <option value="74" >6:15 PM</option>
                                    <option value="75" >6:30 PM</option>
                                    <option value="76" >6:45 PM</option>
                                    <option value="77" >7:00 PM</option>
                                    <option value="78" >7:15 PM</option>
                                    <option value="79" >7:30 PM</option>
                                    <option value="80" >7:45 PM</option>
                                    <option value="81" >8:00 PM</option>
                                    <option value="82" >8:15 PM</option>
                                    <option value="83" >8:30 PM</option>
                                    <option value="84" >8:45 PM</option>
                                    <option value="85" >9:00 PM</option>
                                    <option value="86" >9:15 PM</option>
                                    <option value="87" >9:30 PM</option>
                                    <option value="88" >9:45 PM</option>
                                    <option value="89" >10:00 PM</option>
                                    <option value="90" >10:15 PM</option>
                                    <option value="91" >10:30 PM</option>
                                    <option value="92" >10:45 PM</option>
                                    <option value="93" >11:00 PM</option>
                                    <option value="94" >11:15 PM</option>
                                    <option value="95" >11:30 PM</option>
                                    <option value="96" >11:45 PM</option>
                                </select>
                                <br><br>
                            </div>
                        </div>
                        </div>
                    </div>
                    <br><br><input type="submit" name="submit-button" id="submit-btn" value="   Submit   " class="submit-btn"/>
                </form>
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
                            <a href="contact" class="text-reset">Contact Us</a>
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
    const inputField = document.querySelector("#phone");

    inputField.addEventListener("input", function(event) {
        const value = event.target.value;
        if (!/^\d*$/.test(value)) {
            event.target.value = value.replace(/[^0-9]/g, "");
        }
    });

    const inputField1 = document.querySelector("#phone1");

    inputField1.addEventListener("input", function(event) {
        const value = event.target.value;
        if (!/^\d*$/.test(value)) {
            event.target.value = value.replace(/[^0-9]/g, "");
        }
    });

    const form = document.getElementById("form");
    form.addEventListener("submit", function(event) {
        const a = document.getElementById("name");
        const b = document.getElementById("address");
        const c = document.getElementById("phone");
        const d = document.getElementById("phone1");
        const e = document.getElementById("man_name");
        const f = document.getElementById("man_email");

        if (!a.value || !b.value || !c.value || !d.value || !e.value || !f.value) {
            alert("All fields are required.");
            event.preventDefault();
        }
    });
</script>
</body>
</html>
