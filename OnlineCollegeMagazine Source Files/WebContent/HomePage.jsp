<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.HashMap,newpackage.localContent,java.awt.AlphaComposite,java.awt.Graphics2D,java.awt.Image,java.awt.Color,java.awt.Font,java.awt.image.BufferedImage,javax.imageio.ImageIO"%>
<html>
<head>
<title>Footprints</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="images/homepage_images/site_style.css" />
<link type="text/css" href="images/homepage_images/css/start/jquery-ui-1.8.18.custom.css" rel="Stylesheet" />
<style type="text/css">

<!--

body{

	font-family: MS Serif, New York, serif;

	font-size: 20px;

}
.chlangtxt {
	font-weight: bold;
	font-family: Georgia, "Times New Roman", Times, serif;
}
#contact {
	font-size: 12px;
	font-style: normal;
	color: #00F;
}

-->

</style>
<script type="text/javascript" src="Javascript/homepage_javascript/jquery.js"></script>
<script type="text/javascript" src="Javascript/homepage_javascript/jquery-easing-1.3.pack.js"></script>
<script type="text/javascript" src="Javascript/homepage_javascript/jquery-easing-compatibility.1.2.pack.js"></script>
<script type="text/javascript" src="Javascript/homepage_javascript/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="Javascript/homepage_javascript/js/jquery-ui-1.8.18.custom.min.js"></script>
<script type="text/javascript" src="Javascript/homepage_javascript/homepage.js"></script>






