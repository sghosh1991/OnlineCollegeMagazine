<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Welcome</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<p><%
if(request.getAttribute("loggedIn").equals("YES"))
out.println("<form action=\"Login.jsp\"><input type=\"submit\" value=\"Logout\"></form>");
%>
Hi!
<%=request.getAttribute("name")
 %>
</p>

</body>
</html>