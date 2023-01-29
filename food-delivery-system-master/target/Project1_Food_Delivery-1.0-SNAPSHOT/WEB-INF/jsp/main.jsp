<%-- 
    Document   : Home
    Created on : Jan 22, 2023, 11:56:51 AM
    Author     : mrina
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Food Delivery System</title>
        <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">

        <style>
            .text
            {
                font-size: 10px;
            }
            .Search-bar
            {
                margin-left: 500px;
                width: 200px;
                padding-left: 10px;
                padding-right: 10px;
                padding-top: 10px;
                padding-bottom: 10px;
                margin-top: 20px;
                display: inline;
               
            }
            .Home
            {
                background-color: white;
                border-radius: 20px;
                padding-left: 10px;
                padding-right: 10px;
                padding-top: 10px;
                padding-bottom: 10px;
                cursor:pointer;
                font-size:15px;
                margin-left: 20px;
            }
            .Home:hover
            {
                background-color: grey;
                box-shadow: 5px 5px 10px black;
                color:white;
                opacity: 0.6;
            }
            .Contactus
            {
                background-color: white;
                border-radius: 20px;
                padding-left: 10px;
                padding-right: 10px;
                padding-top: 10px;
                padding-bottom: 10px;
                cursor:pointer;
                font-size:15px;
                margin-left: 20px;
            }
            .Contactus:hover
            {
                background-color: grey;
                box-shadow: 5px 5px 10px black;
                color:white;
                opacity: 0.6;
            }
            .img
            {
                margin-top:70px;
                width:250px;
                margin-left: 20px;
                transition: all 0.5s ease;
            }
             .img:hover 
            {
                transform: scale(1.4); 
            }
            .Price
            {
                margin-bottom:40px;
                font-size:20px;
                margin-left: 30px;
                width:300px;
                border-color: black;
                display:inline-block;
            }
            .addtocart
            {
                
                background-color: white;
                border-radius: 20px;
                padding-left: 8px;
                padding-right: 8px;
                padding-top: 8px;
                padding-bottom: 8px;
                cursor:pointer;
                font-size:15px;
                margin-left: 20px; 
                display:inline-block;
            }
             .addtocart:hover
            {
                
                background-color: grey;
                box-shadow: 5px 5px 10px black;
                color:white;
                opacity: 0.6;
                
            }
            .text
            {
                display: inline-block;
                padding-left: 100px;
            }
            .algn
            {
                background-color: grey;
                display: grid;
                grid-template-columns: 1fr 1fr 1fr;
                column-gap: 40px;
                row-gap: 40px;
                
                
            }
          
        </style>
    </head>
    <body>
      
        <input class="Search-bar" type="text" placeholder="Search &#128269" >
       
    <button class="Home">Home</button>
        <button class="Contactus">Contact Us</button>
   
        <div class="algn">
            <div class="div2">
                <img class="img" alt="myimage" src="<c:url value="/resources/img/pizza.jpg" />">
                <p class="Price">Price 200 <button class="addtocart">Add to cart</button></p>
            </div>
            
            <div>
                 <img class="img" alt="myimage" src="<c:url value="/resources/img/doubbur.jpg" />">
                <p class="Price">Price 200 <button class="addtocart">Add to cart</button></p> 
            </div>
          
            <div>
                <img class="img" alt="myimage" src="<c:url value="/resources/img/momos.jpg" />">
                <p class="Price">Price 70 <button class="addtocart">Add to cart</button></p>
            </div>
            
            <div>
                <img class="img" alt="myimage" src="<c:url value="/resources/img/moodles.jpg" />">
                <p class="Price">Price 100 <button class="addtocart">Add to cart</button></p>            
            </div>
            
            <div>
                <img class="img" alt="myimage" src="<c:url value="/resources/img/vegsand.jpg" />">
                <p class="Price">Price 50 <button class="addtocart">Add to cart</button></p>
            </div>
                
            <div>    
                <img class="img" alt="myimage" src="<c:url value="/resources/img/combo.jpg" />">
                <p class="Price">Price 100 <button class="addtocart">Add to cart</button></p>
            </div>
                
            <div>
                <img class="img" alt="myimage" src="<c:url value="/resources/img/hotdog.jpg" />">
                <p class="Price">Price 200 <button class="addtocart">Add to cart</button></p>
            </div>
                
            <div>
                <img class="img" alt="myimage" src="<c:url value="/resources/img/paasta.jpg" />">
                <p class="Price">Price 200 <button class="addtocart">Add to cart</button></p>
            </div>
                
            <div>
                <img class="img" alt="myimage" src="<c:url value="/resources/img/paasta.jpg" />">
                <p class="Price">Price 100 <button class="addtocart">Add to cart</button></p>
            </div>
                
            <div>
                <img class="img" alt="myimage" src="<c:url value="/resources/img/pav.jpeg" />">
                <p class="Price">Price 200 <button class="addtocart">Add to cart</button></p>
            </div>
                
            <div>
                <img class="img" alt="myimage" src="<c:url value="/resources/img/dosa.jpg" />">
                <p class="Price">Price 200 <button class="addtocart">Add to cart</button></p>
            </div>
                
              <div>
                <img class="img" alt="myimage" src="<c:url value="/resources/img/pav.jpeg" />">
                <p class="Price">Price 200 <button class="addtocart">Add to cart</button></p>
            </div>
                
             <div>
                <img class="img" alt="myimage" src="<c:url value="/resources/img/pizza.jpg" />">
                <p class="Price">Price 200 <button class="addtocart">Add to cart</button></p>
            </div>
            
            <div>
                 <img class="img" alt="myimage" src="<c:url value="/resources/img/doubbur.jpg" />">
                 <p class="Price">Price 80 <button class="addtocart">Add to cart</button></p> 
            </div>
          
            <div>
                <img class="img" alt="myimage" src="<c:url value="/resources/img/momos.jpg" />">
                <p class="Price">Price 70 <button class="addtocart">Add to cart</button></p>
            </div>
            
            <div>
                <img class="img" alt="myimage" src="<c:url value="/resources/img/moodles.jpg" />">
                <p class="Price">Price 100 <button class="addtocart">Add to cart</button></p>
            </div>
            
            <div>
                <img class="img" alt="myimage" src="<c:url value="/resources/img/vegsand.jpg" />">
                <p class="Price">Price 50 <button class="addtocart">Add to cart</button></p>
            </div>
                
            <div>    
                <img class="img" alt="myimage" src="<c:url value="/resources/img/combo.jpg" />">
                <p class="Price">Price 100 <button class="addtocart">Add to cart</button></p>
            </div>
                
            <div>
                <img class="img" alt="myimage" src="<c:url value="/resources/img/hotdog.jpg" />">
                <p class="Price">Price 200 <button class="addtocart">Add to cart</button></p>
            </div>
                
            <div>
                <img class="img" alt="myimage" src="<c:url value="/resources/img/paasta.jpg" />">
                <p class="Price">Price 200 <button class="addtocart">Add to cart</button></p>
            </div>
                
             <div>
                <img class="img" alt="myimage" src="<c:url value="/resources/img/paasta.jpg" />">
                <p class="Price">Price 150 <button class="addtocart">Add to cart</button></p>
                
            </div>
        </div>
    </body>
</html>
            
       

    
