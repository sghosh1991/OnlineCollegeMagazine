<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>sexy</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript">

	function click_test(x,y){
		alert("x: "+x+"  y: "+y);
	
	}
</script>
</head>
<body>
<%
String param=(String)request.getParameter("category");
out.print("PARAMETER IS: "+param);
 %>


</body>
</html>