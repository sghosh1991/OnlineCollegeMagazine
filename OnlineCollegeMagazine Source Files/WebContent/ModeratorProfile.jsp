<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,java.io.File"%>
<html>
<head>
<title>Moderator Profile</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="images/homepage_images/moderatorpage_style.css" />
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
<div id="profile">
<%
RequestDispatcher view=null;
int count=0;
ResultSet rs=null;
session=request.getSession();
/*if(session==null)
 {
	request.setAttribute("Error", "Sorry your session has expired. please login again");
	view= request.getRequestDispatcher("Login.jsp");
	view.forward(request,response);
 }*/
name=(String)session.getAttribute("name");
if (name==null)
	{
	request.setAttribute("Error", "Sorry your session has expired. please login again");
	view= request.getRequestDispatcher("Login.jsp");
	view.forward(request,response);
	}
else
	{
	rs=(ResultSet)request.getAttribute("pending_articles");
	if(!rs.last())
	count=0;
	else
		{
		count=rs.getRow();
		rs.beforeFirst();
		System.out.println("NUMBER OF ROWS : "+count);
		
		}
	}
	String category=(String)request.getAttribute("category");
 %>
<p>NAME : <%=name %></p>
<p>CATEGORY: <%=category%></p>
<%String update=(String)request.getAttribute("update");
if(update!=null){ %>
<br>Profile Successfully Updated!<br>
<%} %>
<a href="UpdateProfile.jsp">Update profile</a>
<hr>
<p><br>
<b>NO. OF PENDING ARTICLES:&nbsp;<%=count%></b></p>

<p><br><b>LIST OF PENDING ARTICLES</b> </p>
<%
String validate=null;
String reject=null;
validate=(String)request.getAttribute("validate");
reject=(String)request.getAttribute("reject");
if(validate!=null){
 %>
 <small>The article has been successfully validated!</small><br><br>
 <%}
 if(reject!=null){
  %>
  <small>The article has been rejected.</small><br><br>
  <%} 
String pdfPath=null;
String articleName=null;
String rid=null;
String picturePath=null;
String snippet=null;
String pid=null;
int n=1;
try{
if(rs.next()){%>
<% 
do{
pid=rs.getString("PID");
pdfPath=rs.getString("FILE_PATH");
articleName=rs.getString("NAME");
rid=rs.getString("RID");
category=rs.getString("CATEGORY");
picturePath=rs.getString("PICTURE_PATH");
snippet=rs.getString("SNIPPET");%>

<%=n %>.&nbsp;<%=articleName %>
<a href="<%=pdfPath%>" target="_blank">View </a>
<br>
<form method="post" action="ArticleValidateServlet">
<input type="hidden" name="pid" value="<%=pid %>">
<input type="hidden" name="pdfPath" value="<%=pdfPath %>">
<input type="hidden" name="articleName" value="<%=articleName %>">
<input type="hidden" name="rid" value="<%=rid %>">
<input type="hidden" name="picturePath" value="<%=picturePath %>">
<input type="hidden" name="category" value="<%=category %>">
<input type="hidden" name="snippet" value="<%=snippet %>">
Choose as Editor's Pick:<br>
<input type="radio" name="chosen" value="Yes" checked >Yes<br>
<input type="radio" name="chosen" value="No">No<br>
<input type="submit" value="Validate">
</form>
<form action="ArticleRejectServlet" method="post">
<input type="hidden" name="rid" value="<%=rid %>">
<input type="hidden" name="pid" value="<%=pid %>">
<input type="hidden" name="articleName" value="<%=articleName %>">
<input type="hidden" name="category" value="<%=category %>">
<input type="submit" value="Reject">
</form>
<%	n++;}while(rs.next());
}
else{
%>
No articles currently pending under this category.
<% 
}
}catch(Exception e){
 e.printStackTrace();
}
%>
</div>
</div>
</div>
</body>
</html>