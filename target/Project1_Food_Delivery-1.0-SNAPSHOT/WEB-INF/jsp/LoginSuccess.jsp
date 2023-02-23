<%-- 
    Document   : LoginSuccess
    Created on : 22-Jan-2023, 10:40:29 pm
    Author     : NEERAJ BELSARE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Login Success</title>
</head>
<body>
<%
  String name=(String)request.getParameter("name");
  String email=(String)request.getParameter("email");
%>

<%=name %>

<%=email %>
<h2>Welcome,<%=m%></h2>
<b>Your Email ID is: <%=n%></b>
</body>
</html>
