<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page import="java.sql.* ,javax.sql.*" 
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>SearchPage</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<form action="SearchManager">
<input type="text" name="searchString" size="20"><br/>
<input type="radio" name="type" value="author" checked>Author
<input type="radio" name="type" value="articlename">Name
<input type="radio" name="type" value="keyword">Keyword
<br>
<input type="submit" name="Search" value="Search">
</form>

<hr>
<hr>

<%
ResultSet rs=(ResultSet)request.getAttribute("resultset");
if(!rs.next())
out.println("NO RESULTS FOUND");
else{
do{
out.println(rs.getString("FILE_PATH"));
}while(rs.next());
}


%></body>
</html>