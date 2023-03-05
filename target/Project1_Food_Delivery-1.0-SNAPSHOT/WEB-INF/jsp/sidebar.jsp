<%-- 
    Document   : sidebar
    Created on : Feb 19, 2023, 9:53:30 PM
    Author     : mrina
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.ByteArrayOutputStream" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% int cnt11=0;
boolean clicked=false;%>

<!DOCTYPE html>
<html>
    <head>
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.4.3/css/bootstrap.min.css" integrity="sha512-Gygy+YKihAVv6p7FDG/M83LoZU0JQKDTwxxUfbsDy12CnTNzLjJXkrv7p6cnxNHe+Zn2nNoucNpyU2Bz5o5+FQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-HaIBjKdRVq3vI1+tnDkTjy0V0sbYtuDDv7o/ScbAV0Z7cWgE8wFonVhFxZzJ+O/k" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.4.3/js/bootstrap.min.js" integrity="sha512-l4Zep0JxRwRgJ82KjmgzrHn1jLcIaiR9Y9XZlNtuzjJ2n1+G3qDdCk7JzHzsISdP7oW9D8ymZ7jzZbAoy/LmVg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>



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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@3.6.12/dist/css/splide.min.css">
    
    
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
          crossorigin="anonymous">
         <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@3.6.12/dist/css/splide.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Foodex | Cart</title>
        <style>
            .btn-circle.btn-sm {
                width: 40px;
                height: 40px;
                padding: 6px 0px;
                border-radius: 10px;
                font-size: 10px;
                text-align: center;
            }
            h2{
                color: white;
            }
            .row{
                display: flex;
            }
            .col-1 {
                align-items: center;
                width: 60%;
                height: 100%;
                box-shadow: rgba(60, 64, 67, 0.3) 0 1px 2px 0, rgba(60, 64, 67, 0.15) 0 1px 3px 1px;
                border-radius: 5px;
            }
            .col-2 {
                margin-left: 40px;
                align-items: center;
                width: 35%;
                height: 100%;
                box-shadow: rgba(60, 64, 67, 0.3) 0 1px 2px 0, rgba(60, 64, 67, 0.15) 0 1px 3px 1px;
                border-radius: 5px;
/*                position: fixed;*/
            }
            .col {
                display: flex;
                align-items: center;
            }
        </style>
    </head>
    

<body onload="findMyCoordinates()">
    
    <div class="main-container">
  <nav class="navbar navbar-expand-lg nav-main navbar-dark bg-dark" id="nav-main">
    <div class="container-fluid">
        <img src="<c:url value="/resources/img/logo-exp.png" />" alt="Foodex Logo" width="120px" style="margin-left: 40px;" /> |
        <h2> | My Cart</h2>
        <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-auto" style="display: flex; align-items: center; color: white;">
            <li class="nav-item">
                <a class="nav-link nav-reg" href="offers"><span class="material-symbols-outlined nav-icons">loyalty</span>Offers</a>
            </li>
        </ul>
    </div>
  </nav>
</div>
        <br>
