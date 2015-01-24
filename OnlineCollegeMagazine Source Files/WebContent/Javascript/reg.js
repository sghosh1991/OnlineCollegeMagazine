


function passwordStrength(password)

{

        var desc = new Array();

        desc[0] = "Very Weak";

        desc[1] = "Weak";

        desc[2] = "Better";

        desc[3] = "Medium";

        desc[4] = "Strong";

        desc[5] = "Strongest";



        var score   = 0;



        //if password bigger than 6 give 1 point

        if (password.length > 6) score++;



        //if password has both lower and uppercase characters give 1 point      

        if ( ( password.match(/[a-z]/) ) && ( password.match(/[A-Z]/) ) ) score++;



        //if password has at least one number give 1 point

        if (password.match(/\d+/)) score++;



        //if password has at least one special caracther give 1 point

        if ( password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/) ) score++;



        //if password bigger than 12 give another 1 point

        if (password.length > 12) score++;



         document.getElementById("passwordDescription").innerHTML = desc[score];

         document.getElementById("passwordStrength").className = "strength" + score;

}



function validateEmail(elem, helperMsg){  
	   var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;  
	   if(elem.value.match(emailPattern)) { 
		   return true;
	   }  else{
		   alert(helperMsg);
		   elem.focus();
		   return false;
	   }
}
//validating email
function checkEmail(email){
//var str="EmailValidServlet";
	var xmlhttp;
	if(window.XMLHttpRequest){
		xmlhttp=new XMLHttpRequest();
	}
	else{
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange=handleServerResponse(xmlhttp);
	xmlhttp.open("GET","EmailValidServlet?email="+email,true);
	xmlhttp.send();
}

function handleServerResponse(xmlhttp){
		if(xmlhttp.readyState==4 && xmlhttp.status==200){
			document.getElementById("emailchk").innerHTML=xmlhttp.responseText;
		}
	}
	   function notEmpty(elem, helperMsg){
			if(elem.value.length == 0){
				alert(helperMsg);
				elem.focus(); // set the focus to this input
				return false;
			}
			return true;
		}
	   //checking a field to contain only numbers or not
	   function isNumeric(elem, helperMsg){
			var numericExpression = /^[0-9]+$/;
			if(elem.value.match(numericExpression)){
				return true;
			}else{
				alert(helperMsg);
				elem.focus();
				return false;
			}
		}
	   
	   function madeSelection(elem, helperMsg){
			if(elem.value == "Select"){
				alert(helperMsg);
				elem.focus();
				return false;
			}else{
				return true;
			}
		}
	   //checking a field to contain only alphabets or not
	   function isAlphabet(elem, helperMsg){
			var alphaExp = /^[a-zA-Z]+$/;
			if(elem.value.match(alphaExp)){
				return true;
			}else{
				alert(helperMsg);
				elem.focus();
				return false;
			}
		}
	   
	   //checking two fiwlds to be equal or not
	   function isEqual(elem1, elem2, helperMsg){
		   	if(elem1.value!=(elem2.value)){
		   		alert(helperMsg);
		   		elem2.focus();
		   		return false;
		   		}
		   	else{
		   		return true;
		   	}
	   }
	   //registration page validation
		   	function formValidator(){
			// Make quick references to our fields
			var fname = document.getElementById('fname');
			var lname = document.getElementById('lname');
			var department = document.getElementById('department');
			var password = document.getElementById('password');
			var cnfrmpasswd = document.getElementById('cnfrmpasswd');
			var type = document.getElementById('type');
			var email = document.getElementById('email');
			var captcha_str=document.getElementById('captcha_str');
			var form_name=document.getElementById('reg');
			
			// Check each input in the order that it appears in the form!
			if(notEmpty(fname,"Fill in the first name field") && isAlphabet(fname, "Please enter only letters for your name")){
				if(notEmpty(lname,"Fill in the last name field") && isAlphabet(lname, "Please enter only letters for your name")){
					if(notEmpty(department,"Fill in the department field") && isAlphabet(department, "Please enter only letters for your department")){
						if(notEmpty(password,"Fill in the password field")){
							if(notEmpty(cnfrmpasswd,"Fill in the confirm password field") && isEqual(password,cnfrmpasswd,'Confirm password and Password do not match') ){
								if(madeSelection(type, "Please Choose a type")){
									if(validateEmail(email, "Please enter a valid email address")){
										if(notEmpty(captcha_str,"Please Enter a valid Captcha")){ 
											$("#dialog-modal").dialog({
												modal:true,
												width:400,
												buttons: { "Ok": function() { $(this).dialog("close"); }},
												hide: { effect: 'drop', direction: 'down'}
												
													
													
											
										});
											
											$("#dialog-modal").bind("dialogclose",function(){form_name.submit();});
											
										 
										
										}
								}
							}
						}
					}
				}
			}
		}
			return false;
	 }
		   	//validate login
		   	function loginvalidate(){
		   		
		   		var type = document.getElementById('type');
		   		var user=document.getElementById('user');
		   		var password=document.getElementById('password');
		   	
		   		if(madeSelection(type, "Please Choose a type")){
		   		if(validateEmail(user, "Please enter a valid user name")){
		   			if(notEmpty(password,"Fill in the password field")){
		   				return true;
		   			}
		   	}
		}
	 		return false;
	 }