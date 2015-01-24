<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Comment</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<form action="CommentSERVLET" method="post">
<%
String profane=null;
try{
profane=(String)request.getAttribute("profane");
if(profane.equals("true"))
out.println("BAD COMMENT");
}catch(Exception e){
e.printStackTrace();
}
%>
<textarea rows="8" cols="60" name="comment"></textarea>
<input type="submit" name="comment" value="POST">
</form>
</body>
</html>