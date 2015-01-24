<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1" import="java.sql.ResultSet,java.util.HashMap,newpackage.localContent"%>
<html>
<head>
<title>ArchivePage</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="images/homepage_images/archive_style.css" />
<link type="text/css" href="images/homepage_images/css/start/jquery-ui-1.8.18.custom.css" rel="Stylesheet" />
        <style type="text/css">

			<!--

		body,td,th {

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
    
    	<div id="inner_bg">
        <div id="top_menu">
  
  <br />
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
  <a href="Login.jsp"> <%= lang.get("Login") %></a>
   <%
    }
    else{
    %>
 <a href="Logout"><%= lang.get("Logout") %></a>
 <%} %>
<%if(name==null){ %>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <a href="Reg_final.jsp"><%= lang.get("Register") %></a>
 <%} %>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <a href="http://iem.edu.in/engineering/home_iem_eng.php" target="_blank">Iem.edu.in</a>
  

 

  <div>
  <form id="searchform" name="searchform" method="get" action="SearchManager" >
  <input type="radio" name="type" value="author" checked><%= lang.get("Author") %>
  <input type="radio" name="type" value="articlename"><%= lang.get("Name") %>
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

<p></p><p></p>

  <div id="navmenu" class="center">

  <ul id="navli">

	<li id="nav"><a href="HomePage.jsp"><%= lang.get("Home") %></a></li>

	<li id="nav"><a href="DisplayProfile"><%= lang.get("Profile") %></a></li>

	<li id="nav"><a href="CategoryDisplayServlet"><%= lang.get("Category") %></a></li>

	<li id="nav"><a href="AuthorDisplayServlet"><%= lang.get("Authors")%></a></li>

    <li id="nav"><a href="AllArticleServlet"><%=lang.get("Articles") %></a></li>

    <li id="nav"><a href="EditorWord.jsp"><%=lang.get("Editor") %></a></li>

</ul>

  </div>
<div id="archive">
        <table width="850" title="Footprints Archive">
        <%
        ResultSet rs=(ResultSet)request.getAttribute("archive");
        while(rs.next()){
            int i=0;
            rs.previous();%>
            <tr>
                <%
            while(rs.next() && i<3){
                String picture=rs.getString("COVER_PICTURE");
                int count=rs.getInt("DOWNLOAD_COUNT");
                String filePath=rs.getString("FILE_PATH");
                String issueName=rs.getString("NAME");
                String newIssueName=issueName.replace(","," ");
                System.out.println(newIssueName);
                String linkPDF="/";
                linkPDF=linkPDF.concat(filePath.replace("\\","/"));
                String url="DownloadManager?filePath="+linkPDF+"&name="+newIssueName+"&ISSUE_NAME="+issueName;
                System.out.println(url);%>
                <td align="center"><a href="<%=filePath%>" target="_blank"><img src="<%=picture%>" height="150" width="150"><br><%=issueName%></a><br><%= lang.get("DOWNLOAD COUNT")%>:<%=count%>
                <br>
                <small><a href="<%=url %>"><%= lang.get("Download") %></a></small>
                </td>
            <% 
            i++;
            if(i==3)
            	rs.previous();
            }
            %>
            </tr>
        <%    
        }
        %>
        </table>
 </div>
 </div>
 </div>
    </body>
</html>
