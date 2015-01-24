<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Registration</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>

<form action="RegistrationManager" method="post">
Email:<input type="text" name="email" size="20">
<br>
<br>
First Name: <input type="text" name="fname" size="20">
<br>
<br>
Last Name: <input type="text" name="lname" size="20">
<br>
<br>
Department:
<input type="text" name="department" size="20">
<br>
<br>
Password: <input type="password" name="password" size="20">
<br>
<br>
Type: <select name="type">
	<option value="Faculty" selected>Faculty</option>
	<option value="Student">Student</option>	
</select>
<br>
<br>
Year: <input type="text" name="year" size="20">
<br>
<br>
<input type="submit" name="go" value="Go!!">
</form>
</body>
</html>