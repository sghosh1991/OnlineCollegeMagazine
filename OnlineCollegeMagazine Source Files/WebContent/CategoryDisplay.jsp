<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*,newpackage.localContent"%>
<html>
<head>
<title>CategoryDisplay</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="images/homepage_images/categorypage_style.css" />
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
  
                //Locale l1=new Locale("en","en");
                //ResourceBundle r=ResourceBundle.getBundle("Locale",l1);
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
  <a href="Login.jsp"> <%=lang.get("Login") %></a>
   <%
    }
    else{
    %>
 <a href="Logout"> <%=lang.get("Logout") %></a>
 <%} %>
<%if(name==null){ %>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <a href="Reg_final.jsp"> <%=lang.get("Register") %></a>
 <%} %>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <a href="http://iem.edu.in/engineering/home_iem_eng.php" target="_blank">Iem.edu.in</a>
  

 

  <div style="color: #ffffff;">
  <form id="searchform" name="searchform" method="get" action="SearchManager">
  <input type="radio" name="type" value="author" checked><%=lang.get("Author") %>
  <input type="radio" name="type" value="articlename"><%=lang.get("Name") %>
  <input type="radio" name="type" value="keyword"><%=lang.get("Keyword") %>
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

	<li id="nav"><a href="HomePage.jsp"> <%=lang.get("Home") %></a></li>

	<li id="nav"><a href="DisplayProfile"> <%=lang.get("Profile") %></a></li>

	<li id="nav"><a href="CategoryDisplayServlet"> <%=lang.get("Category") %></a></li>

	<li id="nav"><a href="AuthorDisplayServlet"> <%=lang.get("Authors") %></a></li>

    <li id="nav"><a href="AllArticleServlet"> <%=lang.get("Articles") %></a></li>

    <li id="nav"><a href="EditorWord.jsp"> <%=lang.get("Editor") %></a></li>

</ul>

  </div>
  
  <div id="category">
  <div>
 <table cellpadding="22" style="border-left-color: #006; border-bottom-color: #006; border-right-color: #006; border-top-color: #006; border-left-style: none; border-bottom-style: solid; border-right-style: none; border-top-style: solid; position: absolute; z-index: 1; left: 80px; width: 579px; font-size: 14px; font-family: Georgia, 'Times New Roman', Times, serif;">
 <tr height="20">
 <th width="58" style="color: #006; font-size: 22px;"><%=lang.get("CATEGORY")%></th>
 <th width="232" style="color: #006; font-size: 22px;"><%= lang.get("ARTICLE COUNT")%></th>
 <th width="147"></th>
 </tr>
<%
ResultSet rs=(ResultSet)request.getAttribute("categories");
%>
<%
try{
while(rs.next()){
String count=rs.getString("COUNT");
String category=rs.getString("CATEGORY");
//if(localLang.equals("hind"))
//category=r.getString(category);
 %>
 
 <tr>
 <td align="center" height="40">
 <h2><%=category%></h2>
 </td>
 <td align="center" height="40">
 <h3><%=count %><span style="text-align: center"></span></h3>
 </td>
 <td align="center" height="40">
 <form action="CategoryArticleDisplayServlet" method="get">
 <input type="hidden" name="category" value=<%=category%>>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="image" src="images/homepage_images/viewbutton.png" onClick="this.form.display()">
 </form>
 </td>
 </tr>
 
 
 <%

	}
}catch(Exception e){
e.printStackTrace();
}
 %>
  </table>
 </div>
 
 </div>
</div>
</div>
</div>
</body>
</html>