<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,java.io.File,java.util.ArrayList"%>
<html>
<head>
<title>AdminProfile</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


 <link type="text/css" href="images/homepage_images/jQueryButton/jquery-ui-1.8.21.custom.css" rel="Stylesheet" />              
<link rel="stylesheet" type="text/css" href="images/homepage_images/adminpage_style.css" />
<link type="text/css" href="images/homepage_images/css/start/jquery-ui-1.8.18.custom.css" rel="Stylesheet" />

<script type="text/javascript" src="Javascript/homepage_javascript/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="Javascript/homepage_javascript/js/jquery-ui-1.8.18.custom.min.js"></script>
 <script type="text/javascript" src="Javascript/adminProfile.js"></script>
 <script type="text/javascript" src="Javascript/AdminProf.js"></script>
<script type="text/javascript">
$(function(){

$( "#backup" ).button();
$( "#restoreDB" ).button();
		$( "a", ".demo" ).click(function() { return false; });
		});
		</script>
	<style type="text/css">
	<!--
	body{
	font-family: MS Serif, New York, serif;
	font-size: 20px;
	}
	-->
	</style>
            
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
else
	name =(String)session.getAttribute("name");
%>
<h4><%=name %></h4>
<%String update=(String)request.getAttribute("update");
if(update!=null){ %>
<br>Profile Successfully Updated!<br>
<%} %>
<p><a href="UpdateProfile.jsp">Update profile</a></p>
<%
String success=null;
success=(String)request.getAttribute("success");
if(success==null){
ResultSet rs1=(ResultSet)request.getAttribute("publishArticle");
String articleName=null;
String pdfPath=null;
String pdf=null;
String url=null;
try{
	if(rs1.next()){
	do{
	articleName=rs1.getString("NAME");
	pdfPath=rs1.getString("PDF_PATH");
	pdfPath=pdfPath.replace("\\","/");
	pdf="/";
	pdf=pdf.concat(pdfPath);
	System.out.println("pdf path for download is:"+pdf);
	url="DownloadManager?filePath="+pdf+"&name="+articleName;
 %>
 <%=articleName %>&nbsp; 
 <a href="<%=url %>" style="color:#000" target="_blank" >Download</a><br><br>
 <%
 	}while(rs1.next());
 	
  %>	<br>
  
  <%
  String duplicate=null;
  duplicate=(String)request.getAttribute("duplicate");
  	if(duplicate!=null){%>
  		Issue Name already exists.
   <%}%>
   
   <h3>Upload Issue:</h3>
   <form action="UploadIssue" method="post" enctype="multipart/form-data">
   <table width="500" border="0">
  <tr>
    <td>Name of the issue: </td>
    <td><input type="text" name="issuename" id="issuename"></td>
  </tr>
  <tr>
    <td>Issue PDF:</td>
    <td><input type="file" name="issuepdf" id="issuepdf"></td>
  </tr>
  <tr>
    <td>Issue Cover Picture:</td>
    <td><input type="file" name="isssuecover" id="issuecover"></td>
  </tr>
</table>
  <input type="image"  src="images/homepage_images/createissuebutton.png" onClick="return CurrentIssueValidator()">
  </form>  
  <%
 
   }
   else{%>
   
   	No Articles have been submitted for the Next Issue.
   <%} 
   }
   catch(SQLException e){
 }
 }
 else{%>
 Issue Successfully Created!
 <%} %>
 
 
 <h3>Add/Change Moderator</h3>
 <div>
 <%
 String newCategory=null;
 String catName=null;
 String modName=null;
 newCategory=(String)request.getAttribute("newCategory");
 catName=(String)request.getAttribute("catName");
 modName=(String)request.getAttribute("modName");
 if(newCategory!=null){
 	if(newCategory.equals("Yes"))
 		out.println(catName+" has been successfully added as a new Category<br>"+modName+" has been registered as it's Moderator");
 	else 
 		out.println("The moderator of the "+catName+" has been changed<br>"+modName+" has been registered as it's moderator");
 }
  %>
  <form action="AddModerator" method="post">
 <table width="500" border="0">
  <tr>
    <td>First Name:</td>
    <td><input type="text" name="fname" id="fname"></td>
  </tr>
  <tr>
    <td>Last Name:</td>
    <td><input type="text" name="lname" id="lname"></td>
  </tr>
  <tr>
    <td>Category:</td>
    <td><input type="text" name="category" id="category"></td>
  </tr>
  <tr>
    <td>Email:</td>
    <td><input type="text" name="email" id="email"></td>
  </tr>
</table>
<input type="image" src="images/homepage_images/submitbutton.png" onClick="return AddModeratorValidator()">
</form>
<br>

Average Rating of Articles in each Category&nbsp;&nbsp;&nbsp;<input type="image" src="images/homepage_images/viewreportbutton.png"  id="b1" >
<br>
<hr>
<div id="pic1" height="500" width="500">
            <img id="img1">
            <input type="image" src="images/homepage_images/hidereportbutton.png" id="hide1" >
            <br>
            <a id="download1" href="DownloadManager?filePath=/ReportPDF/CategoryAverageRating.pdf&name=CatgeoryAverageRating">Export as PDF</a>
        </div>
        <br>
  
