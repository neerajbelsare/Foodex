<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Create An Account | Foodex</title>
    <link href="<c:url value="/resources/css/register.css" />" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <style>
        #carousel-div{
            background-image: url("<c:url value="/resources/img/register-carousel1.jpg" />");
            background-repeat: no-repeat;
            background-size: cover;
            height: 100vh;
            z-index: 1;
            transition: 0.1s all;
        }
    </style>
</head>
<body onload="changebg()">
    <div class="container-fluid" id="carousel-div">
        <div class="row">
            <div class="col register-div logo-div">
                <img src="<c:url value="/resources/img/logo-exp.png" />" alt="Foodex Logo" width="500px" />
            </div>
            <div class="col register-div">
                <form action="registerform" method="post" class="register-form">
                    <h3 class="form-heading">Sign Up</h3><br>
                    <p class="form-subhead">Already a Foodex User? <a href="login" class="link">Login to your Account</a></p><br>
                    <input type="text" name = "a" placeholder="Username" id = "input-register1" onblur="usernameExists()"/>
                    <p id="error-msg1" class="error-msg">Unknown Error</p>
                    <input type="text" name = "b" placeholder="Full Name" id = "input-register2" />
                    <p id="error-msg2" class="error-msg">Unknown Error</p>
                    <input type="text" name = "c" placeholder="Phone" id = "input-register3" />
                    <p id="error-msg3" class="error-msg">Unknown Error</p>
                    <input type="email" name = "d" placeholder="Email" id = "input-register4" />
                    <p id="error-msg4" class="error-msg">Unknown Error</p>
                    <input type="text" name = "e" placeholder="Address" id = "input-register5" />
                    <p id="error-msg5" class="error-msg">Unknown Error</p>
                    <input type="password" name = "f" placeholder="Password" id = "input-register6" />
                    <p id="error-msg6" class="error-msg">Unknown Error</p>
                    <button class="input-register1 button-continue" id="continue-button" type="button" onclick="onContClick()">Continue</button><br>
                    <input type="submit" value="Register" class="register-submit" id="register-submit" onclick="onRegClick()" disabled /><br>
                    <p style="color: #bbbbbb; width: 100%; text-align: center; margin-top: 20px; font-size: 1.1em;">Or</p>
                    <button type="button"></button>
                    285255148443-fs5dnhuab11qobgk1771p0ook03d2be0.apps.googleusercontent.com
                    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
                </form>
            </div>
        </div>
    </div>
<script>
    function onContClick(){
        if (document.getElementById('input-register1').value.length === 0)
        {
            document.getElementById('input-register1').style.borderBottom = '2px solid red'
            document.getElementById('error-msg1').style.display = 'block'
            document.getElementById('error-msg1').innerHTML = 'This is a required field!'
        }

        if (document.getElementById('input-register2').value.length === 0)
        {
            document.getElementById('input-register2').style.borderBottom = '2px solid red'
            document.getElementById('error-msg2').style.display = 'block'
            document.getElementById('error-msg2').innerHTML = 'This is a required field!'
        }

        if (document.getElementById('input-register3').value.length === 0)
        {
            document.getElementById('input-register3').style.borderBottom = '2px solid red'
            document.getElementById('error-msg3').style.display = 'block'
            document.getElementById('error-msg3').innerHTML = 'This is a required field!'
        }

        if(document.getElementById('input-register1').value.length === 0 ||
            document.getElementById('input-register2').value.length === 0 ||
            document.getElementById('input-register3').value.length === 0
        )
        {
            document.getElementById("register-submit").style.backgroundColor = '#949494'
            document.getElementById("register-submit").disabled = true
        }

        else {
            document.getElementById("input-register1").style.display = 'none'
            document.getElementById("input-register4").style.display = 'block'

            document.getElementById("input-register2").style.display = 'none'
            document.getElementById("input-register5").style.display = 'block'

            document.getElementById("input-register3").style.display = 'none'
            document.getElementById("input-register6").style.display = 'block'

            document.getElementById("register-submit").style.backgroundColor = '#1e53ff'
            document.getElementById("register-submit").disabled = false

            document.getElementById("continue-button").style.display = 'none'

            document.getElementById('error-msg1').style.display = 'none'
            document.getElementById('error-msg2').style.display = 'none'
            document.getElementById('error-msg3').style.display = 'none'
        }
    }

    function onRegClick()
    {
        if (document.getElementById('input-register4').value.length === 0)
        {
            document.getElementById('input-register4').style.borderBottom = '2px solid red'
            document.getElementById('error-msg4').style.display = 'none'
        }

        if (document.getElementById('input-register5').value.length === 0)
        {
            document.getElementById('input-register5').style.borderBottom = '2px solid red'
            document.getElementById('error-msg5').style.display = 'none'
        }

        if (document.getElementById('input-register6').value.length === 0)
        {
            document.getElementById('input-register6').style.borderBottom = '2px solid red'
            document.getElementById('error-msg6').style.display = 'none'
        }

        if(document.getElementById('input-register4').value.length === 0 ||
            document.getElementById('input-register5').value.length === 0 ||
            document.getElementById('input-register6').value.length === 0
        )
        {
            document.getElementById("register-submit").style.backgroundColor = ''
        }

        else {
            document.getElementById("register-submit").style.backgroundColor = '#1e53ff'
            document.getElementById("register-submit").disabled = false

            document.getElementById('error-msg4').style.display = 'none'
            document.getElementById('error-msg5').style.display = 'none'
            document.getElementById('error-msg6').style.display = 'none'
        }
    }

    // function changebg(){
    //     let url =
    //     document.getElementById("carousel-div").style.backgroundImage = ""
    //     setTimeout(function (){
    //         document.getElementById("carousel-div").style.backgroundImage =
    //     }, 3000)
    // }
</script>
</body>
</html>
