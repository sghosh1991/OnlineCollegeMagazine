<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><%@page
	language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*,java.io.*,java.util.HashMap,newpackage.localContent,java.awt.AlphaComposite,java.awt.Graphics2D,java.awt.Image,java.awt.Color,java.awt.Font,java.awt.image.BufferedImage,javax.imageio.ImageIO"%>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title>Sinergia</title>

		<link type="text/css" href="images/homepage_images/css/start/jquery-ui-1.8.21.custom.css" rel="Stylesheet" />
		<link rel="stylesheet" href="NewTemplate/css/style.css" type="text/css" />
        <link rel="stylesheet" href="NewTemplate/css/style_.css" type="text/css" />
        <link rel="shortcut icon" href="../favicon.ico">
        
        <link rel="stylesheet" type="text/css" href="NewTemplate/css/jquery.jscrollpane.css" media="all" />
        <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow&v1' rel='stylesheet' type='text/css' />
		<link href='http://fonts.googleapis.com/css?family=Coustard:900' rel='stylesheet' type='text/css' />
		<link href='http://fonts.googleapis.com/css?family=Rochester' rel='stylesheet' type='text/css' />
		
		<!--[if IE 7]>
			<link rel="stylesheet" href="NewTemplate/css/ie7.css" type="text/css" />
		<![endif]-->
        
       <link rel="stylesheet" type="text/css" href="NewTemplate/css/style4.css" />
       <link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css' />
       <link rel="stylesheet" type="text/css" href="NewTemplate/css/menu_style.css"/>
		
        
		<style type="text/css">
        <!--
        	body,td,th {
            font-family: RokkittRegular;
        	}
        -->
        </style>
        
		<script type="text/javascript" src="Javascript/homepage_javascript/js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="Javascript/homepage_javascript/js/jquery-ui-1.8.18.custom.min.js"></script>
		<script type="text/javascript" src="NewTemplate/js/jquery.easing.1.3.js"></script>
		<!-- the jScrollPane script -->
		<script type="text/javascript" src="NewTemplate/js/jquery.mousewheel.js"></script>
		<script type="text/javascript" src="NewTemplate/js/jquery.contentcarousel.js"></script>
		
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
			String name=null;
    String loggedIn=null;
    try{
    name=(String)session.getAttribute("name");
    loggedIn=(String)request.getAttribute("loggedIn");
    }catch(Exception e){
    e.printStackTrace();
    }
    
%>



<div class="page">
		  
			<div class="header">
				<a href="#" id="logo"><img src="NewTemplate/images/logo.gif" alt=""/></a>
<ul>
					<li class="selected"><a href="#">Home</a></li>
					<%if(name==null && loggedIn==null){ %>
					<li><a href="Login.jsp">Login</a></li>
					<%
   					 }
    				else{
    				%>
    				<li><a href="Logout">Logout</a></li>
    				<%} %>
    				<%if(name==null){ %>
					<li><a href="Reg_final.jsp">Register</a></li>
					<%} 
					%>
					<li><a href="http://iem.edu.in/engineering/home_iem_eng.php">iem.edu.in</a></li>
			  </ul>
            
			</div>
			
            <div style="color: #5e5e5e; font-family: 'RokkittRegular'; left: 560px;" >
            
            	
                
  					<form id="searchform" name="searchform" method="get" action="SearchManager"> 
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
                	&nbsp;&nbsp;&nbsp;
               	 	&nbsp;&nbsp;&nbsp;
                	&nbsp;&nbsp;&nbsp;
                	
                	
  			 <input type="text" name="searchString" id="searchfield" size="20" />
			 <input type="radio" name="type" value="author" checked>
		      Author
			 <input type="radio" name="type" value="articlename">
			  Name
			  <input type="radio" name="type" value="keyword">
			  Keyword
              <input type="submit" value="Search" id="searchButton"/>
              <!--  <a href="javascript: submitform()" class="a-btn">
						<span class="a-btn-text">Search</span>
						<span class="a-btn-slide-text">It's Easy!</span>
						<span class="a-btn-icon-right"><span></span></span>
					</a>-->
              
              </form>
             
              
		  </div>
            
            <div id="ca-container" class="ca-container">
				<div class="ca-wrapper">
				<%
				String query7="SELECT * FROM \"santosh\".VALIDATED_ARTICLES WHERE ISSUE_NAME IS NOT NULL ORDER BY VIEW_COUNT DESC FETCH FIRST 8 ROWS ONLY";
