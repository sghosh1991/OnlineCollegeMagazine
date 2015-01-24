<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src=""></script>
<link rel="stylesheet" type="text/css" href="Reg.css" />
<title>Insert title here</title>
</head>
<body>
<h2><center>REGISTRATION PAGE</center></h2>
(Fields marked * are mandatory)
<form action="RegistrationManager" method="post" id="reg" name="reg" onsubmit='return formValidator()'>

<label for="fname">First Name:* </label><input type="text" name="fname" id="fname" size="20">
<br><br>
<label for="lname">Last Name:*</label><input type="text" name="lname"  id="lname" size="20"><br><br>
<label for="department">Department:*</label><input type="text" name="department" id="department" size="20">
<br><br>
<label for="password">Password:*</label> <input type="password" name="password" id="password" size="20" onkeyup="passwordStrength(this.value)">
<br><br>
<label for="cnfrmpasswd">Confirm Password:*</label><input type="password" name="cnfrmpasswd" id="cnfrmpasswd" size="20">
<br><br>
<label for="passwordStrength">Password strength</label>
<br>
                        <div id="passwordDescription">Password not entered</div>

                        <div id="passwordStrength" class="strength0"></div>
<br><br>
<label for="type">Type:*</label> &nbsp; <select name="type" id="type">
	<option value="Select">Select</option>
	<option value="Student">Student</option>
	<option value="Faculty">Faculty</option>
</select>
<br><br>
<label for="year">Year:</label><input type="text" name="year" id="year" size="20"><br>
 <br><br>
<label for="email">Email:* </label>&nbsp;<input type="text" name="email" id="email" size="20" onchange="checkEmail(this.value)">
	<div id="emailchk"></div>
<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" name="submit" id="submit" value="Register">
&nbsp;&nbsp;<input type="reset" name="reset" id="reset" value="Reset" >"
</form>
</body>

</html>