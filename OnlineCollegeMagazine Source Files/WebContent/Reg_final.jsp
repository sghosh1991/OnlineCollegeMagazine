<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1" import="java.util.HashMap,newpackage.localContent"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="Javascript/reg.js"></script>
<link rel="stylesheet" type="text/css" href="images/RegistrationPage/Registration.css" />
<link rel="stylesheet" type="text/css" href="images/homepage_images/regpage_style.css"/>
<link type="text/css" href="images/homepage_images/css/start/jquery-ui-1.8.18.custom.css" rel="Stylesheet" />
<link type="text/css" href="images/RegistrationPage/jquery-ui-1.8.19.custom.css" rel="Stylesheet" />

<script type="text/javascript" src="Javascript/jquery-ui-1.8.19.custom.min.js"></script>
<script type="text/javascript" src="Javascript/homepage_javascript/jquery.js"></script>
<script type="text/javascript" src="Javascript/registration.js"></script>
<script type="text/javascript" src="Javascript/homepage_javascript/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="Javascript/homepage_javascript/js/jquery-ui-1.8.18.custom.min.js"></script>
<script type="text/javascript" src="Javascript/jquery-ui-1.8.19.custom.min.js"></script>
<script type="text/javascript" src="Javascript/avro-1.1-beta.min.js" charset="utf-8"></script>


<script type="text/javascript" charset="utf-8">
	$(function(){
		var lang=$("#language").val();
		if(lang=="bng"){
		$("#fname").avro({'bangla':true});
		$("#lname").avro({'bangla':true});
		}
		else if(lang=="eng")
		$('textarea, input[type=text]').avro({'bangla':false});
		
	});
</script>


<style type='text/css'>


.is_available{
	color:green;
	font-size:13px;
}
.is_not_available{
	color:red;
	font-size:13px;
}
.captcha_result{
	font-size:13px;
}
</style>

<title>REGISTRATION</title>
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
    <p></p><p></p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

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




<div id="register">
<h4 align="center">REGISTRATION PAGE</h4>
<center><%= lang.get("(Fields marked * are mandatory)")%><center>
<form action="RegistrationManager" method="post" id="reg" name="reg">
<input type="hidden" name="language" id="language" value="<%=localLang %>">
<table width="526" border="0" align="center">

  <tr>
    <td width="254"><label for="fname"><%= lang.get("First Name") %>:* </label></td>
    <td width="262"><input type="text" name="fname" id="fname" size="20"></td>
  </tr>
  <tr>
    <td><label for="lname"><%= lang.get("Last Name") %>:*</label></td>
    <td><input type="text" name="lname"  id="lname" size="20"></td>
  </tr>
  <tr>
    <td><label for="department"><%= lang.get("Department") %>:*</label></td>
    <td><select name="department" id="department" style="width:165px;">
	<option value="CSE"><%= lang.get("Computer Science and Engineering") %></option>
	<option value="ECE"><%= lang.get("Electronics and Communications Engineering") %></option>
	<option value="IT"><%= lang.get("Information Technology") %></option>
</select></td>
  </tr>
  <tr>
    <td><label for="password"><%= lang.get("Password")%>:*</label> </td>
    <td><input type="password" name="password" id="password" size="20" onKeyUp="passwordStrength(this.value)">
  		<label id="hlp">&nbsp;<small><%= lang.get("HELP")%></small></label>
  	</td>
  </tr>
  
  <tr>
  	<td></td>
  	<td>  
  	<div id="tip" align="center" style="background-color:#808080">
    <p align="center" style="font-size:14px">
        <b><%=lang.get("Password must follow these rules.")%></b>
        <br>1.<%= lang.get("Its length should be greater than 6.")%> <br>
            2.<%= lang.get("It should have lower & uppercase characters.")%> <br>
            3.<%= lang.get("It should have at least one number.") %> <br>
            4.<%= lang.get("It should have at least one special character.") %>
	</p>
	</div>
	</td>
  </tr>
  <tr>
  	<td><label for="passwordStrength"><%= lang.get("Password strength") %></label></td>
  	<td>
  	
  	
  	<div id="passwordDescription"><small><%= lang.get("Password not entered") %></small></div>
  	<div id="passwordStrength" class="strength0"></div>
  	
  </td>
  <tr>
    <td><label for="cnfrmpasswd"><%= lang.get("Confirm Password") %>:*</label></td>
    <td><input type="password" name="cnfrmpasswd" id="cnfrmpasswd" size="20"></td>
  </tr>
  
  <tr>
    <td><label for="type"><%= lang.get("Type")%>:*</label></td>
    <td><select name="type" id="type">
	<option value="student"><%= lang.get("Student") %></option>
	<option value="faculty"><%= lang.get("Faculty") %></option>
	<option value="alumni"><%= lang.get("Alumni") %></option>
	</select>
    </td>
  </tr>
  <tr>
    <td><label for="year">Year:</label></td>
    <td><select name="year" id="year">
    <option value="1"><%=lang.get("First")%></option>
	<option value="2"><%=lang.get("Second")%></option>
	<option value="3"><%=lang.get("Third") %></option>
	<option value="4"><%=lang.get("Fourth")%></option>
	</select>
    </td>
  </tr>
  <tr>
    <td height="88"><label for="email"><%=lang.get("Email")%>:* </label></td>
    <td><input type="text" name="email" id="email" size="20"></td>
  </tr>
  <tr>
  	<td></td>
  	<td>
  	<div id="username_availability_result"></div>
  	</td>
  </tr>
  <tr>
  	<td></td>
  	<td>
  	<img id="capimage">
  	</td>
  </tr>
  <tr>
  	<td></td>
  	<td>
  	<input type="text" name="captcha_str" id="captcha_str">
	<br>
	<div id="captcha_result"></div>
	</td>
  </tr>
  
</table>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<div align="center">
<input type="image" name="submit" id="submit" src="images/homepage_images/submitbutton.png" onClick="return formValidator();">
&nbsp;&nbsp;<input type="image" name="reset" id="reset" src="images/homepage_images/resetbutton.png" >
</div>
</form>
</div>
</div>
</div>
<div id="dialog-modal" title="Confirmation Message">
	<p>Thank You for registering with us. An activation link has been sent to the email ID provided during registration. Kindly check your mail to activate your account.</p>
</div>

</body>

</html>