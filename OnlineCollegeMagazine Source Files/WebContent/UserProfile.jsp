<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@page

	language="java" contentType="text/html; charset=ISO-8859-1"

	pageEncoding="ISO-8859-1" import="java.sql.*" %>

<html>

<head>

<title>Profile Page</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="images/homepage_images/profilepage_style.css" />

<link type="text/css" href="images/homepage_images/css/start/jquery-ui-1.8.18.custom.css" rel="Stylesheet" />

<style type="text/css">

<!--

	body{

	font-family: MS Serif, New York, serif;

	font-size: 20px;

}
.charlimit {
	font-size: 9px;
}
.charlimit {
	font-size: 16px;
	font-style: italic;
}

-->

	</style>

<script type="text/javascript" src="Javascript/homepage_javascript/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="Javascript/homepage_javascript/js/jquery-ui-1.8.18.custom.min.js"></script>
<script type="text/javascript" src="Javascript/userProfile.js"></script>
<script type="text/javascript" src="Javascript/UserProf.js"></script>

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

  	

  	<div style="color:#fff;">

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



<div id="profile" >

<div>

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

String source=null;

if (name==null)

	{

	request.setAttribute("Error", "Sorry your session has expired. please login again");

	view= request.getRequestDispatcher("Login.jsp");

	view.forward(request,response);

	}

else{

	

	name =(String)session.getAttribute("name");

	source=(String)request.getAttribute("picture_path");

	System.out.println("PICTURE PATH IN JSP IS : "+ source);

	}

%>

<div id="profile_pic"><img src="<%=source%>" border="0" width="160" height="160">
<p align="center">
<%String update=null; 
update=(String)request.getAttribute("update");
if(update!=null){ 
%>
Profile successfully updated!<br>
<%}
 %>
 <a href="UpdateProfile.jsp" id="artlink">Update Profile</a>
 </p>
</div>

          

<div id="art_tab">

Name:<%=name%>

<br>
 <%ResultSet rs = (ResultSet)request.getAttribute("articles");
	ResultSet rs1=(ResultSet)request.getAttribute("categories");
	ResultSet rset=(ResultSet)request.getAttribute("pending");
	try{

	int n=1;
	if(rs.next()){%>

<table style="font-size: 20px;" width="591" border="0" cellpadding="3" cellspacing="1" bgcolor="#DDDDFF" summary="Article submitted by the user in last 30 days">

  <caption align="top">

    Articles submitted in the Last Month

  </caption>

  <tr align="center">

    <th scope="col"></th>

    <th scope="col">Article Name</th>

    <th scope="col">Category</th>
    
    <th scope="col">Status</th>

  </tr>
	<%
	do{
	String vid=null;
	vid=rs.getString("VID");
	String articleName=rs.getString("NAME");
	int pageno=rs.getInt("PAGENO");
    String issueName=rs.getString("ISSUE_NAME");
	String category=rs.getString("CATEGORY");
	String viewCount=rs.getString("VIEW_COUNT");
	System.out.println(viewCount);
	Double rating=rs.getDouble("RATE");
	String checked=rs.getString("CHECKED");
	System.out.println(rating);
	String url="ArticleViewManagerServlet?view_count="+viewCount+"&vid="+vid+"&article_name="+articleName+"&pageno="+pageno+"&issue_name="+issueName;
	%>
  <tr align="center">

    <th scope="row" height="10"><%=n %></th>

    <td height="10"><%if(checked.equals("Yes") && vid!=null && issueName!=null){ %><a href="<%=url %>" id=artlink><%=articleName%></a><%}else{ %><%=articleName %><%} %></td>

    <td height="10"><%=category %></td>
    
    <td height="10"><%if(checked.equals("Yes") && vid==null){ %>Rejected<%}else if(checked.equals("Yes") && vid!=null){ %>Accepted<%}else if(checked.equals("No")){ %>Pending<%} %></td>

	
  </tr>

  <%
  n++; }while(rs.next());
  }
	else{%>
		<p>You have not submitted any articles in the Last Month.</p>
	<%}
	}catch(Exception e){

	 e.printStackTrace();

	}

	rs.close();

	%>

</table>
<br>
<br>

  
 
</div>

</div>

<br><br><br><br><br><br>
<br><br><br><br>
<br><br><br><br><br><br>
<hr size="3">

<div align="center">



<strong>POST ARTICLE</strong>

<%String postSuccess=null;

postSuccess=(String)request.getAttribute("post");

if(postSuccess!=null){

 %>

<p>

Article Successfully posted!

</p>

<%} %>

<form action="UploadArticle" method="post" enctype="multipart/form-data">

<table style="font-size=20px; text-align: center; font-family: Georgia, 'Times New Roman', Times, serif; font-size: 18px;" width="625" border="0" cellspacing="2" cellpadding="5" height="250">

  <tr>

    <td style="text-align: center"><label for="articleName">Article Name:</label></td>

    <td style="text-align: left"><input type="text" name="articleName" id="articleName"></td>

  </tr>

  <tr>

    <td style="text-align: center"><label for="category" style="font-size:18px;">Category:</label></td>

	<td style="text-align: left">	<select name="category">
		<%
		while(rs1.next()){
		String category=rs1.getString("CATEGORY");
		 %>
			<option value="<%=category %>"><%=category %></option>
		<%
		}
		 %>	
		</select>
	</td>
	</tr>

  <tr>

    <td style="text-align: center"><label for="articlePDF" style="font-size:18px;">Article PDF:</label></td>

    <td style="text-align: left"><input type="file" name="articlePDF" id="articlePDF"></td>

  </tr>

  <tr>

    <td style="text-align: center"><label for="articlePicture" style="font-size:18px;">Article Picture:</label></td>

    <td style="text-align: left"><input type="file" name="articlePicture" id="articlePicture"></td>

  </tr>

  <tr>

    <td style="text-align: center"><label for="tag" style="font-size:18px;">Tag1:</label></td>

    <td style="text-align: left"><input type="text" name="tag1" id="tag1"></td>

  </tr>

  <tr>

    <td style="text-align: center"><label for="tag2" style="font-size:18px;">Tag2:</label></td>

    <td style="text-align: left"><input type="text" name="tag2" id="tag2"></td>

  </tr>

  <tr>

    <td style="text-align: center"><label for="tag3" style="font-size:18px;">Tag3:</label></td>

    <td style="text-align: left"><input type="text" name="tag3" id="tag3"></td>

  </tr>

  <tr>

    <td style="text-align: center"><label for="tag4" style="font-size:18px;">Tag4:</label></td>

    <td style="text-align: left"><input type="text" name="tag4" id="tag4"></td>

  </tr>

  <tr>

    <td style="text-align: center"><label for="tag5" style="font-size:18px;">Tag5:</label></td>

    <td style="text-align: left"><input type="text" name="tag5" id="tag5"></td>

  </tr>

  <tr>

  	<td style="text-align: center"><p>
  	  <label for="snippet" style="font-size:18px; text-align: left;">About the article:</label>
  	  </p>
  	  <p><span class="charlimit">(upto 200 chars.) </span></p></td>

	<td style="text-align: left"><textarea rows="8" cols="60" name="snippet" id="snippet"></textarea></td>

  </tr>

</table>

<br>

<input type="image" src="images/homepage_images/submitbutton.png" value="Post" onClick="return uploadValidator()">

</form>
</div>

</div>

</div>

</div>

</body>

</html>