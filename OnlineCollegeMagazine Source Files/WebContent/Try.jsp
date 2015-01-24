<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>dropdownlist_test</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
function submitform()
{
  document.myform.submit();
}
</script>
</head>
<body>
<!--  <%
//int i=21;
//out.println("<button id=\""+i+"\">Click me!</button>"); %>
<select name="department" id="department" size="20">
	<option value="CSE" selected>Computer Science and Engineering</option>
	<option value="ECE">Electronics and Communications Engineering</option>
	<option value="IT">Information Technology</option>
</select>-->
<form name="myform" action="TryServlet">
<textarea rows="4" cols="30" name="para"></textarea>
<a href="javascript: submitform()">Submit</a>
</form>
</body>
</html>