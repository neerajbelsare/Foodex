<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
          crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <link href="<c:url value="/resources/css/settings.css" />" rel="stylesheet">
    <title>Settings | Foodex</title>
</head>
<body>
<%@ include file="header-bg-dark.jsp"%>
<br><br><br>
<div class="container-sm">
    <div class="row">
        <h4>Settings</h4>
        <hr><br><br>
    </div>
    <div class="row settings-row">
        <div class="col-sm" style="padding: 20px;">
            Two Factor Authentication
            <br><p class="desc">Enable two-factor authentication with Google Authenticator to improve your Account's security</p>
        </div>
        <div class="col-sm" style="display: flex; justify-content: right; align-items: center; margin-right: 30px">
            <div class="form-check form-switch">
                <%
                    try {
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8", "root", "root");
                        PreparedStatement stmt = con.prepareStatement("select * from users where username = ?");
                        stmt.setString(1, (String) session.getAttribute("userName"));

                        ResultSet rs = stmt.executeQuery();

                        while (rs.next()){
                        if(rs.getString("twofa").equals("NO")) {
                %>
                <input class="form-check-input" type="checkbox" role="switch" id="twofa-checkbox" />
                <%
                        } else  {
                %>
                <input class="form-check-input" type="checkbox" role="switch" id="twofa-checkbox" checked />
                <%
                        }
                        }} catch (Exception e) {
                        System.out.println(e);
                    }
                %>
            </div>
        </div>
    </div>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>
