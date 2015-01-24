<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1" import="java.sql.*,java.util.HashMap,newpackage.localContent"%>
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
        String localLang;
        System.out.println("hi");
        
        localLang=(String)session.getAttribute("localLang");
        System.out.println("LOCAL LANG IS :"+localLang);
        localContent l=new localContent();
        HashMap<String,String> lang=l.getLang(localLang);
        System.out.println(lang);
        System.out.println(lang.get("Home"));
        //String urlBeng="localLanguageGeneratorServlet?lang=bng";
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
  <a href="Login.jsp"> <%= lang.get("Login")%></a>
   <%
    }
    else{
    %>
 <a href="Logout"><%=lang.get("Logout")%></a>
 <%} %>
<%if(name==null){ %>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <a href="Reg_final.jsp"><%= lang.get("Register")%></a>
 <%} %>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <a href="http://iem.edu.in/engineering/home_iem_eng.php" target="_blank">Iem.edu.in</a>
  

 

  <div style="color:#fff;">
  <form id="searchform" name="searchform" method="get" action="SearchManager" >
  <input type="radio" name="type" value="author" checked><%=lang.get("Author")%>
  <input type="radio" name="type" value="articlename"><%=lang.get("Name")%>
  <input type="radio" name="type" value="keyword"><%=lang.get("Keyword")%>
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

	<li id="nav"><a href="HomePage.jsp"><%= lang.get("Home")%></a></li>

	<li id="nav"><a href="DisplayProfile"><%= lang.get("Profile")%></a></li>

	<li id="nav"><a href="CategoryDisplayServlet"><%=lang.get("Category")%></a></li>

	<li id="nav"><a href="AuthorDisplayServlet"><%=lang.get("Authors")%></a></li>

    <li id="nav"><a href="AllArticleServlet"><%=lang.get("Articles")%></a></li>

    <li id="nav"><a href="EditorWord.jsp"><%=lang.get("Editor")%></a></li>

</ul>

  </div>
<div id="articles">
<h3 align="center"><%=lang.get("Magazine Articles")%></h3>
<hr>
<% 
String startRow=(String)request.getAttribute("startRow");
String countRow=(String)request.getAttribute("countRow");
int sRow=0,cRow=0;
ResultSet rs=null;
rs=(ResultSet)request.getAttribute("resultset");
if(rs==null)
rs=(ResultSet)session.getAttribute("articleResult");
    if(rs.next()){
    if(startRow!=null)
	sRow=Integer.parseInt(startRow);
else
	sRow=Integer.parseInt(request.getParameter("startRow"));
System.out.println("The start Row is: "+sRow);
if(countRow!=null)
	cRow=Integer.parseInt(countRow);
else
	cRow=Integer.parseInt(request.getParameter("countRow"));
System.out.println("The count Row is: "+cRow);
rs.absolute(sRow);
int count=0;
  	do{
  		try{
  		 String articleName=rs.getString("NAME");
  		 System.out.println(articleName);
  		String filePath=rs.getString("FILE_PATH");
        String issueName=rs.getString("ISSUE_NAME");
        int view_count=rs.getInt("VIEW_COUNT");
        int pageno=rs.getInt("PAGENO");
        String vid=rs.getString("VID");
        String authorName=rs.getString("AUTHOR_NAME");
        String snippet=rs.getString("SNIPPET");
        String picPath=rs.getString("PICTURE_PATH");
        String url="ArticleViewManagerServlet?issue_name="+issueName+"&article_name="+articleName+"&view_count="+view_count+"&pageno="+pageno+"&vid="+vid;
   %>
   <div id="indivart" align="center">
   <a href="<%=url %>" id="artlink">
   <img src="<%=picPath %>" style="width:90px; height:90px; float:left;"/>
   <p align="center">
   <%=articleName%>
   <br/>
			By:<%=authorName %>
			</p>
		<p align="center">
		<%=snippet %>
		</p>
	</a>
	<hr>
   </div>
   <%
   if(sRow+count==cRow){
	System.out.println("Breaking condition satisfied");
	break;
}
rs.next();
count++;
}catch(Exception e){
e.printStackTrace();
}
}while(count<6);
if(sRow!=1){
System.out.println("Previous display satisfied");
sRow=sRow-6;
String prevLink="AllArticle.jsp?startRow="+sRow+"&countRow="+cRow;

rs.absolute(sRow-1);
sRow=sRow+6;
%>
<br>
<a href="<%=prevLink %>">
<img src="images/homepage_images/prevbutton.png">
</a>
&nbsp;&nbsp;&nbsp;
<% 
}

if(count==6){
System.out.println("Next display satisfied");
rs.previous();
sRow=sRow+6;
String nextLink="AllArticle.jsp?startRow="+sRow+"&countRow="+cRow;
sRow=sRow-6;
%>
<a href="<%=nextLink %>">
<img src="images/homepage_images/nextbutton.png">
</a>
<% 
}
}
 %>

</div>
</div>
</div>

</body>
</html>