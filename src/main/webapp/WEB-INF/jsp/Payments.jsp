<%-- 
    Document   : Payments
    Created on : Feb 16, 2023, 9:18:13 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>
<% String a = (String) request.getAttribute("AMT");
%>
        <head>
            <title>Checkout | Foodex</title>
            
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
            rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
            crossorigin="anonymous">
        </head>
        <body>
        <%@ include file="header-bg-dark.jsp"%>
            <br><br><br>
        <div style="display: flex; justify-content: center; align-items: center">
            <form id="paymentForm" style="width: 60%;">
                <div class="form-group">
                  <label for="amount">Total Amount: Rs. </label>
                  <input type="number" value="<%= a%>" class="form-control" id="amount" name="amount" readonly required>
                </div>
                <button type="submit" class="btn btn-primary btn-lg btn-block">Pay Now</button>
            </form>
        </div>

        <%@ include file="footer.jsp"%>
        </body>
</html>
<script>

        $('#paymentForm').submit(function(event) {

          event.preventDefault();


          var email = $('#email').val();
          var amount = $('#amount').val();


          var options = 
                  {
            "key": "rzp_test_hDo6OeroulZ0HM", 
            "amount": amount,
            "currency": "INR",
            "name": "FOODEX",
            "description": "Payment For Food",
            "prefill": {
              "email": email
            },
            "handler": function(response)
            {
              alert("Payment successful! Payment ID: " + response.razorpay_payment_id);

            }
          };

          var rzp1 = new Razorpay(options);
          rzp1.open();
        });
        
</script>

</html>