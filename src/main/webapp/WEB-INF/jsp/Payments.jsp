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
        </head>
        <body>
            <form id="paymentForm">
                <div class="form-group">
                  <label for="amount">Total Amount:</label>
                  <input type="number" value="<%= a%>" class="form-control" id="amount" name="amount" readonly required>
                </div>
                <button type="submit" class="btn btn-primary btn-lg btn-block">Pay Now</button>
            </form>
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