</head>
<body>


 <%
        String localLang;
        System.out.println("hi");
        session = request.getSession();
        
        localLang=(String)session.getAttribute("localLang");
        System.out.println("LOCAL LANG IS :"+localLang);
        
        if(localLang==null){
            System.out.println("NULL SESSION...FIRST REQUEST");
            localLang="eng";
            session.setAttribute("localLang", localLang);
           
            
        }
               else{
            System.out.println("SESSION NOT NULL----LANGUAGE is: "+localLang );
                
           
                       }
             
        
        localContent l=new localContent();
        HashMap lang=l.getLang(localLang);
        System.out.println(lang);
        String urlBeng="localLanguageGeneratorServlet?lang=bng";
        String urlHind="localLanguageGeneratorServlet?lang=hind";
        String urlEng="localLanguageGeneratorServlet?lang=eng";
        %>






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
  <a href="Login.jsp"><%= lang.get("Login")%></a>
   <%
    }
    else{
    %>
 <a href="Logout"><%= lang.get("Logout") %></a>
 <%} %>
 <%if(name==null){ %>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <a href="Reg_final.jsp"><%= lang.get("Register")%></a>
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

  <div id="kwikscontainer">

    <div class="jimgMenu">
	<%
	String query7="SELECT * FROM \"santosh\".VALIDATED_ARTICLES WHERE ISSUE_NAME IS NOT NULL ORDER BY VIEW_COUNT DESC FETCH FIRST 5 ROWS ONLY";
PreparedStatement ps7=con.prepareStatement(query7,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
ResultSet rs7=ps7.executeQuery();
int i=1,x=0;
String sysPath=request.getRealPath(File.separator);
String urlar[]=new String[5];
while(rs7.next()){
String picPath=rs7.getString("PICTURE_PATH");
String fullPath=sysPath.concat(picPath);
String imgName="image"+i+".jpg";
i++;
String copyPath=sysPath.concat("MostViewed\\"+imgName);
File f1=new File(fullPath);
File f2=new File(copyPath);
if(!f2.exists())
  f2.createNewFile();
/*InputStream in = new FileInputStream(f1);
OutputStream os = new FileOutputStream(f2);
byte[] buf = new byte[1024];
int len;
while ((len = in.read(buf)) > 0){
    os.write(buf, 0, len);
 }
 in.close();
 os.close();*/
 BufferedImage image = ImageIO.read(f1);
 Image originalImage=(Image)image;
 String artName = rs7.getString("NAME");
 BufferedImage scaledBI = new BufferedImage(340, 250, BufferedImage.TYPE_INT_RGB);
 Graphics2D g = scaledBI.createGraphics();
 g.setComposite(AlphaComposite.Src);
 g.drawImage(originalImage, 0, 0, 340, 250, null);
 g.setColor(Color.WHITE);
 g.setFont(new Font( "SansSerif", Font.ITALIC, 25 ));
 g.drawString(artName,50,30);
 g.dispose();
 ImageIO.write(scaledBI,"jpg",f2);
 String viewCount=rs7.getString("VIEW_COUNT");
 String vid=rs7.getString("VID");
 String pageno=rs7.getString("PAGENO");
 String issueName=rs7.getString("ISSUE_NAME");
 urlar[x]="ArticleViewManagerServlet?view_count="+viewCount+"&vid="+vid+"&article_name="+artName+"&pageno="+pageno+"&issue_name="+issueName;
 x++;
 }
	 %>
      <ul>

        <li class="image1"><a href="<%=urlar[0] %>">Landscapes</a></li>

        <li class="image2"><a href="<%=urlar[1] %>">People</a></li>

        <li class="image3"><a href="<%=urlar[2] %>">Nature</a></li>

        <li class="image4"><a href="<%=urlar[3] %>">Abstract</a></li>

        <li class="image5"><a href="<%=urlar[4] %>">Urban</a></li>

      </ul>

    </div>

  </div>

  

  <p></p><p></p>

  <div id="navmenu" class="center">

  <ul id="nav">

	<li><a href="HomePage.jsp"><%=lang.get("Home") %></a></li>

	<li><a href="DisplayProfile"><%=lang.get("Profile") %></a></li>

	<li><a href="CategoryDisplayServlet"><%= lang.get("Category")%></a>
	</li>

	<li><a href="AuthorDisplayServlet"><%= lang.get("Authors")%></a></li>

    <li><a href="AllArticleServlet"><%= lang.get("Articles")%></a></li>

    <li><a href="EditorWord.jsp"><%= lang.get("Editor")%></a></li>

</ul>

  </div>
	<div id="Option" style="position: absolute; z-index: 1; top: 459px; left: 327px;">
	
	<%
	String userName=(String)request.getAttribute("name");
	if(loggedIn!=null){
	 %>
		<b>Welcome, <%=userName %></b>
<%}
	else if(name!=null){
	 %>
	 	<b>Welcome, <%=name %></b>
	 <% }
	  %>
	</div>
	<div id="edpick">
	<h2><%= lang.get("Editor's Pick") %></h2>
	<hr>
	
	<% 
  String query3="SELECT * FROM \"santosh\".VALIDATED_ARTICLES WHERE CHOSEN='Yes' AND ISSUE_NAME IS NOT NULL ORDER BY VALIDATION_DATE DESC FETCH FIRST 4 ROWS ONLY";
  ResultSet rs3=null;
PreparedStatement ps3=con.prepareStatement(query3,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
rs3=ps3.executeQuery();
int pageno,viewCount;
String issueName=null;
String vid=null;
String url=null;
if(rs3.next()){
	do{
		viewCount=rs3.getInt("VIEW_COUNT");
		vid=rs3.getString("VID");
		articleName=rs3.getString("NAME");
		pageno=rs3.getInt("PAGENO");
		issueName=rs3.getString("ISSUE_NAME");
		filePath=rs3.getString("FILE_PATH");
		picturePath=rs3.getString("PICTURE_PATH");
		snippet=rs3.getString("SNIPPET");
		authorName=rs3.getString("AUTHOR_NAME");
		url="ArticleViewManagerServlet?view_count="+viewCount+"&vid="+vid+"&article_name="+articleName+"&pageno="+pageno+"&issue_name="+issueName;
		
%>
<div id="edpick_art">
	
	<a href="<%=url %>">
	
		<img src="<%=picturePath%>" style="width:90px; height:80px; float:left;"/>
	
	
	
		<p align="center">
			<b><%=articleName %></b>
		
	
	
		<br/>
			By:<%=authorName%>
			</p>
		<p align="center">
		<%=snippet %>
		</p>
	
	</a>
	
</div><br/>
<hr>
 <%
 	}while(rs3.next());
 }
 

%>
	</div>
  <div id="toprated">
  <h2><%= lang.get("Top Rated Articles")%></h2>
  <hr> 
  <div id="toprated_art">
  <ol>
 <%
 	System.out.println("Inside top rated articles");
  	String query1="SELECT * FROM \"santosh\".VALIDATED_ARTICLES WHERE ISSUE_NAME IS NOT NULL ORDER BY RATE DESC FETCH FIRST 10 ROWS ONLY";
	ResultSet rs1=null;
	PreparedStatement ps1=con.prepareStatement(query1,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
	rs1=ps1.executeQuery();
	
		if(rs1.next()){
		System.out.println("If condition satisfied");
		do{
			viewCount=rs1.getInt("VIEW_COUNT");
			vid=rs1.getString("VID");
			filePath=rs1.getString("FILE_PATH");
			String artName=rs1.getString("NAME");
			pageno=rs1.getInt("PAGENO");
			issueName=rs1.getString("ISSUE_NAME");
			url="ArticleViewManagerServlet?view_count="+viewCount+"&vid="+vid+"&article_name="+artName+"&pageno="+pageno+"&issue_name="+issueName;
			System.out.println(artName);	
			
%>
  <li>
  <a href="<%=url %>">
	<%=artName %>
  
</a>
</li>
<%
 	}while(rs1.next());
 }
 
 
  %>	
 </ol> 
 
 </div>
   </div>
   
   
 <div id="archive">
  	
   <p align="center"><a href="ArchiveManagerServlet"><%= lang.get("Archive")%></a></p>
  	
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    
    <% 
  String query4="SELECT * FROM \"santosh\".ISSUES ORDER BY DATE DESC FETCH FIRST 4 ROWS ONLY";
  //String sysPath=request.getRealPath(File.separator);
  //String newPath;
  issueName=null;
  ResultSet rs4=null;
  PreparedStatement ps4=con.prepareStatement(query4,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
rs4=ps4.executeQuery();
if(rs4.next()){
	do{
		issueName=rs4.getString("NAME");
		String fPath=rs4.getString("FILE_PATH");
		String picPath=rs4.getString("COVER_PICTURE");
		//newPath=sysPath.concat(filePath.substring(1));
%>
    <a href="<%=fPath%>" target="_blank">
    <img src="<%=picPath%>" width="111" height="121" alt="cover pic" />
    </a>
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    <%
 	}while(rs4.next());
 }
 }catch(Exception e){
 	e.printStackTrace();
 }
  %> 
    </div>
    <div id="chlang" style="position: absolute; z-index: 1; top: 1359px; left: 360px; width: 760px; height: 30px;">
 <span class="chlangtxt">Choose your Language Preference:</span>&nbsp;&nbsp;
 <a href="<%=urlEng %>">English</a> | <a href="<%=urlHind %>">हिंदी</a> | <a href="<%=urlBeng%>">বাংলা</a>
 <br/>
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
    
 <a href="mailto:colmag.sinergia@gmail.com">Contact Us!</a>  
 </div>
</div>
</div>

  
</body>
</html>