<br>


Rate of Rejection in each Category&nbsp;&nbsp;&nbsp;<input type="image" src="images/homepage_images/viewreportbutton.png" id="b2">
<br>
<hr>
<div id="pic2" height="500" width="500" >
            <img id="img2">
            <input type="image" src="images/homepage_images/hidereportbutton.png" id="hide2" >
            <br>
            <a id="download2" href="DownloadManager?filePath=/ReportPDF/CategoryRejectionRate.pdf&name=CatgeoryRejectionrate">Export as PDF</a>
        </div>
        <br>
    
<br>

Moderator Activity Level&nbsp;&nbsp;&nbsp;<input type="image" src="images/homepage_images/viewreportbutton.png" id="b3">
<br>
<hr>
<div id="pic3" height="500" width="500" >
            <img id="img3">
            <input type="image" src="images/homepage_images/hidereportbutton.png" id="hide3">
            <br>
            <a id="download3" href="DownloadManager?filePath=/ReportPDF/ModeratorActivity.pdf&name=ModeratorActivity">Export as PDF</a>
        </div>
<br>
<br>
</div>

<h3>Objectionable Comments</h3> 
<%
String commentDelete=null;
String commentIgnore=null;
commentDelete=(String)request.getAttribute("commentDelete");
commentIgnore=(String)request.getAttribute("commentIgnore");
if(commentDelete!=null){
 %>
<small><i><b> Comment Deleted Successfully.</b></i></small>
<%
}
if(commentIgnore!=null){
%>
<small><i><b> Comment Ignored.</b></i></small>
<% 
}
ResultSet rs2=null;
String content=null;
String commentorName=null;
String commentID=null;
String url1=null;
String url2=null;
rs2=(ResultSet)request.getAttribute("reportComment");
try{
if(rs2.next()){
	do{
		commentorName=null;
		content=rs2.getString("CONTENT");
		commentorName=rs2.getString("NAME");
		commentID=rs2.getString("COM_ID");
		url1="DeleteComment?comid="+commentID;
		url2="IgnoreComment?comid="+commentID;
 %>
 <p>
 <%if(commentorName==null){%> 
 <b>Guest</b>
 <% 
 }
 else{%>
<b><%=commentorName%></b>
 <%} %> 
 <br>
 <%=content %>
 </p>
 <small><a href="<%=url1 %>">Delete</a>&nbsp;&nbsp;<a href="<%=url2 %>">Ignore</a></small>
 <%}while(rs2.next());
 }
 else{
 if(commentDelete==null && commentIgnore==null){
 %>
 No comments have been reported recently.
 <%
 } 
 }
 }catch(Exception e){
 }
  %>
  <br><br>
  <h3>Add to the Regex Repository</h3>
  <%
  String enhance=null;
  enhance=(String)request.getAttribute("enhance");
  if(enhance!=null){
   %>
   Objectionable words have been successfully added to the repository.
   <%} %>
  
  <form action="EnhanceRegexSERVLET" method="post">
<textarea rows="8" cols="15" name="slang"></textarea>
<input type="image" src="images/homepage_images/addbutton.png" name="submit" onClick="this.form.submit()">
</form>
<br><br>
<h3>Database Operations</h3>

<div id="backupstatus">
<button id="backup">BACKUP DATABASE</button>
</div>
<br><br>
<div id="restoreslide">
<button id="restoreDB">RESTORE DATABASE</button>
</div>
<br/>
<div id="restorestatus">
<%
File f=new File("C:/backup");
		File[] ar=f.listFiles();
		ArrayList fName=new ArrayList();
		if(ar.length>0){
		int i=0;
		while(i<ar.length){
			String str=ar[i].getName();
			int start=str.lastIndexOf('N');
			start=start+6;
			int end=str.lastIndexOf('.');
			fName.add(str.substring(start, end));
			System.out.println(fName.get(i));
			i++;
		}
		String temp;
		boolean swap=true;
		for(i=0;i<ar.length-1;i++){
			for(int j=1;j<ar.length && swap;j++){
				swap=false;
				double before=Double.parseDouble(fName.get(i).toString());
				double after=Double.parseDouble(fName.get(j).toString());
				if(before<after){
					swap=true;
					temp=fName.get(i).toString();
					fName.set(i, fName.get(j));
					fName.set(j,temp);
				}
			}
		}%>
		Choose the Backup Image from where restore operation is to be performed<br>*<small><i>Names displayed in most recent order</i></small><br>
		<br><br><% 
		for(i=0;i<ar.length && i<3;i++){
			String bName=fName.get(i).toString();
			String bid="restore"+i;
			%>
			MAGDB.0.DB2.NODE0000.CATN0000.<%=bName %>.001&nbsp;&nbsp;<button id="<%=bid %>" onclick="restoreOp('<%=bName %>');">Choose</button>
			<br/>
			<% 
		}
 }
else{ %>
Currently there are no Backup images available from which restore operation can be performed.
<%} %>
</div>
</div>
</div>
</body>

</html>