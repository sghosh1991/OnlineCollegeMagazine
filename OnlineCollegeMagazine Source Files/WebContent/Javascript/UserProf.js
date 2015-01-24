	
function notEmpty(elem, helperMsg){
		if(elem.value.length == 0){
			alert(helperMsg);
			elem.focus(); // set the focus to this input
			return false;
		}
		return true;
	}


function uploadValidator()
{
	var articleName = document.getElementById('articleName');
	var articlePDF = document.getElementById('articlePDF');
	var articlePicture = document.getElementById('articlePicture');
	var tag1 = document.getElementById('tag1');
	var tag2 = document.getElementById('tag2');
	var tag3 = document.getElementById('tag3');
	var tag4 = document.getElementById('tag4');
	var tag5 = document.getElementById('tag5');
	var snippet = document.getElementById('snippet');

	if(notEmpty(articleName,"Fill in the article name field")){
		if(notEmpty(articlePDF,"Please upload an article")){ 
			if(notEmpty(articlePicture,"Please upload an article picture")){ 
				if(notEmpty(tag1,"Please enter a tag")){ 
					if(notEmpty(tag2,"Please enter a tag")){ 
						if(notEmpty(tag3,"Please enter a tag")){
							if(notEmpty(tag4,"Please enter a tag")){ 
 								if(notEmpty(tag5,"Please enter a tag")){ 
									if(notEmpty(snippet,"Please enter a snippet for the article")){
										if( snippet.value.length<200){
										return true;
												}
										else	{
												alert("Snippet exceeding 200 characters!!");
												return false;
												}
											}
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