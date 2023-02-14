<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="<c:url value="/resources/css/account.css" />" rel="stylesheet">
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
          crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <title>Account | Foodex</title>
</head>
<body>
<%@ include file="header-bg-dark.jsp"%>
<div class="container-xl px-4 mt-4">
    <% String p = (String) request.getAttribute("NM");
        String q = (String) request.getAttribute("PHN");
        String r = (String) request.getAttribute("USNM");
        String s = (String) request.getAttribute("EM");
        String t = (String) request.getAttribute("ADD");
        String m = (String) request.getAttribute("PWD");
    %>
    <div class="row" style="background: linear-gradient(to left top, #154efd, #5b87fe); color: white; border-radius: 10px">
        <div class="col" style="margin-bottom: 30px;">
            <br><br><h2 style="font-weight: 600; padding-left: 20px"><%= p%></h2>
            <p style="font-weight: 500;padding-left: 20px"><%= s%></p><br>
        </div>
        <div class="col" style="display: flex; justify-content: right; align-items: center; margin-right: 50px">
            <button type="button" id="edit-profile-btn"><span class="material-symbols-outlined">edit</span>Edit Profile</button>
        </div>
    </div><br>

    <nav class="nav nav-borders">
        <a class="nav-link active ms-0" href="https://www.bootdey.com/snippets/view/bs5-edit-profile-account-details" target="__blank">Profile</a>
        <a class="nav-link" href="https://www.bootdey.com/snippets/view/bs5-profile-billing-page" target="__blank">Payment Methods</a>
        <a class="nav-link" href="https://www.bootdey.com/snippets/view/bs5-profile-security-page" target="__blank">Security</a>
        <a class="nav-link" href="https://www.bootdey.com/snippets/view/bs5-edit-notifications-page"  target="__blank">Orders</a>
    </nav>
    <hr class="mt-0 mb-4">
    <form action="accountform" method="post" id="form">
    <div class="row">
        <div class="col-xl-4">
            <div class="card mb-4 mb-xl-0">
                <div class="card-header">Profile Picture</div>
                <div class="card-body text-center">
                    <img class="img-account-profile rounded-circle mb-2" src="<c:url value="/resources/img/user-icon-default.svg" />" alt="">
                    <br><br><input id="profile-image" type="file" accept="image/png, image/jpeg" value="Upload an Image" hidden />
                    <label for="profile-image" class="btn-primary">Upload an Image</label>
                    <br><br>
                </div>
            </div>
        </div>
        <div class="col-xl-8">
            <div class="card mb-4">
                <div class="card-header">Account Details</div>
                <div class="card-body">
                    <div class="mb-3">
                        <br><label class="small mb-1" for="inputUsername" style="margin-left: 20px;color: #6b6b6b;">Username</label><br>
                        <input class="form-input" id="inputUsername" name="inputUsername" type="text" value="<%= r%>" disabled>
                    </div>
                    <div class="mb-3">
                        <br><label class="small mb-1" for="inputName" style="margin-left: 20px;color: #6b6b6b;">Name</label><br>
                        <input class="form-input" id="inputName" name="inputName" type="text" value="<%= p%>" disabled>
                    </div>
                    <div class="mb-3">
                        <br><label class="small mb-1" for="inputPhone" style="margin-left: 20px;color: #6b6b6b;">Phone</label><br>
                        <input class="form-input" id="inputPhone" name="inputPhone" type="text" value="<%= q%>" maxlength="10" disabled>
                    </div>
                    <div class="mb-3">
                        <br><label class="small mb-1" for="inputEmail" style="margin-left: 20px;color: #6b6b6b;">Email</label><br>
                        <input class="form-input" id="inputEmail" name="inputEmail" type="text" value="<%= s%>" disabled>
                    </div>
                    <div class="mb-3">
                        <br><label class="small mb-1" for="inputAddress" style="margin-left: 20px;color: #6b6b6b;">Address</label><br>
                        <input class="form-input" id="inputAddress" name="inputAddress" type="text" value="<%= t%>" disabled>
                    </div>
                    <div class="mb-3">
                        <br><label class="small mb-1" for="inputPassword" style="margin-left: 20px;color: #6b6b6b;">Password</label><br>
                        <input class="form-input" id="inputPassword" type="password"  name="inputPassword" value="<%= m%>" readonly><br><a href="forgot" style="margin-left: 20px">Change Password</a>
                    </div><br>
                    <input class="btn-primary" type="submit" value="Save changes"><br><br>
                </div>
            </div>
        </div>
    </div>
    </form>
</div>
<%@ include file="footer.jsp"%>

<script>
    const inputField = document.querySelector("#inputPhone");

    inputField.addEventListener("input", function(event) {
        const value = event.target.value;
        if (!/^\d*$/.test(value)) {
            event.target.value = value.replace(/[^0-9]/g, "");
        }
    });

    const form = document.getElementById("form");
    form.addEventListener("submit", function(event) {
        const a = document.getElementById("inputUsername");
        const b = document.getElementById("inputName");
        const c = document.getElementById("inputPhone");
        const d = document.getElementById("inputEmail");
        const e = document.getElementById("inputPassword");

        if (!a.value || !b.value || !c.value || !d.value || !e.value) {
            alert("All fields are required.");
            event.preventDefault();
        }
    });

    document.getElementById("edit-profile-btn").addEventListener("click", function() {
        document.getElementById("inputUsername").removeAttribute("disabled");
        document.getElementById("inputName").removeAttribute("disabled");
        document.getElementById("inputEmail").removeAttribute("disabled");
        document.getElementById("inputAddress").removeAttribute("disabled");
        document.getElementById("inputPhone").removeAttribute("disabled");
    });
</script>
</body>
</html>
