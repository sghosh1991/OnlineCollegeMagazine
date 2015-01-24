<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1" import="java.sql.*,java.util.HashMap,newpackage.localContent"%>
<html>
<head>
<title>Article View</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="images/ArticleViewPage/Rating.css" />
<link rel="stylesheet" type="text/css" href="images/ArticleViewPage/articleview_style.css" />
<link type="text/css" href="images/homepage_images/css/start/jquery-ui-1.8.18.custom.css" rel="Stylesheet" />

<script type="text/javascript" src="Javascript/homepage_javascript/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="Javascript/homepage_javascript/js/jquery-ui-1.8.18.custom.min.js"></script>
<script type="text/javascript" src="Javascript/test.js"></script>

<style type="text/css">
.mother{

            border-style:solid;
            border-width:2px; 
        } 

.comment_bg
{
border: 1px #000;
}
</style>

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
    String type=null;
    try{
    name=(String)session.getAttribute("name");
    loggedIn=(String)request.getAttribute("loggedIn");
    type=(String)session.getAttribute("type");
    }catch(Exception e){
    e.printStackTrace();
    }
    if(name==null && loggedIn==null){
    %>
  <a href="Login.jsp"> <%=lang.get("Login")%></a>
   <%
    }
    else{
    %>
 <a href="Logout"><%=lang.get("Logout")%></a>
 <%} %>
<%if(name==null){ %>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <a href="Reg_final.jsp"><%=lang.get("Register")%></a>
 <%}
  %>
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
  

<%
String article_name=(String)request.getAttribute("article_name");
Integer pageno=(Integer)request.getAttribute("pageno");

ResultSet rs=(ResultSet)request.getAttribute("comments");

System.out.println("IN ARTICLE VIEW.JSP");
System.out.println("ARTICLE NAME: " + article_name);

String filepath="Articles/"+article_name+"/page1.png";
String RID= (String)request.getSession().getAttribute("RID");
String VID=(String)request.getAttribute("VID");
String pdf_path=(String)request.getAttribute("pdf_path");
String issue_name=(String)request.getAttribute("issue_name");
System.out.println("ISSUE NAME is:"+issue_name);
String viewer_name=(String)session.getAttribute("name");
if(viewer_name==null)
viewer_name="GUEST";
String anonymous=null;
String linkPDF="/";
pdf_path=pdf_path.replace("\\","/");
linkPDF=linkPDF.concat(pdf_path);
String newIssueName=issue_name.replace(","," ");
String url="DownloadManager?filePath="+linkPDF+"&name="+newIssueName+"&ISSUE_NAME="+issue_name;


//System.out.println("RID is: "+ RID+ " VID IS: "+ VID);
%>

<form><input type="hidden" name="totalPages" value="<%=pageno%>"><input type="hidden" name="viewer" value="<%=viewer_name%>"><input type="hidden" name="VID" value="<%=VID%>"><input type="hidden" id="issueName" name="issueName" value="<%=issue_name%>"></form>
<div id="article_layer"
	style="position: absolute; z-index: 1; width: 860px; height: 1060px; top: 75px; left: 94px;"><img id="article" src="<%=filepath %>" align="middle" height="1056" width="860"></div>


<div id="navigation_layer"
	style="position: absolute; z-index: 3; width: 300px; height: 20px; top: 1159px; left: 88px; ">
	
<%
out.println("<input type=\"image\" id=\"prev_button\" src=\"images/ArticleViewPage/prevbutton.png\" onclick=\"prev('"+filepath+"',"+pageno+");\"></input>");
out.println("<input type=\"image\" id=\"next_button\" src=\"images/ArticleViewPage/nextbutton.png\" onclick=\"next('"+filepath+"',"+pageno+");\"></input>");
 %>



</div>

<div id="comment_layer"
	style="position: absolute; z-index: 2; width: 862px; height: 299px; top: 1250px; left: 84px;">
	

<div id="actual_comments">
<div id="report_abuse"
	style="position: absolute; left: 718px; top: 20px"></div>
</div>	
<button id="prev_comments" onclick=" prevComment();"><%=lang.get("PREVIOUS COMMENTS")%></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button id="next_comments" onclick=" nextComment();"><%=lang.get("NEXT COMMENTS")%></button>
<%
/*
try{
if(rs.next()){
	do{
if (rs.getString("NAME")==null)
anonymous ="Anonymous";
else 
anonymous=rs.getString("NAME");
out.print("<br><hr>");
//out.println("<p id=\"last_com\">Author :"+anonymous+" Commented:  "+ rs.getString("CONTENT")+"   on \n"+ rs.getDate("COMMENT_DATE") + "</p>");

}while(rs.next());
}
 }catch(Exception e){
		e.printStackTrace();
}
*/
%>
<div style="margin:1px; height:auto">
<textarea rows="10" cols="60" name="comment" id="comment"></textarea>
<br>


<%
//if(RID!=null){
%>
<a href="<%=url %>" id="down"><%= lang.get("Download")%></a>
<%
//}
 %>	
 
 
</div>

<%
out.write("<input type=\"image\" id=\"com_post\" src=\"images/ArticleViewPage/postbutton.png\" onclick= \"comment('"+VID+"','"+RID+"');\"></input>");
 %>
</div>

<div id="mother" class="mother"
	style="position: absolute; z-index: 0; width: 172px; height: 55px; top: 1140px; left: 777px;">
<div id="star1" class="star1 ratings_stars"
	style="position: absolute; z-index: 1; width: 30px; height: 32px; top: 11px; left: 7px;"></div>
<div id="star2" class="star2 ratings_stars"
	style="position: absolute; z-index: 2; width: 30px; height: 32px; top: 11px; left: 41px;"></div>
<div id="star3" class="star3 ratings_stars"
	style="position: absolute; z-index: 3; width: 30px; height: 31px; top: 11px; left: 74px;"></div>
<div id="star4" class="star4 ratings_stars"
	style="position: absolute; z-index: 4; width: 30px; height: 31px; top: 11px; left: 104px;"></div>
<div id="star5" class="star5 ratings_stars"
	style="position: absolute; z-index: 5; width: 30px; height: 31px; top: 10px; left: 137px;"></div>
</div>

<%out.print("<input type=\"image\" src=\"images/ArticleViewPage/ratebutton.png\" id=\"rate_button\" style=\"position: absolute; z-index: 6; width: 97px; height: 31px; left: 815px; top: 1220px; \" onclick=\" submit_vote('"+ VID+"');\"></input>");%>
<div id="voting_done" style="position: absolute; z-index: 7; width: 180px; height: 55px; top: 1150px; left: 778px;" ><%=lang.get("Thank You for rating")%>!</div>
</div>

</div>

</body>
</html>