PreparedStatement ps7=con.prepareStatement(query7,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
ResultSet rs7=ps7.executeQuery();
int i=1,x=0;
String sysPath=request.getRealPath(File.separator);
String urlar[]=new String[8];
String picPath=null;
String snippetNew[]=new String[8];
String paraSnippet[][]=new String[8][];
String nameArticle[]=new String[8];
if(rs7.next()){
do{
picPath=rs7.getString("PICTURE_PATH");
String fullPath=sysPath.concat(picPath);
String imgName="image"+i+".jpg";
i++;
String copyPath=sysPath.concat("NewTemplate\\MostViewed\\"+imgName);
File f1=new File(fullPath);
File f2=new File(copyPath);
if(!f2.exists())
  f2.createNewFile();
 BufferedImage image = ImageIO.read(f1);
 Image originalImage=(Image)image;
 String artName = rs7.getString("NAME");
 BufferedImage scaledBI = new BufferedImage(340, 250, BufferedImage.TYPE_INT_RGB);
 Graphics2D g = scaledBI.createGraphics();
 g.setComposite(AlphaComposite.Src);
 g.drawImage(originalImage, 0, 0, 340, 250, null);
 g.dispose();
 ImageIO.write(scaledBI,"jpg",f2);
 String viewCount=rs7.getString("VIEW_COUNT");
 String vid=rs7.getString("VID");
 String pageno=rs7.getString("PAGENO");
 String issueName=rs7.getString("ISSUE_NAME");
 nameArticle[x]=artName;
 snippetNew[x]=rs7.getString("SNIPPET");
 paraSnippet[x]=snippetNew[x].split(";",3);
 System.out.println("The length of paraSnippet is: "+paraSnippet[x].length);
 urlar[x]="ArticleViewManagerServlet?view_count="+viewCount+"&vid="+vid+"&article_name="+artName+"&pageno="+pageno+"&issue_name="+issueName;
 x++;
}while(rs7.next());
}
				 %>	
<div class="ca-item ca-item-3">
						<div class="ca-item-main">
							<div class="ca-icon"></div>
							<h3><%= nameArticle[0] %></h3>
								<a href="#" class="ca-more">more...</a>
						</div>
						<div class="ca-content-wrapper">
							<div class="ca-content">
								<h6><%= nameArticle[0] %></h6>
								<a href="#" class="ca-close">close</a>
								<div class="ca-content-text">
									<p><%=paraSnippet[0][0] %></p>
									<p><%=paraSnippet[0][1] %></p>
									<p><%=paraSnippet[0][2] %></p>
								</div>
								<ul>
									<li><a href="<%=urlar[0]%>">Read more</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="ca-item ca-item-4">
						<div class="ca-item-main">
							<div class="ca-icon"></div>
							<h3><%= nameArticle[1] %></h3>
								<a href="#" class="ca-more">more...</a>
						</div>
						<div class="ca-content-wrapper">
							<div class="ca-content">
								<h6><%= nameArticle[1] %></h6>
								<a href="#" class="ca-close">close</a>
								<div class="ca-content-text">
									<p><%=paraSnippet[1][0] %></p>
									<p><%=paraSnippet[1][1] %></p>
									<p><%=paraSnippet[1][2] %></p>
								</div>
								<ul>
									<li><a href="<%=urlar[1]%>">Read more</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="ca-item ca-item-5">
						<div class="ca-item-main">
							<div class="ca-icon"></div>
							<h3><%= nameArticle[2] %></h3>
								<a href="#" class="ca-more">more...</a>
						</div>
						<div class="ca-content-wrapper">
							<div class="ca-content">
								<h6><%= nameArticle[2] %></h6>
								<a href="#" class="ca-close">close</a>
								<div class="ca-content-text">
									<p><%=paraSnippet[2][0] %></p>
									<p><%=paraSnippet[2][1] %></p>
									<p><%=paraSnippet[2][2] %></p>
								</div>
								<ul>
									<li><a href="<%=urlar[2]%>">Read more</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="ca-item ca-item-6">
						<div class="ca-item-main">
							<div class="ca-icon"></div>
							<h3><%= nameArticle[3] %></h3>
								<a href="#" class="ca-more">more...</a>
						</div>
						<div class="ca-content-wrapper">
							<div class="ca-content">
								<h6><%= nameArticle[3] %></h6>
								<a href="#" class="ca-close">close</a>
								<div class="ca-content-text">
									<p><%=paraSnippet[3][0] %></p>
									<p><%=paraSnippet[3][1] %></p>
									<p><%=paraSnippet[3][2] %></p>
								</div>
								<ul>
									<li><a href="<%=urlar[3]%>">Read more</a></li>
								</ul>
							</div>
						</div>
      </div>
					<div class="ca-item ca-item-7">
						<div class="ca-item-main">
							<div class="ca-icon"></div>
							<h3><%= nameArticle[4] %></h3>
								<a href="#" class="ca-more">more...</a>
						</div>
						<div class="ca-content-wrapper">
							<div class="ca-content">
								<h6><%= nameArticle[4] %></h6>
								<a href="#" class="ca-close">close</a>
								<div class="ca-content-text">
									<p><%=paraSnippet[4][0] %></p>
									<p><%=paraSnippet[4][1] %></p>
									<p><%=paraSnippet[4][2] %></p>
								</div>
								<ul>
									<li><a href="<%=urlar[4]%>">Read more</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="ca-item ca-item-8">
						<div class="ca-item-main">
							<div class="ca-icon"></div>
							<h3><%= nameArticle[5] %></h3>
								<a href="#" class="ca-more">more...</a>
						</div>
						<div class="ca-content-wrapper">
							<div class="ca-content">
								<h6><%= nameArticle[5] %></h6>
								<a href="#" class="ca-close">close</a>
								<div class="ca-content-text">
									<p><%=paraSnippet[5][0] %></p>
									<p><%=paraSnippet[5][1] %></p>
									<p><%=paraSnippet[5][2] %></p>
								</div>
								<ul>
									<li><a href="<%=urlar[5]%>">Read more</a></li>
								</ul>
							</div>
						</div>
					</div>
			  </div>
  </div>
  
  <div id="content">
  				<div id="menu_wrapper" class="blue">
				<div class="left"></div>
				<ul id="menu">
				<li><a href="HomePageNEW.jsp">Home</a></li>
				<li><a href="DisplayProfile">Profile</a></li>
				<li><a href="AuthorDisplayServlet">Authors</a></li>
				<li><a href="CategoryDisplayServlet">Categories</a></li>
				<li><a href="AllArticleServlet">Articles</a></li>
                <li><a href="EditorWord.jsp">Editor's Message</a></li>
			</ul>
		</div>
				
				<div id="Option" style="position: absolute; z-index: 1; top: -635px; left: 820px;">
	
	<%
	String userName=(String)request.getAttribute("name");
	if(loggedIn!=null){
	 %>
		<h2>Welcome, <%=userName %></h2>
<%}
	else if(name!=null){
	 %>
	 	<h2>Welcome, <%=name %></h2>
	 <% }
	  %>
	</div>	
				
  				<div id="edpick"> 
                
                	<h2>Editor's Picks</h2>
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
		if(snippet.length()>142)
		snippet=snippet.substring(0,142);
		authorName=rs3.getString("AUTHOR_NAME");
		url="ArticleViewManagerServlet?view_count="+viewCount+"&vid="+vid+"&article_name="+articleName+"&pageno="+pageno+"&issue_name="+issueName;
		
%>
                    <div id="edpick_art">
	
						<a href="<%=url %>">
	
						<img src="<%=picturePath%>" style="width:105px; height:110px; float:left;"/>
	
	
	
						<p align="center">
						<b><%=articleName %></b>
		
	
	
						<br/>
						<small>By:<%=authorName%></small>
						</p>
						<p align="justify">
						<%=snippet %>...
						</p>
	
						</a>
	
					</div>
                    <hr>
					<%
 	}while(rs3.next());
 }
 