<div class="container">
    <div class="row">
        <div class="col-1">
            <div id="sidebar">
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8", "root", "root");

                    PreparedStatement smt2 = con.prepareStatement("select sum(quantity) from cart where username=?");
                    smt2.setString(1, (String) session.getAttribute("userName"));

                    ResultSet rs3 = smt2.executeQuery();

                    while (rs3.next()) {
                        cnt11 = rs3.getInt(1);
                    }
            %>
            <br>
                <div align="right">
                <p style="background-color: #1e53ff; color: white; display: inline-block; width: 20%; margin-left: 20px; border-radius: 30px; padding: 7px; text-align: center; margin-right: 10px"><%= cnt11%> Item(s)</p>
                </div>
                <hr>
            <div align="center">
                <table>
                <%
                        PreparedStatement smt = con.prepareStatement("select * from cart where username=?");
                        smt.setString(1, (String) session.getAttribute("userName"));

                        ResultSet rst = smt.executeQuery();

                        float totalPrice= 0;
                        int quantity_final = 0;


                        while(rst.next()) {
                            long id = rst.getLong("item_id");
//                            long  cartItemId = rst.getLong("item_id");
                            PreparedStatement smt1 = con.prepareStatement("select * from items, item_images where items.item_id = item_images.item_id and items.item_id=?");
                            smt1.setLong(1, id);

                            ResultSet rs = smt1.executeQuery();

                            if(rs.next()) {
                                Blob imageBlob = rs.getBlob("data");
                                InputStream imageStream = imageBlob.getBinaryStream();
                                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                                byte[] buffer = new byte[4096];
                                int n = 0;
                                while (-1 != (n = imageStream.read(buffer))) {
                                    outputStream.write(buffer, 0, n);
                                }
                                byte[] imageBytes = outputStream.toByteArray();

                                int qty = rst.getInt("quantity");
                %>
                    <tr class="item-td" align="center">
                            <div align="center" class="card item-card" style="width: 60%;">
                                <div align="center">
                                    <img class="card-img-top" alt="..." align="center" src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(imageBytes) %>"/></div>
                                <h4 class="card-title" style="margin-top: 10px"><%= rs.getString("item_name")%></h4>
                                <p class="card-text">
                                    <%
                                        float prc = rs.getFloat("price");
                                        float prc_fin = prc*qty;
                                        totalPrice += prc_fin;
                                        quantity_final += qty;
                                    %>
                                <p>
                                    Price of one: Rs <%= prc%><br>
                                    Price: Rs <%= prc_fin%><br>
                                    Quantity(ies): <%= qty%>
                                    </p>
                                <div style="display: flex; margin-top: 1px; margin-bottom: 15px; justify-content: center; align-items: center;">
                                    <form action="deletecart" method="post">
                                        <button type="submit" id="cart-btn" class="btn btn-primary btn-circle btn-sm" style="">
                                            <span class="material-symbols-outlined">delete</span>
                                        </button><br>
                                            <input name="a" value="<%= rs.getLong("item_id") %>" hidden>
                                    </form>
                                    <form action="updatecart" method="post">
                                        <button type="submit" name="action" value="remove" class="btn btn-dark" style="margin-right: 5px; margin-left: 10px; width: 30px; height: 30px; padding: 2px 0px; border-radius: 50px; text-align: center;">
                                            <span class="material-symbols-outlined">remove</span>
                                        </button>
                                            <h7 style="font-weight: 500;"><%= qty%></h7>
                                            <input name="qty" value="<%= qty %>" readonly hidden>
                                        <button type="submit" name="action" value="add" class="btn btn-dark" style="margin-right: 10px; margin-left: 5px; width: 30px; height: 30px; padding: 2px 0px; border-radius: 50px; text-align: center;">
                                            <span class="material-symbols-outlined">add</span>
                                            <input name="b" value="<%= rs.getLong("item_id") %>" hidden>
                                        </button>
                                    </form>
                                </div>
                                </p>
                            </div>
                    </tr>
                </table>
                <%}}%>
                <% String ofrcode = (String) session.getAttribute("Available");
                float offerval=0;
                float beforeprice=0;
                if (ofrcode=="0")
                {
                %>
                <form action="checkout" method="post">
                    <input name="a" value="<%= totalPrice*100%>" hidden/>
                    <br><br>
                    <h4>Total Price: <%= totalPrice%></h4>
                    <div align="center">
                        <a href="payment"><button  class="btn btn-primary" style="border-radius: 30px; background-color: #1e53ff; margin-top: 10px!important; ">Proceed to Checkout</button></a>
                    </div><br>
                </form>
                <%}
                else{%>
                <form action="checkout" method="post">
                    <%
                        PreparedStatement state = con.prepareStatement("select * from offers where offer_code=?");
                        state.setString(1, ofrcode);
                        
                        ResultSet res=state.executeQuery();
                        if(res.next())
                        {
                            offerval=res.getFloat("offer_value");
                        }
                        beforeprice=totalPrice;
                        totalPrice=totalPrice-((totalPrice)*(offerval/100));
                    %>
                    <input name="a" value="<%= totalPrice*100%>" hidden/>
                    <br><br>
                    <h4>Total Price: <%= beforeprice%></h4>
                    <h4>Total Price after reduction: <%= totalPrice%></h4>
                    <div align="center">
                        <a href="payment"><button  class="btn btn-primary" style="border-radius: 30px; background-color: #1e53ff; margin-top: 10px!important; ">Proceed to Checkout</button></a>
                    </div><br><h5 style="font-family: 'Poppins', sans-serif; text-align: center;">*<%= session.getAttribute("Available")%> offer code used</h5><br>
                </form>
                <form action="offerdel" method="post" style="font-family: 'Poppins', sans-serif;" id="form">
                    <input type="submit" name="submit-button" id="check" value="Clear offer"/><br><br>
                </form>
                <%}%>
                    <%
                } catch (Exception e) {
                        System.out.println(e);
                    }
                %>
            </div>
        </div>   
    </div>
            <div class="col-2">
                <br>
                <h3 style="font-family: 'Poppins', sans-serif; text-align: center;">Good chance to grab small discounts on your items</h3>
                <form action="offercheck" method="post" style="font-family: 'Poppins', sans-serif;" id="form">
                    <input type="text" id="offer-value" class="form-control form-input" placeholder="Enter any existing offer code" name="a"/><br>
                    <input class="form-control form-input submit-btn" type="submit" name="submit-button" id="check" value="   Check   "/><br>
                </form>
                <br><hr>
                <h4 style="font-family: 'Poppins', sans-serif; text-align: center;">Choose Delivery address</h4>
