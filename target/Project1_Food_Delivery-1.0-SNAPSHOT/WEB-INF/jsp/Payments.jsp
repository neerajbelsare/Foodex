<%-- 
    Document   : Payments
    Created on : Feb 16, 2023, 9:18:13 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% int cnt1=0;%>

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
            
        <div class="container">
            <div class="row">
        <div class="col">
            <%
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
                    Statement state = con.createStatement();

                    PreparedStatement stmt = con.prepareStatement("select sum(quantity) from cart where username=?");
                    stmt.setString(1, (String) session.getAttribute("userName"));
                    ResultSet rst = stmt.executeQuery();
                    
                    while (rst.next()) {
                        cnt1 = rst.getInt(1);
                    }
                }
                catch (Exception k){
                    System.out.println(k.getMessage());
                }
            %>
            <h4 class="res-heading"><%=cnt1%> items in your cart</h4>
        </div>
    </div>
        <div class="row">
            <div class="col" style="display: flex; justify-content: center;align-items: center">
                <%
                    try {
                        long id=0;
                        int qty=0;
                        float prc=0;
                        float fprc=0;
                        String nm="";
                        
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
                        PreparedStatement stmt = con.prepareStatement("select * from cart where username=?");
                        stmt.setString(1, (String) session.getAttribute("userName"));

                        ResultSet rs = stmt.executeQuery();%>
                        <table class="table table-striped table-hover users-table">
                            <tr>
                                <th>Item name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Final Price</th>
                            </tr>
                        
                        <%
                        while (rs.next())
                        {
                            id=rs.getLong("item_id");
                            qty=rs.getInt("quantity");
                            
                            PreparedStatement stmt1 = con.prepareStatement("select * from items where item_id=?");
                            stmt1.setLong(1, id);
                        
                            ResultSet rst = stmt1.executeQuery();
                            if (rst.next())
                            {
                                prc=rst.getFloat("price");
                                nm=rst.getString("item_name");
                            }
                            fprc=prc*qty;
                            
                %>

                            <%
                            out.println("<tr>");
                            %>
                            <td><%= nm%></td>
                            <td><%= prc%></td>
                            <td><%= rs.getInt("quantity")%></td>
                            <td><%= fprc%></td>
                            <%
                            out.println("</tr>");
                        }%>
                        </table>

            <%rs.close();
                        stmt.close();
                        con.close();
                    } catch (SQLException e) {
                        out.println("SQL Error: " + e.getMessage());
                    } catch (ClassNotFoundException e) {
                        out.println("Class Not Found Error: " + e.getMessage());
                    }
                %>
            </div>
        </div>
        
        </div>
        <div style="display: flex; justify-content: center; align-items: center">
            <form id="paymentForm" style="width: 60%;">
                <div class="form-group">
                    <% String prce=a;
                    float num = Float.parseFloat(prce);
                    num/=100;%>
                    <h4><label for="amount">Total Amount to be paid: Rs. <%= num%></label></h4>
                  <input type="number" value="<%= a%>" class="form-control" id="amount" name="amount" readonly hidden required>
                </div><br>
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