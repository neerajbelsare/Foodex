<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%int cnt=0;%>

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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,1,0" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@3.6.12/dist/css/splide.min.css">
    <title>Restaurant Dashboard | Foodex</title>
    <link href="<c:url value="/resources/css/admin.css" />" rel="stylesheet">
</head>
<body>
<div class="modal fade" id="staticBackdrop" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Add an Item</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="itemform" method="post" style="font-family: 'Poppins', sans-serif;" id="form" enctype="multipart/form-data">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col">
                                <div class="details-col col">
                                <br><input type="text" id="item-name" class="form-control form-input" placeholder="Item Name" name="a"/><br>
                                <input type="text" id="item-price" class="form-control form-input" placeholder="Price" name="b"/><br>
                                <input type="text" id="rating" class="form-control form-input" placeholder="Existing Rating" name="r"/><br>
                                <input id="res-id" value="<%=session.getAttribute("res_id")%>" class="form-control form-input" name="c" readonly="readonly"><br>
                                <input type="text" id="item-id" class="form-control form-input" placeholder="Item Id" name="d"/><br>
                                <input type="text" id="desc" class="form-control form-input" placeholder="Item Description" name="e"/>
                                <br>
                                <input id="images" type="file" style="margin-left: 40px; padding: 10px;" accept="image/png, image/jpeg" name="f" required/><br>
                                <input class="form-control form-input submit-btn" type="submit" name="submit-button" id="submit-btn" value="   Add Item   "/><br>
                            </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="header-bg-dark.jsp" %>

<div class="container">
    <%
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8", "root", "root");

//            PreparedStatement stmt = con.prepareStatement("SELECT COUNT(*) FROM orders where res_id=?");
//            stmt.setLong(1, (Long) session.getAttribute("res_id"));
//            ResultSet rs1 = stmt.executeQuery();

            PreparedStatement stmt1 = con.prepareStatement("SELECT * FROM restaurants where res_id=?");
            stmt1.setLong(1, Long.parseLong((String) session.getAttribute("res_id")));
            ResultSet rs2 = stmt1.executeQuery();

//            PreparedStatement stmt2 = con.prepareStatement("SELECT COUNT(*) FROM reports where res_id=?");
//            stmt2.setLong(1, (Long) session.getAttribute("res_id"));
//            ResultSet rs3 = stmt2.executeQuery();

    %>
    <br><br>
    <div class="row">
        <div class="col">
            <div class="stat">
                <h2 style="padding: 100px 0 100px 30px; font-weight: 600; font-size: 3em;"><br>Orders</h2>
            </div>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col">
            <div class="stat">
                <h2 style="padding: 100px 0 100px 30px; font-weight: 600; font-size: 3em;">0<br>Reports</h2>
            </div>
        </div>

        <div class="col">
            <div class="stat">
                <%
                    if(rs2.next()) {
                        if(rs2.getFloat("rating") >= 4 && rs2.getFloat("rating") <= 5) {

                %>
                <br><br><br><h6 style="background-color: #3EC70B; color: white; display: flex; justify-content: center; align-items: center; width: 20%; font-weight: 600; font-size: 2.4em; padding: 20px; margin-left: 30px">
                    <%= rs2.getString("rating")%><span class="material-symbols-outlined">star</span>
                </h6>
                <%
                    } else if(rs2.getFloat("rating") >= 3 && rs2.getFloat("rating") < 4) {

                %>
                    <br><br><br><h6 style="background-color: #f58305; color: white; display: flex; justify-content: center; align-items: center; width: 20%; font-weight: 600; font-size: 2.4em; padding: 20px; margin-left: 30px">
                    <%= rs2.getString("rating")%><span class="material-symbols-outlined">star</span>
                </h6>
                <%
                    } else if(rs2.getFloat("rating") >= 4 && rs2.getFloat("rating") <= 5) {

                %>
                    <br><br><br><h6 style="background-color: #f50202; color: white; display: flex; justify-content: center; align-items: center; width: 20%; font-weight: 600; font-size: 2.4em; padding: 20px; margin-left: 30px">
                    <%= rs2.getString("rating")%><span class="material-symbols-outlined">star</span>
                </h6>
                
                <%
                    }
                %>

                <h2 style="padding-bottom: 100px; padding-left: 30px; font-weight: 600; font-size: 3em;">Rating</h2>
            </div>
        </div>
    </div>
</div>
<%
    }} catch (Exception e){
        System.out.println(e);
    }
%>
<div class="container">
    <br><br><h3 style="font-weight: 600; font-size: 2em; ">Manage your Restaurant</h3>
    <hr><br><br>
    <div class="row">
        <div class="col c1">
            <button class="filter-icon control-item" data-bs-toggle="modal" data-bs-target="#staticBackdrop" type="button">Add an Item</button>
        </div>
        <div class="col">
<!--            <p>-->
                <% String myData = request.getParameter("res_id"); %>
                <a href="addedit_items" class="text-reset">
                    <button class="control-item" type="submit">View Items</button>
                </a>
<!--            </p>-->
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col c1">
            <button class="control-item">Manage Orders</button>
        </div>
        <div class="col">
            <button class="control-item">View Reports</button>
        </div>
    </div>

</div>

<div class="container">
    <div class="row">
        <div class="col" style="display: flex; justify-content: center; align-content: center">
            <div class="main-details-div">
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script>
    const inputField = document.querySelector("#item-id");

    inputField.addEventListener("input", function(event) {
        const value = event.target.value;
        if (!/^\d*$/.test(value)) {
            event.target.value = value.replace(/[^0-9]/g, "");
        }
    });

    const inputField1 = document.querySelector("#item-price");

    inputField1.addEventListener("input", function(event) {
        const value = event.target.value;
        if (!/^\d*$/.test(value)) {
            event.target.value = value.replace(/[^0-9]/g, "");
        }
    });

    const form = document.getElementById("form");
    form.addEventListener("submit", function(event) {
        const a = document.getElementById("item-name");
        const b = document.getElementById("item-price");
        const c = document.getElementById("res-id");
        const d = document.getElementById("item-id");
        const e = document.getElementById("desc");

        if (!a.value || !b.value || !c.value || !d.value || !e.value || !f.value || !g.value) {
            alert("All fields are required.");
            event.preventDefault();
        }
    });
</script>
</body>
</html>
