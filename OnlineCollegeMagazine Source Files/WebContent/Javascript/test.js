var current_page=1;
var vote=0;
var sets_of_comments;
var current_set_of_comments;
var viewer;
var CONTENT=new Array();
var author=new Array();
var comm_id=new Array();
var date=new Array();
var length;
var vid;
$(function(){

	
	//alert('total pages: '+ $("input:[name=totalPages]").val());
	$("#voting_done").hide();
	$("#prev_button").hide();
	$("#prev_comments").hide();
	 $("#next_comments").hide();
	 
	 /*
	 ----------------------------------------------------------------------------------------------
	 				CODE FOR FETCHING COMMENTS
	 -----------------------------------------------------------------------------------------------
	 */	
	 	vid=$("input:[name=VID]").val();
	 	//alert("the vid is: "+vid);
	 	var final_comment='';
	 	var content;
	 	viewer=$("input:[name=viewer]").val();
	 	//alert("you are: "+viewer);

	 	$.get("CommentFetchServlet",{VID:vid},function(data){
	 			//commArray=data;
	 			var j;
	 			length=data.length;
	 			//alert('length of data: '+length);
	 			for(j=0;j<length;j++){
	 				CONTENT[j]=(data[j].content);
	 				author[j]=data[j].author;
	 				comm_id[j]=(data[j].comm_id)
	 				date[j]=(data[j].date);
	 			}
	 			
	 			//alert('AUTHORS: '+author);
	 			
	 			
	 			
	/*------------------------------------------CACULATE SE OF COMMENTS--------------------------------------------------------*/ 		
	
	 			sets_of_comments=Math.floor(length/4);
	 			//alert("SETS OF 4 COMMENTS: "+sets_of_comments);
	 			if((length%4)>0){
	 				sets_of_comments=sets_of_comments+1;
	 			}
	 			//alert("SETS OF 4 COMMENTS: "+sets_of_comments);
	 			
	 			
   /*----------------------------------hide/show next/prev button-----------------------------------------------------------*/
	 			
	 			if(sets_of_comments<=1){
	 				//alert("Success at last..inside if prev next");
	 				 $("#next_comments").hide();
	 				//$("#prev_comments").hide();
	 				 				
	 				 }
	 			else{
	 				 $("#next_comments").show();
	 				//$("#prev_comments").hide();
	 				 
	 			}

	 			/*if(sets_of_comments==0){
	 				i=sets_of_comments;
	 			}
	 			else{
	 				i=(sets_of_comments-1)*4;
	 			}*/
	 			
	/*---------------------------------------------SHOW FIRST 4 COMMENTS----------------------------------------------------------*/
	 			
	 			
	 			
	 			current_set_of_comments=0;
	 			var limit=4;
	 			if(limit>length){
	 				limit=length;
	 				//alert('limit after the check is:' +limit);
	 			}
	 			var i;
	 			
	 			//alert("the value of i:"+i+" limit : "+ limit);
	 			for(i=0;i<limit;i++){
	 			
	 				var url="<button id=\""+comm_id[i]+"\" onclick=\" repAbuse('"+comm_id[i]+"');\">REPORT ABUSE</button>";
	 				content="<hr><p><b><u>"+author[i]+"</u></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp"+date[i]+"<br>"+CONTENT[i]+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp"+url+"</p>";
	 				final_comment=final_comment+content;
	 			
	 			}
	 			$("#actual_comments").html(final_comment);
	 			
	 	},"json");
	 
	 
	
	 
	 
	//------------------------------------------------------------------------------------------------------
	 //----------------------------------------------------------------------------------------------------
	 	
	 	
/*-----------------------------------CODE FOR RATING STARS------------------------------------------*/
	 
$(".ratings_stars").hover(function(){
	 
		$(this).prevAll().andSelf().addClass("ratings_over");
		
		 	},function(){
		$(this).prevAll().andSelf().removeClass("ratings_over");
	});
$("#star1").click(function(){
		$(this).prevAll().andSelf().addClass("ratings_vote");
		$(this).nextAll().removeClass("ratings_vote"); 	
		vote=1;
		});
	
	$("#star2").click(function(){
		$(this).prevAll().andSelf().addClass("ratings_vote");
		$(this).nextAll().removeClass("ratings_vote");
		vote=2;
	});

$("#star3").click(function(){
			$(this).prevAll().andSelf().addClass("ratings_vote");
		$(this).nextAll().removeClass("ratings_vote");
		vote=3;
	});
	
	$("#star4").click(function(){
		$(this).prevAll().andSelf().addClass("ratings_vote");
		$(this).nextAll().removeClass("ratings_vote");
		vote=4;
	});
	
	$("#star5").click(function(){
		$(this).prevAll().andSelf().addClass("ratings_vote");
		$(this).nextAll().removeClass("ratings_vote");
		vote=5;
	});
	
	
	$("#down").click(function(){var issue= $("input:[name=issname]").val();
	alert('issue name is: '+issue);
	$.get("UpdateDownloadCountServlet");
	});
	
	
	
});

