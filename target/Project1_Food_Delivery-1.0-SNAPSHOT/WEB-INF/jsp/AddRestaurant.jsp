<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%@ include file="header-bg-dark.jsp" %>

<div class="container">
    <div class="row">
        <div class="col" style="display: flex; justify-content: center; align-content: center">
            <div class="main-details-div">
                <form action="restaurantform" method="post" style="font-family: 'Poppins', sans-serif;" id="form" enctype="multipart/form-data">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col">
                                <br><br><br><div class="details-col col">
                                <br><h4 style="font-weight: 700; margin-left: 20px">1. Restaurant Details</h4>
                                <p style="color: grey; margin-left: 40px; font-size: 0.9em">Name and Address</p>
                                <br><input type="text" id="name" class="form-control form-input" placeholder="Restaurant Name*" name="a"/><br>
                                <input type="text" id="address" class="form-control form-input" placeholder="Restaurant Address" name="b"/><br>
                                <input type="text" id="license-number" class="form-control form-input" placeholder="FSSAI License Number (14 Digit)*" name="l"/><br>
                                <input type="text" id="rating" class="form-control form-input" placeholder="Current Rating of your Restaurant*" name="rt"/><br>
                                <p style="color: grey; margin-left: 40px; font-size: 0.9em">*enter valid details, before accepting, details would be checked online</p>
                                <br>
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
                                            <input name="g" type="radio" class="form-check-input" value="Bakery"/> Bakery<br><br>
                                            <input name="g" type="radio" class="form-check-input" value="Bhojanalya"/> Bhojanalya<br><br>
                                            <input name="g" type="radio" class="form-check-input" value="Casual Dining"/> Casual Dining<br><br>
                                            <input name="g" type="radio" class="form-check-input" value="Confectionery"/> Confectionery<br><br>
                                            <input name="g" type="radio" class="form-check-input" value="Fine Dining"/> Fine Dining<br><br>
                                            <input name="g" type="radio" class="form-check-input" value="Irani Cafe"/> Irani Cafe<br><br>
                                            <input name="g" type="radio" class="form-check-input" value="Mess"/> Mess<br><br>
                                            <input name="g" type="radio" class="form-check-input" value="Pub"/> Pub<br><br>
                                            <input name="g" type="radio" class="form-check-input" value="Sweet Shop"/> Sweet Shop<br><br><br>
                                        </div>

                                        <div class="col">
                                            <input name="g" type="radio" class="form-check-input" value="Bar"/> Bar<br><br>
                                            <input name="g" type="radio" class="form-check-input" value="Butcher Shop"/> Butcher Shop<br><br>
                                            <input name="g" type="radio" class="form-check-input" value="Club"/> Club<br><br>
                                            <input name="g" type="radio" class="form-check-input" value="Dessert Parlour"/> Dessert Parlour<br><br>
                                            <input name="g" type="radio" class="form-check-input" value="Food Court"/> Food Court<br><br>
                                            <input name="g" type="radio" class="form-check-input" value="Kiosk"/> Kiosk<br><br>
                                            <input name="g" type="radio" class="form-check-input" value="Microbrewery"/> Microbrewery<br><br>
                                            <input name="g" type="radio" class="form-check-input" value="Quick Bites"/> Quick Bites<br>
                                        </div>

                                        <div class="col">
                                            <input name="g" type="radio" class="form-check-input" value="Beverage Shop"/> Beverage Shop<br><br>
                                            <input name="g" type="radio" class="form-check-input" value="Café"/> Cafe<br><br>
                                            <input name="g" type="radio" class="form-check-input" value="Cocktail Bar"/> Cocktail Bar<br><br>
                                            <input name="g" type="radio" class="form-check-input" value="Dhaba"/> Dhaba<br><br>
                                            <input name="g" type="radio" class="form-check-input" value="Food Truck"/> Food Truck<br><br>
                                            <input name="g" type="radio" class="form-check-input" value="Lounge"/> Lounge<br><br>
                                            <input name="g" type="radio" class="form-check-input" value="Paan Shop"/> Paan Shop<br><br>
                                            <input name="g" type="radio" class="form-check-input" value="Shack"/> Shack<br>
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
                                            <input name="h" type="checkbox" class="form-check-input" value="Afghan"/> Afghan<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="African"/> African<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="American"/> American<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Andhra"/> Andhra<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Arabian"/> Arabian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Asian"/> Asian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Asian Fusion"/> Asian Fusion<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Assamese"/> Assamese<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Australian"/> Australian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Awadhi"/> Awadhi<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Bakery"/> Bakery<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Bangladeshi"/> Bangladeshi<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Bar Food"/> Bar Food<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="BBQ"/> BBQ<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Belgian"/> Belgian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Bengali"/> Bengali<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Beverages"/> Beverages<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Bihari"/> Bihari<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Biryani"/> Biryani<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Bohri"/> Bohri<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Brazilian"/> Brazilian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="British"/> British<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Bubble Tea"/> Bubble Tea<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Burger"/> Burger<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Burmese"/> Burmese<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Cafe"/> Cafe<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Cafe Food"/> Cafe Food<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Cake"/> Cake<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Cantonese"/> Cantonese<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Charcoal Chicken"/> Charcoal Chicken<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Chettinad"/> Chettinad<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Chili"/> Chili<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Chinese"/> Chinese<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Coffee"/> Coffee<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Coffee and Tea"/> Coffee and Tea<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Continental"/> Continental<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Desserts"/> Desserts<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Drinks Only"/> Drinks Only<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Egyptian"/> Egyptian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Ethiopian"/> Ethiopian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="European"/> European<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Fast Food"/> Fast Food<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Finger Food"/> Finger Food<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="French"/> French<br><br><br>
                                        </div>

                                        <div class="col">
                                            <input name="h" type="checkbox" class="form-check-input" value="Fried Chicken"/> Fried Chicken<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Frozen Yogurt"/> Frozen Yogurt<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Fusion"/> Fusion<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Garhwali"/> Garhwali<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="German"/> German<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Goan"/> Goan<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Greek"/> Greek<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Grill"/> Grill<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Gujarati"/> Gujarati<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Healthy Food"/> Healthy Food<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Himachali"/> Himachali<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Hyderabadi"/> Hyderabadi<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Ice Cream"/> Ice Cream<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Indian"/> Indian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Indonesian"/> Indonesian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Iranian"/> Iranian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Irish"/> Irish<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Israeli"/> Israeli<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Italian"/> Italian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Japanese"/> Japanese<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Juices"/> Juices<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Kashmiri"/> Kashmiri<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Kebab"/> Kebab<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Kerala"/> Kerala<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Konkan"/> Konkan<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Korean"/> Korean<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Lebanese"/> Lebanese<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Lucknowi"/> Lucknowi<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Maharashtrian"/> Maharashtrian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Malaysian"/> Malaysian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Malwani"/> Malwani<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Mandi"/> Mandi<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Mangalorean"/> Mangalorean<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Mediterranean"/> Mediterranean<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Mexican"/> Mexican<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Middle Eastern"/> Middle Eastern<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Mishti"/> Mishti<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Mithai"/> Mithai<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Modern Indian"/> Modern Indian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Momos"/> Momos<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Mongolian"/> Mongolian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Moroccan"/> Moroccan<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Mughlai"/> Mughlai<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Naga"/> Naga<br><br>
                                        </div>

                                        <div class="col">
                                            <input name="h" type="checkbox" class="form-check-input" value="Nepalese"/> Nepalese<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="North Eastern"/> North Eastern<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="North Indian"/> North Indian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Odia"/> Odia<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Oriental"/> Oriental<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Paan"/> Paan<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Pakistani"/> Pakistani<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Pan Asian"/> Pan Asian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Panini"/> Panini<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Parsi"/> Parsi<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Peruvian"/> Peruvian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Pizza"/> Pizza<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Poké"/> Poké<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Portuguese"/> Portuguese<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Rajasthani"/> Rajasthani<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Raw Meat"/> Raw Meats<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Roast Chicken"/> Roast Chicken<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Rolls"/> Rolls<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Russian"/> Russian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Salad"/> Salad<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Sandwich"/> Sandwich<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Seafood"/> Seafood<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Sindhi"/> Sindhi<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Singaporean"/> Singaporean<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="South American"/> South American<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="South Indian"/> South Indian<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Spanish"/> Spanish<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Sri Lankan"/> Sri Lankan<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Steak"/> Steak<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Street Food"/> Street Food<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Sushi"/> Sushi<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Swedish"/> Swedish<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Tamil"/> Tamil<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Tea"/> Tea<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Tex-Mex"/> Tex-Mex<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Thai"/> Thai<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Tibetan"/> Tibetan<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Turkish"/> Turkish<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Vietnamese"/> Vietnamese<br><br>
                                            <input name="h" type="checkbox" class="form-check-input" value="Wraps"/> Wraps<br><br>
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
                                    <option value="12:00 AM" selected>12:00 AM</option>
                                    <option value="12:15 AM" >12:15 AM</option>
                                    <option value="12:30 AM" >12:30 AM</option>
                                    <option value="12:45 AM" >12:45 AM</option>
                                    <option value="1:00 AM" >1:00 AM</option>
                                    <option value="1:15 AM" >1:15 AM</option>
                                    <option value="1:30 AM" >1:30 AM</option>
                                    <option value="1:45 AM" >1:45 AM</option>
                                    <option value="2:00 AM" >2:00 AM</option>
                                    <option value="2:15 AM" >2:15 AM</option>
                                    <option value="2:30 AM" >2:30 AM</option>
                                    <option value="2:45 AM" >2:45 AM</option>
                                    <option value="3:00 AM" >3:00 AM</option>
                                    <option value="3:15 AM" >3:15 AM</option>
                                    <option value="3:30 AM" >3:30 AM</option>
                                    <option value="3:45 AM" >3:45 AM</option>
                                    <option value="4:00 AM" >4:00 AM</option>
                                    <option value="4:15 AM" >4:15 AM</option>
                                    <option value="4:30 AM" >4:30 AM</option>
                                    <option value="4:45 AM" >4:45 AM</option>
                                    <option value="5:00 AM" >5:00 AM</option>
                                    <option value="5:15 AM" >5:15 AM</option>
                                    <option value="5:30 AM" >5:30 AM</option>
                                    <option value="5:45 AM" >5:45 AM</option>
                                    <option value="6:00 AM" >6:00 AM</option>
                                    <option value="6:15 AM" >6:15 AM</option>
                                    <option value="6:30 AM" >6:30 AM</option>
                                    <option value="6:45 AM" >6:45 AM</option>
                                    <option value="7:00 AM" >7:00 AM</option>
                                    <option value="7:15 AM" >7:15 AM</option>
                                    <option value="7:30 AM" >7:30 AM</option>
                                    <option value="7:45 AM" >7:45 AM</option>
                                    <option value="8:00 AM" selected>8:00 AM</option>
                                    <option value="8:15 AM" >8:15 AM</option>
                                    <option value="8:30 AM" >8:30 AM</option>
                                    <option value="8:45 AM" >8:45 AM</option>
                                    <option value="9:00 AM" >9:00 AM</option>
                                    <option value="9:15 AM" >9:15 AM</option>
                                    <option value="9:30 AM" >9:30 AM</option>
                                    <option value="9:45 AM" >9:45 AM</option>
                                    <option value="10:00 AM" >10:00 AM</option>
                                    <option value="10:15 AM" >10:15 AM</option>
                                    <option value="10:30 AM" >10:30 AM</option>
                                    <option value="10:45 AM" >10:45 AM</option>
                                    <option value="11:00 AM" >11:00 AM</option>
                                    <option value="11:15 AM" >11:15 AM</option>
                                    <option value="11:30 AM" >11:30 AM</option>
                                    <option value="11:45 AM" >11:45 AM</option>
                                    <option value="12:00 AM" >12:00 PM</option>
                                    <option value="12:15 PM" >12:15 PM</option>
                                    <option value="12:30 PM" >12:30 PM</option>
                                    <option value="12:45 PM" >12:45 PM</option>
                                    <option value="1:00 PM" >1:00 PM</option>
                                    <option value="1:15 PM" >1:15 PM</option>
                                    <option value="1:30 PM" >1:30 PM</option>
                                    <option value="1:45 PM" >1:45 PM</option>
                                    <option value="2:00 PM" >2:00 PM</option>
                                    <option value="2:15 PM" >2:15 PM</option>
                                    <option value="2:30 PM" >2:30 PM</option>
                                    <option value="2:45 PM" >2:45 PM</option>
                                    <option value="3:00 PM" >3:00 PM</option>
                                    <option value="3:15 PM" >3:15 PM</option>
                                    <option value="3:30 PM" >3:30 PM</option>
                                    <option value="3:45 PM" >3:45 PM</option>
                                    <option value="4:00 PM" >4:00 PM</option>
                                    <option value="4:15 PM" >4:15 PM</option>
                                    <option value="4:30 PM" >4:30 PM</option>
                                    <option value="4:45 PM" >4:45 PM</option>
                                    <option value="5:00 PM" >5:00 PM</option>
                                    <option value="5:15 PM" >5:15 PM</option>
                                    <option value="5:30 PM" >5:30 PM</option>
                                    <option value="5:45 PM" >5:45 PM</option>
                                    <option value="6:00 PM" >6:00 PM</option>
                                    <option value="6:15 PM" >6:15 PM</option>
                                    <option value="6:30 PM" >6:30 PM</option>
                                    <option value="6:45 PM" >6:45 PM</option>
                                    <option value="7:00 PM" >7:00 PM</option>
                                    <option value="7:15 PM" >7:15 PM</option>
                                    <option value="7:30 PM" >7:30 PM</option>
                                    <option value="7:45 PM" >7:45 PM</option>
                                    <option value="8:00 PM" >8:00 PM</option>
                                    <option value="8:15 PM" >8:15 PM</option>
                                    <option value="8:30 PM" >8:30 PM</option>
                                    <option value="8:45 PM" >8:45 PM</option>
                                    <option value="9:00 PM" >9:00 PM</option>
                                    <option value="9:15 PM" >9:15 PM</option>
                                    <option value="9:30 PM" >9:30 PM</option>
                                    <option value="9:45 PM" >9:45 PM</option>
                                    <option value="10:00 PM" >10:00 PM</option>
                                    <option value="10:15 PM" >10:15 PM</option>
                                    <option value="10:30 PM" >10:30 PM</option>
                                    <option value="10:45 PM" >10:45 PM</option>
                                    <option value="11:00 PM" >11:00 PM</option>
                                    <option value="11:15 PM" >11:15 PM</option>
                                    <option value="11:30 PM" >11:30 PM</option>
                                    <option value="11:45 PM" >11:45 PM</option>
                                </select>

                                <br>
                                <p style="color: grey; margin-left: 40px">Closing Time</p>
                                <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="j">
                                    <option value="12:00 AM">12:00 AM</option>
                                    <option value="12:15 AM" >12:15 AM</option>
                                    <option value="12:30 AM" >12:30 AM</option>
                                    <option value="12:45 AM" >12:45 AM</option>
                                    <option value="1:00 AM" >1:00 AM</option>
                                    <option value="1:15 AM" >1:15 AM</option>
                                    <option value="1:30 AM" >1:30 AM</option>
                                    <option value="1:45 AM" >1:45 AM</option>
                                    <option value="2:00 AM" >2:00 AM</option>
                                    <option value="2:15 AM" >2:15 AM</option>
                                    <option value="2:30 AM" >2:30 AM</option>
                                    <option value="2:45 AM" >2:45 AM</option>
                                    <option value="3:00 AM" >3:00 AM</option>
                                    <option value="3:15 AM" >3:15 AM</option>
                                    <option value="3:30 AM" >3:30 AM</option>
                                    <option value="3:45 AM" >3:45 AM</option>
                                    <option value="4:00 AM" >4:00 AM</option>
                                    <option value="4:15 AM" >4:15 AM</option>
                                    <option value="4:30 AM" >4:30 AM</option>
                                    <option value="4:45 AM" >4:45 AM</option>
                                    <option value="5:00 AM" >5:00 AM</option>
                                    <option value="5:15 AM" >5:15 AM</option>
                                    <option value="5:30 AM" >5:30 AM</option>
                                    <option value="5:45 AM" >5:45 AM</option>
                                    <option value="6:00 AM" >6:00 AM</option>
                                    <option value="6:15 AM" >6:15 AM</option>
                                    <option value="6:30 AM" >6:30 AM</option>
                                    <option value="6:45 AM" >6:45 AM</option>
                                    <option value="7:00 AM" >7:00 AM</option>
                                    <option value="7:15 AM" >7:15 AM</option>
                                    <option value="7:30 AM" >7:30 AM</option>
                                    <option value="7:45 AM" >7:45 AM</option>
                                    <option value="8:00 AM" >8:00 AM</option>
                                    <option value="8:15 AM" >8:15 AM</option>
                                    <option value="8:30 AM" >8:30 AM</option>
                                    <option value="8:45 AM" >8:45 AM</option>
                                    <option value="9:00 AM" >9:00 AM</option>
                                    <option value="9:15 AM" >9:15 AM</option>
                                    <option value="9:30 AM" >9:30 AM</option>
                                    <option value="9:45 AM" >9:45 AM</option>
                                    <option value="10:00 AM" >10:00 AM</option>
                                    <option value="10:15 AM" >10:15 AM</option>
                                    <option value="10:30 AM" >10:30 AM</option>
                                    <option value="10:45 AM" >10:45 AM</option>
                                    <option value="11:00 AM" >11:00 AM</option>
                                    <option value="11:15 AM" >11:15 AM</option>
                                    <option value="11:30 AM" >11:30 AM</option>
                                    <option value="11:45 AM" >11:45 AM</option>
                                    <option value="12:00 AM" >12:00 PM</option>
                                    <option value="12:15 PM" >12:15 PM</option>
                                    <option value="12:30 PM" >12:30 PM</option>
                                    <option value="12:45 PM" >12:45 PM</option>
                                    <option value="1:00 PM" >1:00 PM</option>
                                    <option value="1:15 PM" >1:15 PM</option>
                                    <option value="1:30 PM" >1:30 PM</option>
                                    <option value="1:45 PM" >1:45 PM</option>
                                    <option value="2:00 PM" >2:00 PM</option>
                                    <option value="2:15 PM" >2:15 PM</option>
                                    <option value="2:30 PM" >2:30 PM</option>
                                    <option value="2:45 PM" >2:45 PM</option>
                                    <option value="3:00 PM" >3:00 PM</option>
                                    <option value="3:15 PM" >3:15 PM</option>
                                    <option value="3:30 PM" >3:30 PM</option>
                                    <option value="3:45 PM" >3:45 PM</option>
                                    <option value="4:00 PM" >4:00 PM</option>
                                    <option value="4:15 PM" >4:15 PM</option>
                                    <option value="4:30 PM" >4:30 PM</option>
                                    <option value="4:45 PM" >4:45 PM</option>
                                    <option value="5:00 PM" >5:00 PM</option>
                                    <option value="5:15 PM" >5:15 PM</option>
                                    <option value="5:30 PM" >5:30 PM</option>
                                    <option value="5:45 PM" >5:45 PM</option>
                                    <option value="6:00 PM" selected>6:00 PM</option>
                                    <option value="6:15 PM" >6:15 PM</option>
                                    <option value="6:30 PM" >6:30 PM</option>
                                    <option value="6:45 PM" >6:45 PM</option>
                                    <option value="7:00 PM" >7:00 PM</option>
                                    <option value="7:15 PM" >7:15 PM</option>
                                    <option value="7:30 PM" >7:30 PM</option>
                                    <option value="7:45 PM" >7:45 PM</option>
                                    <option value="8:00 PM" >8:00 PM</option>
                                    <option value="8:15 PM" >8:15 PM</option>
                                    <option value="8:30 PM" >8:30 PM</option>
                                    <option value="8:45 PM" >8:45 PM</option>
                                    <option value="9:00 PM" >9:00 PM</option>
                                    <option value="9:15 PM" >9:15 PM</option>
                                    <option value="9:30 PM" >9:30 PM</option>
                                    <option value="9:45 PM" >9:45 PM</option>
                                    <option value="10:00 PM" >10:00 PM</option>
                                    <option value="10:15 PM" >10:15 PM</option>
                                    <option value="10:30 PM" >10:30 PM</option>
                                    <option value="10:45 PM" >10:45 PM</option>
                                    <option value="11:00 PM" >11:00 PM</option>
                                    <option value="11:15 PM" >11:15 PM</option>
                                    <option value="11:30 PM" >11:30 PM</option>
                                    <option value="11:45 PM" >11:45 PM</option>
                                </select>
                                <br><br>
                            </div>
                        </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <br><div class="details-col col col2">
                                <br><h4 style="font-weight: 700; margin-left: 20px">6. Restaurant Images</h4>
                                <p style="color: grey; margin-left: 40px; font-size: 0.9em">Upload various pictures of your outlet</p>
                                <br>
                                <input id="images" type="file" style="margin-left: 40px; padding: 10px;" accept="image/png, image/jpeg" name="k"/>
                                <br><br><br>
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

<%@ include file="footer.jsp"%>

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
        const g = document.getElementById("license-number");

        if (!a.value || !b.value || !c.value || !d.value || !e.value || !f.value || !g.value) {
            alert("All fields are required.");
            event.preventDefault();
        }
    });

</script>
</body>
</html>
