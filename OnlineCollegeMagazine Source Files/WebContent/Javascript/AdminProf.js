function notEmpty(elem, helperMsg){
		if(elem.value.length == 0){
			alert(helperMsg);
			elem.focus(); // set the focus to this input
			return false;
		}
		return true;
	}

function AddModeratorValidator()
{
	var fname=document.getElementById('fname');
	var lname=document.getElementById('lname');
	var category=document.getElementById('category');
	var email=document.getElementById('email');
	
	if(notEmpty(fname,"Please enter the first name")){ 
		if(notEmpty(lname,"Please enter the last name")){
			if(notEmpty(category,"Please enter the category")){
					if(notEmpty(email,"Please enter the email")){
						return true;
				}
			}
		}
	}
return false;
}


function CurrentIssueValidator()
{
	var issuename=document.getElementById('issuename');
	var issuepdf=document.getElementById('issuepdf');
	var issuecover=document.getElementById('issuecover');

	if(notEmpty(issuename,"Please enter the issue name")){
		if(notEmpty(issuepdf,"Please upload the issue")){ 
			if(notEmpty(issuecover,"Please upload the issuecover")){ 
			return true;
				}
			 } 
		}
return false;
}





