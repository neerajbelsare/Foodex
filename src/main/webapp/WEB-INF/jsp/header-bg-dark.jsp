<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" %>
<link href="<c:url value="/resources/css/header-dark.css" />" rel="stylesheet">

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
        <%
          boolean flag = false;
          Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
          if (loggedIn == null || !loggedIn) {
        %>

          <li class="nav-item">
            <a class="nav-link nav-reg" href="login">Log In</a>
          </li>
          <li class="nav-item">
            <a class="nav-link nav-reg" href="register">Sign Up</a>
          </li>

        <%
          } else {
            try {
              String usnm = (String) session.getAttribute("userName");
              String pwd = (String) session.getAttribute("password");
              String prefix_u = "admin";
              String prefix_p = "admin@123";

              Class.forName("com.mysql.cj.jdbc.Driver");

              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
              PreparedStatement stmt = con.prepareStatement("select * from restaurants where username=?");
              stmt.setString(1, usnm);

              PreparedStatement stmt2 = con.prepareStatement("select * from users where username=? and password=?");
              stmt2.setString(1, usnm);
              stmt2.setString(2, pwd);

              ResultSet rs = stmt.executeQuery();
              ResultSet rs1 = stmt2.executeQuery();
        %>

          <li class="nav-item">
            <ul>
              <a href="#" class="display-picture"><img src="<c:url value="/resources/img/user-icon-default-white.svg" />" alt="User Icon"></a>
            </ul>
            <div class="card hidden">
              <ul>
                <%
                  if(usnm.startsWith(prefix_u) && pwd.startsWith(prefix_p)) {
                    flag = true;
                %>
                <li><a href="admin" target="_blank">Dashboard</a></li>
                <li><a href="account">Account</a></li>
                <li><a href="settings">Settings</a></li>
                <li><a href="#">Log Out</a></li>
                <%
                  }
                  if(!flag){
                    while(rs1.next()){
                      if(rs1.getString("username").equals(usnm)){
                        flag = true;

                %>
                <li><a href="dashboard" target="_blank">Dashboard</a></li>
                <li><a href="account">Account</a></li>
                <li><a href="settings">Settings</a></li>
                <li><a href="#">Log Out</a></li>
                <%
                      }}}

                  if(!flag){
                    while(rs1.next()){
                      if(rs1.getString("username").equals(usnm) && rs1.getString("password").equals(pwd)) {
                        flag = true;
                %>

                <li><a href="account">Account</a></li>
                <li><a href="settings">Settings</a></li>
                <li><a href="#">Log Out</a></li>
                <%
                      }}}
                %>
                <%
                    }catch (Exception k) {
                      System.out.println(k);
                    }
                  }
                %>
        </ul>
    </div>
  </nav>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script>
  let card = document.querySelector(".card");
  let displayPicture = document.querySelector(".display-picture");

  displayPicture.addEventListener("click", function() {
    card.classList.toggle("hidden")})
</script>