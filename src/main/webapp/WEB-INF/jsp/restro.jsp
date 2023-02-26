<%-- 
    Document   : restro
    Created on : Feb 25, 2023, 9:55:29 PM
    Author     : mrina
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.script.ScriptEngine"%>
<%@page import="javax.script.ScriptEngineManager"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="org.springframework.stereotype.Controller"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!DOCTYPE html>
<%
String value =(String) request.getParameter("var");
long id=Long.parseLong(value);
System.out.println(value);
int cnt=0;
%>

<html>
    <head>
        <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@3.6.12/dist/css/splide.min.css">
        
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.4.3/css/bootstrap.min.css" integrity="sha512-Gygy+YKihAVv6p7FDG/M83LoZU0JQKDTwxxUfbsDy12CnTNzLjJXkrv7p6cnxNHe+Zn2nNoucNpyU2Bz5o5+FQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-HaIBjKdRVq3vI1+tnDkTjy0V0sbYtuDDv7o/ScbAV0Z7cWgE8wFonVhFxZzJ+O/k" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.4.3/js/bootstrap.min.js" integrity="sha512-l4Zep0JxRwRgJ82KjmgzrHn1jLcIaiR9Y9XZlNtuzjJ2n1+G3qDdCk7JzHzsISdP7oW9D8ymZ7jzZbAoy/LmVg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,0" />


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
          crossorigin="anonymous">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
        
        <style>
            td{
            padding: 30px 64px 50px 0;
        }
        
        #slider-container {
            margin: 10px 0;
            margin-left: 0px;
            width: 100%;
            position: relative;
          }

          #slider {
            -webkit-appearance: none;
            width: 100%;
            height: 20px;
            border-radius: 50px;
            background: #ddd;
            outline: none;
            opacity: 0.7;
            -webkit-transition: .2s;
            transition: opacity .2s;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
          }

          #slider::-webkit-slider-thumb {
            -webkit-appearance: none;
            appearance: none;
            width: 25px;
            height: 25px;
            border-radius: 50px;
            padding: 15px;
            background: blue;
            cursor: pointer;
          }

          #slider::-moz-range-thumb {
            width: 25px;
            height: 25px;
            border-radius: 50px;
            padding: 10px;
            background: blue;
            cursor: pointer;
          }

          #slider-labels {
            position: absolute;
            width: 100%;
            display: flex;
            justify-content: space-between;
            top: 3px;
            left: 0;
          }

          .slider-label {
            font-size: 14px;
            font-weight: bold;
            text-align: center;
            width: 20px;
          }

          #slider-value {
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
          }

          button[type="submit"] {
            margin-top: 20px;
            width: 100%;
          }
          
          .rating-button {
            padding: 5px 10px;
            background-color: lightblue;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            text-transform: uppercase;
            margin-bottom: 10px;
          }
        </style>
        
    </head>
    <body>
        <%@ include file="header-bg-dark.jsp"%>
        <br>
        <div class="container">
            <div class="row">
                <div class="col">
                    <%
                        
                        try{                        
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
                    Statement state = con.createStatement();

                    PreparedStatement stmt = con.prepareStatement("select * from restaurants, res_images where restaurants.res_id = res_images.res_id and restaurants.res_id=?");
                    stmt.setLong(1, id);
                    
                    System.out.println(id);
                    
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
                    
                <div class="card" style="width: 60%; height: 100%;background: linear-gradient(48deg, rgba(23,26,41,1) 0%, rgb(20,23,37) 76%, rgb(32,37,56) 95%); justify-content: center;">
                    <div class="row no-gutters">
                      <div class="col-md-4" style="width: 100%;">
                        <img class="card-img-top" alt="..." align="left" src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(imageBytes) %>"/>
                      </div>
                    </div>
                </div>
                <div class="card" style="width: 100%; background: linear-gradient(48deg, rgba(23,26,41,1) 0%, rgb(20,23,37) 76%, rgb(32,37,56) 95%); color: white;">
                    <div class="row no-gutters">
                        <div class="col-md-4" style="width: 100%;"><br>
                          <h1 class="card-title" align="center" style="font-family: Goudy old style;"><%= rs.getString("res_name")%></h1><hr style="width: 100%; color: white;">
                      </div>
                      <div class="col-md-8" style="width: 100%;justify-content: center;align-content: center;">
                        <div class="card-body" align="center">
                          <p class="card-text" style="font-size: 18px;">
                              <%= rs.getString("type") %><br>
                        <%float rate = rs.getFloat("rating");
                                        int x = (int) rate;
                                        for (int i=0; i<x; i++)
                                        {%>
                                            <span class="material-symbols-rounded" style="color: #3EC70B;">
                                                star
                                            </span>
                                        <%}
                                        if (rate%1!=0)
                                        {%>
                                            <span class="material-symbols-rounded" style="color: #3EC70B;">
                                                star_half
                                            </span>
                                        <%}
                                        %>
                        <br><%= rs.getString("cuisine") %>
                        <br>Loc: <a href="https://www.google.com/maps/search/?api=1&query=<%= rs.getString("address") %>" target="_blank"><%= rs.getString("address") %></a>
                        <br>Phone: <span itemprop="telephone"><a href="tel:+91<%= rs.getLong("res_phone") %>"><%= rs.getString("res_phone") %></a></span>
                        <br><%= rs.getString("timing_open") %> - <%= rs.getString("timing_close") %>
                        <br>
                          </p>
                        </div>
                      </div>
                    </div>
                </div>
                    <%}}catch (Exception k)
                    {
                        System.out.println(k.getMessage());
                    }%>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col">
                    <%
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
                    PreparedStatement stmt=con.prepareStatement("select count(*) from items where res_id=?");
                    stmt.setLong(1, id);
                    
                    ResultSet rst=stmt.executeQuery();
                    while (rst.next()) {
                        cnt = rst.getInt(1);
                    }
                }
                catch (Exception k){
                    System.out.println(k.getMessage());
                }
            %>
            <h4 class="res-heading"><%=cnt%> Items</h4>
                </div>
                <div class="col" align="right">
                    
                    <form action="submitresrate" method="post">
                        <div align="left" id="slider-container">
                            <input type="range" min="1" max="5" value="3" class="slider" id="slider" name="rating">
                            <div id="slider-labels">
                                <span class="slider-label">1</span>
                                <span class="slider-label">2</span>
                                <span class="slider-label">3</span>
                                <span class="slider-label">4</span>
                                <span class="slider-label">5</span>
                            </div><br>
                        </div>
                        <input type="hidden" name="rating" value="0">
                        <input type="hidden" name="username" value="<%= session.getAttribute("userName")%>">
                        <input type="hidden" name="res_id" value="<%= id %>">
                        <input type="submit" value="Submit Rating" class="rating-button">
                    </form>
                    
