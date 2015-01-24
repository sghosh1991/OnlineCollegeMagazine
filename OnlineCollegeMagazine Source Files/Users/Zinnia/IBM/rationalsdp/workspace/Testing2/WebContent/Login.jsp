<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<form action="LoginManager" method="post">
<p><input type="text" name="email" size="20"
	style="position: absolute; left: 100px; top: 50px"><input type="submit"
	value="gO!" style="position: absolute; left: 350px; top: 250px"></p>
<br>
<br>
<br>
Email <br>
<input type="password" name="password" size="20"
	style="position: absolute; left: 100px; top: 100px">
<br>Password<br>
<select name="type" style="position: absolute; left: 100px; top: 150px">
	<option value="Student">student</option>
	<option value="Faculty">faculty</option>
</select>
<br>Type
</form>
<form action="SearchManager">
<input type="text" name="searchString" size="20"><br/>
<input type="radio" name="type" value="author" checked>Author
<input type="radio" name="type" value="articlename">Name
<input type="radio" name="type" value="keyword">Keyword
<br>
<input type="submit" name="Search" value="Search">
</form>
<p><br>
</p>
<p><br>
</p>
</body>
</html>