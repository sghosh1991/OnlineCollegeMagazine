<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>SuccessfullRegistration</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<%
String name=(String)request.getAttribute("regName");
 %>
<h1 style="color: blue; font-size: 24pt">WELCOME to FOOTPRINTS FAMILY <%=name %>
<br><br><br><br>
<p align="center"
	style="color: red; background-color: #f3eb49; font-size: 36in"><i
	style="color: red; background-color: #f3eb49; font-size: 12pt"><big>You
have beeen successfully registered with us..An email has been sent to ur
mail id containing the activation link.Activate your account before
loggin in</big></i></p></body>
</html>