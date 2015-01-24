<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login @ Footprints</title>
	<link rel="stylesheet" type="text/css" href="images/homepage_images/loginpage_style.css" />
    <link type="text/css" href="images/homepage_images/css/start/jquery-ui-1.8.18.custom.css" rel="Stylesheet" />
    <style type="text/css">
<!--
	body{
	font-family: MS Serif, New York, serif;
	font-size: 20px;
	
}
-->
	</style>
	<script type="text/javascript" src="Javascript/homepage_javascript/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="Javascript/homepage_javascript/js/jquery-ui-1.8.18.custom.min.js"></script>
<script type="text/javascript" src="Javascript/userProfile.js"></script>
<script type="text/javascript" >

$(function(){
$("#forgotPassword").css("cursor", "pointer");
$("#forgotPassword").click(function(){
	var waiting='<img src="images/RegistrationPage/loading.gif" /> Please Wait...';
	var email=$("#email").val();
	if(email==''){
		alert('Please enter the email field');
	}
	
	else{
		$("#forgotPass").html(waiting);
		$.get("ForgotPasswordMailServlet",{email:email},function(){
		var content="<b><small>A mail has been sent to your registered email ID for password recovery.</small></b>";
			$("#forgotPass").html(content);
		});
	
	}

});

});
</script>
	
</head>

<body>


	
	<div id="inner_bg">
  	<div id="top_menu">  
  	<br />
  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	<a href="http://iem.edu.in/engineering/home_iem_eng.php" target="_blank">Iem.edu.in</a>
  	
  	<div style="color: #ffffff;">
  	<form id="searchform" name="searchform" method="get" action="SearchManager" >
  	<input type="radio" name="type" value="author" checked>Author
  	<input type="radio" name="type" value="articlename">Name
  	<input type="radio" name="type" value="keyword">Keyword
  	<input type="text" name="searchString" id="searchfield" size="20" />
  	<input name="Search" type="image" src="images/homepage_images/searchbutton.png" class="button" />
  	</form>
  	</div>
</div>

<div id="logowrapper">
	<div id="logo">
    <p></p><p></p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <img src="images/homepage_images/logo.png" width="500" height="160" alt="logo" /></div>

</div>

<p>

<div id="content">

 <div id="navmenu" class="center">
  <ul id="navli">
	<li id="nav"><a href="HomePage.jsp">Home</a></li>
	<li id="nav"><a href="DisplayProfile">Profile</a></li>
	<li id="nav"><a href="CategoryDisplayServlet">Category</a></li>
	<li id="nav"><a href="AuthorDisplayServlet">Authors</a></li>
    <li id="nav"><a href="AllArticleServlet">Articles</a></li>
    <li id="nav"><a href="EditorWord.jsp">Editor</a></li>
  </ul>
</div>


<div  align="center" id="Option" style="position: absolute; z-index: 1; top: 376px; left: 480px;">
	<%
	String activated=(String)request.getAttribute("activated");
	if(activated!=null){
	 %>
	 <b style="font-size: 20pt;">WELCOME to our FOOTPRINTS family! </b><br>
	 <i>You have successfully activated your account. Please Login to continue.</i> 
	 <%} %>
</div>


<div id="login">
<%
try{
String error=(String)request.getAttribute("Error");
String displayInvalid=(String)request.getAttribute("displayInvalid");
if(error!=null){
%>
<small><%=error %></small>
<%}
if(displayInvalid!=null){ %>
<small>Invalid Login</small>
<%}
}catch(Exception e){
e.printStackTrace();
}
 %>

<form action="LoginManager"  method="post" name="login">

<label for="email">EMAIL: </label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" name="email" id="email" size="20">
<br><br>
<label for="password">PASSWORD:</label>
&nbsp;&nbsp;&nbsp;
<input type="password" name="password" id="password" size="20" >
<br><br>
<label for="type">TYPE: </label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<select name="type" id="type">
	<option value="collegemember">College Member</option>
	<option value="moderator">Moderator</option>
	<option value="admin">Administrator</option>
</select>

<br><br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="image" name="submit" class="button" src="images/homepage_images/loginbutton.png" value="Login" onClick="this.form.submit()">
</form>

<p id="forgotPass" style="font-size=11px;">
<a id="forgotPassword">Forgot password?</a>
</p>
<p style="font-size=11px;">
Not registered?
<a href="Reg_final.jsp" id="registerlink">Register now</a>
</p>
</div>
</div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
</body>
</html>