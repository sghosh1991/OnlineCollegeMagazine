<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Update Profile</title>
	<link rel="stylesheet" type="text/css" href="images/homepage_images/updateprofile_style.css" />
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
<script type="text/javascript" src="Javascript/UpdateProf.js"></script>	
</head>

<body>
<%

response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server

response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance

response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"

response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility

%>

	
	<div id="inner_bg">
  	<div id="top_menu">  
  	<br />
  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	<%

    String name=null;

    String loggedIn=null;

    try{

    name=(String)session.getAttribute("name");

    loggedIn=(String)request.getAttribute("loggedIn");

    }catch(Exception e){

    e.printStackTrace();

    }

    if(name==null && loggedIn==null){

    %>

  <a href="Login.jsp"> Login</a>

   <%

    }

    else{

    %>

 <a href="Logout">Logout</a>

 <%} %>
 <%if(name==null){ %>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

 <a href="Reg_final.jsp">Register</a>
 <%} %>

 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  	<a href="http://iem.edu.in/engineering/home_iem_eng.php" target="_blank">Iem.edu.in</a>
  	
  	<div>
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
<%

RequestDispatcher view=null;

session=request.getSession();

/*

if(session==null){

	System.out.println("I AM IN USERPROFILE JSP AND THE SESSION IS NULL");

	request.setAttribute("Error", "Sorry your session has expired. please login again");

	view= request.getRequestDispatcher("Login.jsp");

	}*/


name=(String)session.getAttribute("name");


if (name==null)

	{

	request.setAttribute("Error", "Sorry your session has expired. please login again");

	view= request.getRequestDispatcher("Login.jsp");

	view.forward(request,response);

	}

else{

	

	name =(String)session.getAttribute("name");

	}
	String type=(String)session.getAttribute("type");

%>




<div id="updateprofile">


<form action="UpdateProfileServlet"  method="post" name="login" enctype="multipart/form-data">
<table width="500" height="139" border="0" >
<%if(type.equals("collegemember")){ %>
  <tr>
    <td><label for="picture">CHANGE PICTURE</label></td>
    <td><input type="file" name="picture" id="picture"></td>
  </tr>
  <%} %>
  <tr>
    <td><label for="oldpass">OLD PASSWORD: </label></td>
    <td><input type="password" name="oldpass" id="user" size="20"></td>
  </tr>
  
  <br/>
  <tr>
    <td><label for="newpass">NEW PASSWORD:</label></td>
    <td><input type="password" name="newpass" id="newpass" size="20" ></td>
  </tr>
  <tr>
    <td><label for="cnewpass">CONFIRM PASSWORD:</label></td>
    <td><input type="password" name="cnewpass" id="cnewpass" size="20" ></td>
  </tr>
</table>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;
<%if(type.equals("collegemember")){ %>
<input type="image" name="submit" class="button" src="images/homepage_images/submitbutton.png" onClick="return updateValidate()">
<%}
else{ %>
<input type="image" name="submit" class="button" src="images/homepage_images/submitbutton.png" onClick="return updateValidator()">
<%} %>
</form>
<%String match=null,invalid=null;
match=(String)request.getAttribute("match");
invalid=(String)request.getAttribute("invalid");
if(match!=null){
 %>
 <p>Password Fields do not match.
 </p>
 <%}else if(invalid!=null){ %>
 <p>Old Password entered is not valid.</p>
 <%} %>
</div>
</div>
</div>
</body>
</html>