<!--                    <form action="submitresrate" method="post">
                        <input type="hidden" name="username" value="<%= session.getAttribute("userName")%>">
                        <input type="hidden" name="res_id" value="<%= id %>">
                        <input type="hidden" name="rating" id="star-rating">
                        <input class="star-rating" data-size="20" data-step="1" data-show-clear="false" data-show-caption="false" required>
                        <input type="submit" value="Submit Rating">
                    </form>-->
                </div>
                <hr style="width: 100%; color: grey">
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col">
                    <table>
                        <%
                            int colind = 0;
                            try{

                            Class.forName("com.mysql.cj.jdbc.Driver");

                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");

                            PreparedStatement stmt = con.prepareStatement("select * from items, item_images where items.item_id = item_images.item_id and items.res_id = ? order by rand()");
                            stmt.setLong(1, id);
                            
                            ResultSet rs = stmt.executeQuery();

                            while(rs.next()){
                                long m = rs.getLong("res_id");

                                PreparedStatement state = con.prepareStatement("select * from restaurants where res_id=?");
                                state.setLong(1, m);
                                ResultSet rst = state.executeQuery();
                                String l="";
                                while(rst.next()){
                                    l=rst.getString("res_name");
                                }

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
                        <td class="item-td" align="center">
                            <div class="card item-card" align="center" style="width: 14rem;">
                                    <img class="card-img-top" alt="..." align="center" src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(imageBytes) %>"/>
                                    <h4 class="card-title"><%= rs.getString("item_name")%></h4>
                                    <p class="card-text">
                                        <%float rate = rs.getFloat("rating");
                                        int x = (int) rate;
                                        for (int i=0; i<x; i++)
                                        {%>
                                            <span class="material-symbols-rounded" style="color: #3EC70B;">
                                                star
                                            </span>
                                        <%}
                                        if (rate%1!=0)
                                        {%>
                                            <span class="material-symbols-rounded" style="color: #3EC70B;">
                                                star_half
                                            </span>
                                        <%}%>
                                        <div style="color: #494949;"><%= rs.getString("description") %></div>
                                        <div class="price">Rs. <%= rs.getFloat("price") %></div>
                                    </p>
                            </div>
                        </td>
                        <%colind++;%>
                            <% if(colind % 4 == 0)
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
        <%@ include file="footer.jsp" %>
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@3.6.12/dist/js/splide.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-star-rating/4.0.2/css/star-rating.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-star-rating/4.0.2/js/star-rating.min.js"></script>

<script>
$(document).ready(function() {
  $('.star-rating').rating({
    filledStar: '<i class="fas fa-star"></i>',
    emptyStar: '<i class="far fa-star"></i>',
    onSelect: function(value, text) {
      $('#star-rating').val(value);
    }
  });
});
</script>

<script>
    const slider = document.getElementById("slider");
const sliderValue = document.getElementById("slider-value");

const updateSliderValue = (event) => {
  sliderValue.innerText = event.target.value;
};

slider.addEventListener("input", updateSliderValue);

</script>
    </body>
</html>