function nextComment(){
	//alert('in next comment');
	
	/*$.get("CommentFetchServlet",{VID:vid},function(data){
			//commArray=data;
			var j;
			length=data.length;
			//alert('length of data: '+length);
			for(j=0;j<length;j++){
				CONTENT[j]=(data[j].content);
 				author[j]=data[j].author;
 				comm_id[j]=(data[j].comm_id)
 				date[j]=(data[j].date);
			}
			//alert(date);
			sets_of_comments=Math.floor(length/4);
 			//alert("SETS OF 4 COMMENTS: "+sets_of_comments);
 			if((length%4)>0)
 				sets_of_comments=sets_of_comments+1;
 			//alert("SETS OF 4 COMMENTS: "+sets_of_comments);
 			//alert("The number of comments:" + data.length);
			
	},"json");*/
	
	current_set_of_comments=current_set_of_comments+1;
	var final_comm='';
	var j=current_set_of_comments*4;
	var limit=j+4;
	if(limit>length){
		limit=length;
		//alert('limit after the checking: '+limit);
	}
	for(j;j<limit;j++){
		var url="<button id=\""+comm_id[j]+"\" onclick=\" repAbuse('"+comm_id[j]+"');\">REPORT ABUSE</button>";
		content="<hr><p><b><u>"+author[j]+"</u></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp"+date[j]+"<br>"+CONTENT[j]+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp"+url+"</p>";
		
		final_comm=final_comm+content;
			//alert(final_comm);
	}
	$("#actual_comments").html(final_comm);
	//current_set_of_comments=current_set_of_comments+1;
	//alert('current set:'+current_set_of_comments);
	$("#prev_comments").show();
	if(current_set_of_comments==sets_of_comments-1)
		$("#next_comments").hide();
		
	}

function prevComment(){
	
	//alert('in previous comment');
	/*$.get("CommentFetchServlet",{VID:vid},function(data){
		//commArray=data;
		var j;
		length=data.length;
		//alert('length of data: '+length);
		for(j=0;j<length;j++){
			CONTENT[j]=(data[j].content);
				author[j]=data[j].author;
				comm_id[j]=(data[j].comm_id)
				date.push[j]=(data[j].date);
		}
		alert(date);
		sets_of_comments=Math.floor(length/4);
			//alert("SETS OF 4 COMMENTS: "+sets_of_comments);
			if((length%4)>0)
				sets_of_comments=sets_of_comments+1;
			alert("SETS OF 4 COMMENTS: "+sets_of_comments);
			//alert("The number of comments:" + data.length);
		
},"json");*/
	var final_comm='';
	current_set_of_comments=current_set_of_comments-1;
	var j=(current_set_of_comments)*4;
	//alert('current set:'+current_set_of_comments+'  j: '+j);
	
	var limit=j+4;
	for(j;j<limit;j++){
		var url="<button id=\""+comm_id[j]+"\" onclick=\" repAbuse('"+comm_id[j]+"');\">REPORT ABUSE</button>";
		content="<hr><p><b><u>"+author[j]+"</u></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp"+date[j]+"<br>"+CONTENT[j]+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp"+url+"</p>";
		
		final_comm=final_comm+content;
			//alert(final_comm);
	}
	$("#actual_comments").html(final_comm);
	//alert('current set:'+current_set_of_comments);
	$("#next_comments").show();
	if(current_set_of_comments==0)
		$("#prev_comments").hide();



}



function submit_vote(VID){
	//alert('voted');
		$.post("VoteProcessorServlet",{VOTE_GIVEN:vote,vid:VID},function(response){
		//alert(response);
		$("#mother").fadeOut('slow');
		$("#rate_button").fadeOut('slow');
		$("#voting_done").fadeIn('slow');
		
			
		});
	return false;
}

