<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1" import="java.sql.*,java.util.HashMap,newpackage.localContent"%>
<html>
<head>
<title>CategoryArticleDisplay</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="images/homepage_images/categorypage_style.css" />
<link type="text/css" href="images/homepage_images/css/start/jquery-ui-1.8.18.custom.css" rel="Stylesheet" />
<style type="text/css">

<!--

body{

	font-family: MS Serif, New York, serif;

	font-size: 20px;

}
#inner_bg #content #category table {
	font-family: Georgia, "Times New Roman", Times, serif;
	font-size: 18;
	color: #000;
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
 <%}%>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <a href="http://iem.edu.in/engineering/home_iem_eng.php" target="_blank">Iem.edu.in</a>
  

 

  <div style="color:#fff;">
  <form id="searchform" name="searchform" method="get" action="SearchManager" >
  <input type="radio" name="type" value="author" checked><%=lang.get("Author")%>
  <input type="radio" name="type" value="articlename"><%= lang.get("Name")%>
  <input type="radio" name="type" value="keyword"><%= lang.get("Keyword") %>
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
  
  <div id="category">
  
  <%
ResultSet rs=(ResultSet)request.getAttribute("articles");
int count;
try{
if(!rs.last())
{
out.print(lang.get("Sorry there are no articles to be displayed under this category."));
}else{

%>
	<table border="0" align="center">
	<tr>
    <th width="241"><h3><%= lang.get("ARTICLE NAME")%></h3></th>
    <th width="243"><h3><%=lang.get("AUTHOR NAME")%></h3></th>
    <th width="182"><h3><%=lang.get("VIEW COUNT")%></h3></th>
    <th width="115"><h3><%=lang.get("RATING")%></h3></th>&nbsp;&nbsp;&nbsp;&nbsp;    </tr>

<%
	
		rs.beforeFirst();
		
		while(rs.next()){
		double rate=rs.getDouble("RATE");
System.out.println(rate);
rate=rate*10;
System.out.println(rate);
int rating=(int)rate;
System.out.println(rating);
rate=(double)rating/10;
System.out.println(rate);
%>
<tr>
	<td align="center"><%=rs.getString("NAME")%></td>
	<td align="center"><%=rs.getString("AUTHOR_NAME")%></td>
	<td align="center"><%=rs.getInt("VIEW_COUNT")%></td>
	<td align="center"><%=rate %></td>
	<td width="116"><form action="ArticleViewManagerServlet" method="get">
	  <input type="hidden" name="issue_name" value="<%=rs.getString("ISSUE_NAME")%>">
	  <input type="hidden" name="article_name" value="<%=rs.getString("NAME")%>">
	  <input type="hidden" name="view_count" value="<%=rs.getString("VIEW_COUNT")%>">
	  <input type="hidden" name="vid" value="<%=rs.getString("VID")%>">
	  <input type="hidden" name="pageno" value="<%=rs.getString("PAGENO")%>">
	  <input type="image" name="submit" src="images/homepage_images/viewbutton.png" onClick="this.form.submit()">
	  </form>
	  </td>
</tr>
<%
					}          // end of while
	}   // end of else
   }catch(Exception e)
        {
     e.printStackTrace();
        }
 %>
	
</table>
</div>
</div>
</div>
</body>
</html>