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
  String m=(String)  request.getAttribute("NA");
  String n=(String)  request.getAttribute("EM");
%>
<h2>Welcome,<%=m%></h2>
<b>Your Email ID is: <%=n%></b>
</body>
</html>