function comment(vid,rid){
	var content=$("#comment").val();
	var viewer2=$("input:[name=viewer]").val();
	//alert('In Comment fnctn....VID: '+vid+" RID : "+ rid);
	var out_data={TXT:content,VID:vid,RID:rid};
	//alert('LENGTH BEFORE COMMENTING'+length);
	$.post("Comment",out_data,function(response,status){
		
			if(response=="bad"){
				alert('This comment is deemed unappropiate for public viewing because of the explicit choice of words');//------------------------->add
				$("#comment").val(''); // donot append it to div layer nd clear the comment box
				$("#feedback_layer").show('slow');
								}
			else{
			content="<hr><p><b><u>"+viewer2+"</u></b><br>"+content+"</p>";
			//alert(content);
			//alert('YOur comment has been successfully posted');
			$("#comment").val("");
			
			$.get("CommentFetchServlet",{VID:vid},function(data){
	 			//commArray=data;
	 			var j;
	 			length=data.length;
	 			//alert('length of data: '+length);
	 			for(j=0;j<length;j++){
	 				CONTENT[j]=(data[j].content);
	 				author[j]=data[j].author;
	 				comm_id[j]=(data[j].comm_id)
	 				date[j]=(data[j].date);
	 			}
	 			
	 			//alert('LENGTH AFTER COMMENTING'+length);
	 			
	 			sets_of_comments=Math.floor(length/4);
	 			//alert("SETS OF 4 COMMENTS: "+sets_of_comments);
	 			if((length%4)>0)
	 				sets_of_comments=sets_of_comments+1;
	 			//alert("SETS OF 4 COMMENTS: "+sets_of_comments);

//-------------------------------------------------------------------------------------------------------------
//------------WHENEVER THE COMMENTS ARE RELOADED CHK TO SEE WHEATHER TO GIVE THE NEXT BUTTON OR NOT------------
	 			if(sets_of_comments <=1) {
	 				//alert('in prev next if');
	 				$("#next_comments").hide();
	 				$("#prev_comments").hide();
	 			}
	 			else{
	 				$("#prev_comments").show();
	 				$("#next_comments").hide();
	 				
	 			}
//---------------------------------------------------------------------------------------------------------------	 			

	 			var i;
	 			i=(sets_of_comments-1)*4;
	 			current_set_of_comments=sets_of_comments-1;
	 			var limit=length;
	 			var final_comment='';
	 			
	 			//alert("the value of i:"+i+" limit : "+ limit);
	 			for(i;i<length;i++){
	 			
	 				var url="<button name=\""+i+"\" onclick=\" repAbuse('"+comm_id[i]+"');\">REPORT ABUSE</button>";
	 				content="<hr><p><b><u>"+author[i]+"</u></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp"+date[i]+"<br>"+CONTENT[i]+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp"+url+"</p>";
	 				final_comment=final_comment+content;
	 			
	 			}
	 			$("#actual_comments").html(final_comment);
					
			
		});
			}
});
	return false;
}
	

function repAbuse(comm_id){
	//alert('report abuse clicked..comm_id'+comm_id);
	$.get("CommentReport",{comm_id:comm_id},function(){
	var sel="#"+comm_id;
	//alert(sel);
		$(sel).hide('slow');
	});
	return false;
	}
function next(file_name,total_pages){
	
	   //alert('next clicked');
	   var pattern=/(\/page[0-9]+)/;
	   total_pageno=total_pages;
		
			if(current_page <=total_pages-1){
			current_page=current_page+1;
			var next_page='/page'+current_page;
			
			var result=pattern.exec(file_name);
			
			file_name=file_name.replace(RegExp.$1,next_page);
			
			if(current_page==total_pageno){
 				$("#next_button").hide();
 				$("#prev_button").show();
			}
 			else{
  				$("#next_button").show();
			
			$("#prev_button").show();
 			}
			
			load_image(file_name);
			}
		else{
			alert('ERROR. U have reached the end of the document.');
			
		}
return false;
}

function prev(file_name,total_pages){
		
		var pattern=/(\/page[0-9]+)/ ;
		
		if(current_page >=1){
			current_page = current_page-1;
			var next_page='/page'+current_page;
		
			var result=pattern.exec(file_name);
			
			file_name=file_name.replace(RegExp.$1,next_page);
			
			if(current_page==1){
				$("#prev_button").hide();
				$("#next_button").show();
			}
			else{
				$("#prev_button").show();
				$("#next_button").show();
			}
			
			load_image(file_name);
			}
		else{
			alert('ERROR');
			
		}

return false;
}		
		
function load_image(file_name){	

	//alert(file_name);
	var image=new Image();
	$(image).load(function(){
			
		$("#article").replaceWith(this);
			
	}).attr({"src":file_name,"width":860 ,"height":1056,"id":"article"});

	return false;
}


	