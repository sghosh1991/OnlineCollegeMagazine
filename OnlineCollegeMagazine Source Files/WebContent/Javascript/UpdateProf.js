function notEmpty(elem){	
	if(elem.value.length == 0){
			return false;
		}
		return true;
	}


function isEqual(elem1, elem2){
		   	if(elem1.value!=(elem2.value)){
		   		return false;
		   		}
		   	else{
		   		return true;
		   	}
	   }



function updateValidate()
{	
	var picture=document.getElementById('picture');
	var user=document.getElementById('user');
	var newpass=document.getElementById('newpass');
	var cnewpass=document.getElementById('cnewpass');
	if(notEmpty(picture)==false && notEmpty(user)==false && notEmpty(newpass)==false && notEmpty(cnewpass)==false){
		alert("Please update atleast one of the fields");
		return false;
	}
	else if(isEqual(newpass,cnewpass)==false){
		alert("The password fields do not match");
		return false;
	}
	else if((notEmpty(newpass) || notEmpty(newpass)) && notEmpty(user)==false){
		alert("Please enter the Old Password field");
		return false;
	}
	return true;
	
}
function updateValidator()
{
	var user=document.getElementById('user');
	var newpass=document.getElementById('newpass');
	var cnewpass=document.getElementById('cnewpass');
	if(notEmpty(user))
	{
		if(notEmpty(newpass) && notEmpty(cnewpass) && isEqual(newpass,cnewpass))
			return true;
		else
		{
			alert("The password fields do not match");
			return false;
		}
	}
	else
	{
		alert("Enter the Old Password Field");
		return false;
	}
}