%>
                </div>
             
   				<div id="toprated">
                	<h2>Top Rated Articles</h2>
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
  							<a href="<%= url %>">
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
  	
   				<p align="center"><br><br><hr noshade="noshade"></p>
   				<a href="ArchiveManagerServlet"><h2 align="center">Archive</h2></a>
  	
                <!--&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;-->
    		 <% 
  String query4="SELECT * FROM \"santosh\".ISSUES ORDER BY DATE DESC FETCH FIRST 6 ROWS ONLY";
  //String sysPath=request.getRealPath(File.separator);
  //String newPath;
  issueName=null;
  ResultSet rs4=null;
  PreparedStatement ps4=con.prepareStatement(query4,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
rs4=ps4.executeQuery();
if(rs4.next()){%>
<table align="center" cellpadding="22">
<tr>
<% 
	do{
		issueName=rs4.getString("NAME");
		String fPath=rs4.getString("FILE_PATH");
		String pic=rs4.getString("COVER_PICTURE");
		//newPath=sysPath.concat(filePath.substring(1));
%>
    			<td>
    			<a href="<%=fPath%>" target="_blank">
    			<img src="<%=pic%>" width="111" height="121" alt="cover pic" /><p align="center"><%= issueName %></p>
    			</a>
    			</td>
                <!--&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;-->
    <%
 	}while(rs4.next());
</tr>
</div>
 }
 }catch(Exception e){
 	e.printStackTrace();
 }
  %> 
  </div>
 
 		
                
	
</body>
</html>