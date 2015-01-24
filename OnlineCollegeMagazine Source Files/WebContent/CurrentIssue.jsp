<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*"%>
<html>
<head>
<title>CurrentIssue</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="images/homepage_images/Currissue_style.css" />
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
try{
			Class.forName("com.ibm.db2.jcc.DB2Driver");
			Connection con=DriverManager.getConnection("jdbc:db2://localhost:50000/MAGDB","sinergia","iem");

			String articleName,filePath,picturePath,snippet,authorName;
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

    <p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

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

    <li id="nav"><a href="CurrentIssue.jsp">Articles</a></li>

    <li id="nav"><a href="EditorWord.jsp">Editor</a></li>

</ul>

  </div>
<div id="articles">
<% 
  String query5="SELECT NAME FROM \"santosh\".ISSUES ORDER BY DATE DESC FETCH FIRST 1 ROWS ONLY";
  ResultSet rs5=null;
  PreparedStatement ps5=con.prepareStatement(query5,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
rs5=ps5.executeQuery();
  try{
  String issueName=null;
  while(rs5.next()){
  	issueName=rs5.getString("NAME");
  	}
  String query6="SELECT * FROM \"santosh\".VALIDATED_ARTICLES VA WHERE VA.ISSUE_NAME='"+issueName+"' ORDER BY VA.VALIDATION_DATE";
  ResultSet rs6=null;
  PreparedStatement ps6=con.prepareStatement(query6,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
rs6=ps6.executeQuery();
  if(rs6.next()){
  	do{
  		 articleName=rs6.getString("NAME");
  		 System.out.println(articleName);
  		filePath=rs6.getString("FILE_PATH");
        issueName=rs6.getString("ISSUE_NAME");
        int view_count=rs6.getInt("VIEW_COUNT");
        int pageno=rs6.getInt("PAGENO");
        String vid=rs6.getString("VID");
        String url="ArticleViewManagerServlet?issue_name="+issueName+"&article_name="+articleName+"&view_count="+view_count+"&pageno="+pageno+"&vid="+vid;
   %>
   <p align="center">
   <a href="<%=url %>"><%=articleName%></a></p>
   <%
   }while(rs6.next());
   }
   }catch(Exception e){
   }
   }catch(Exception e){
   }
    %>

</div>
</div>
</div>

</body>
</html>