<!--                <input type="text" align="center" placeholder="Enter your Location" value="<%= session.getAttribute("currentLocation")%>" class="location-input"><br><br>
                <h7 style="font-family: 'Poppins', sans-serif;">or</h7>-->
                <h6 style="font-family: 'Poppins', sans-serif;">Select from below registered addresses under you</h6>
                <%
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8", "root", "root");
                        PreparedStatement state = con.prepareStatement("select * from deliver_address where username=?");
                        state.setString(1, (String) session.getAttribute("userName"));
                        
                        ResultSet rs = state.executeQuery();%>
                        <table class="table table-striped table-hover users-table">
                            <tr>
                                <th>Name</th>
                                <th>Address(es)</th>
                                <th>Select  </th>
                            </tr>
                        <%
                        while (rs.next())
                        {
                            out.println("<tr>");%>
                            <td><%= rs.getString("name")%></td>
                            <td><a href="https://www.google.com/maps/search/?api=1&query=<%= rs.getString("address") %>" target="_blank" style="text-decoration: none; color: black;"><%= rs.getString("address") %></a></td>
                            <td style="width: 10px;"><form action="selectaddress" method="post">
                                    <button type="submit" style="border: none;">
                                            <span class="material-symbols-outlined" style="color: blue;">where_to_vote</span>
                                    </button><br>
                                    <input name="a" value="<%= rs.getLong("del_id")%>" hidden>
                                </form>
                            </td>
                            <%out.println("</tr>");
                        }%>
                        </table>
                    <%}
                    catch (Exception k)
                    {
                        System.out.println(k.getMessage());
                    }
                %>
                <h7 style="font-family: 'Poppins', sans-serif;">or</h7>
                <form action="newaddress" method="post" style="font-family: 'Poppins', sans-serif;" id="form">
                    <input type="text" id="address" class="form-control form-input" placeholder="Enter another address" name="a"/><br>
                    <input type="text" id="name" class="form-control form-input" placeholder="Person's name" name="b"/><br>
                    <input class="form-control form-input submit-btn" type="submit" name="submit-button" value="   Add   "/><br>
                </form>
            </div>
</div>   
    </div>
            <%@ include file="footer.jsp"%>    
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
            
            <script>
               var addButton = document.getElementById("add-btn");
    var minusButton = document.getElementById("minus-btn");
    var quantityInput = document.getElementById("quantity-input");
    var form = document.getElementById("cart-form");

    addButton.addEventListener("click", function() {
        if (parseInt(quantityInput.value) < 4) { // check if current value is less than 4
            quantityInput.value = parseInt(quantityInput.value) + 1;
            submitForm();
        }
    });

    minusButton.addEventListener("click", function() {
        if (parseInt(quantityInput.value) > 1) { // check if current value is greater than 1
            quantityInput.value = parseInt(quantityInput.value) - 1;
            submitForm();
        }
    });

    function submitForm() {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", form.action, true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // handle any response from the server if necessary
            }
        };
        xhr.send("cartItemId=" + form.elements["cartItemId"].value + "&quantity=" + quantityInput.value);
    }
    
    const http = new XMLHttpRequest();
    let result = document.querySelector("#currentLoc");

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
    
    function clearSession() {
  session.removeAttribute("Available");
}

    document.getElementById('check').addEventListener('click', function() {
        <% clicked = true; %>
            </script>
    </body>
</html>
