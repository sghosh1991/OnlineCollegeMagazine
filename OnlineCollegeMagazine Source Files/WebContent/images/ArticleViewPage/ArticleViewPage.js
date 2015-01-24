var vote=0;
var current_page=1;                 
var total_pageno;
$(function(){
alert('HI');
$("#voting_done").hide();
 $("#prev_button").hide();
 $("#feedback_layer").hide();
 $("#mother").show();
 alert('total Pages' +$("#totalpage").val());
 if($("#totalpage").val()=="1")
 $("#next_button").hide();
 else
  $("#next_button").show();
 
	

                                       // code for rating stars begins
 
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
 
 	
function submit_vote(VID){
		alert('voted');
 		$.post("VoteProcessorServlet",{VOTE_GIVEN:vote,vid:VID},function(response){
 		alert(response);
 		$("#mother").fadeOut('slow');
 		("#voting_done").fadeIn('slow');
 		
 			
 		});
 	return false;
 }
 		});									   // code for rating stars ends
 
 
 function next(file_name,total_pages){
		
	   var pattern=/(\/page[0-9]+)/ ;
	   total_pageno=total_pages;
		
			if(current_page <=total_pages-1){
			current_page=current_page+1;
			var next_page='/page'+current_page;
			
			var result=pattern.exec(file_name);
			
			file_name=file_name.replace(RegExp.$1,next_page);
			
			if(current_page==total_pageno)
 				$("#next_button").hide();
 			else
  				$("#next_button").show();
			
			$("#prev_button").show();
			
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
			current_page=current_page-1;
			var next_page='/page'+current_page;
		
			var result=pattern.exec(file_name);
			
			file_name=file_name.replace(RegExp.$1,next_page);
			
			f(current_page==1)
 				$("#prev_button").hide();
 			else
  				$("#prev_button").show();
			
			load_image(file_name);
			}
		else{
			alert('ERROR');
		}

return false;
}		
		
function load_image(file_name){	

 	alert(file_name);
 	var image=new Image();
	$(image).load(function(){
			
			$("img").replaceWith(this);
			
	}).attr("src",file_name);
	return false;
}

function comment(vid,rid){
		var content=$("#comment").val();
		alert(content);
		alert('VID: '+vid+" RID : "+ rid);
		var out_data={TXT:content,VID:vid,RID:rid};
		$.post("Comment",out_data,function(response,status){
			
				if(response=="bad"){
					alert('This comment is deemed unappropiate for public viewing because of the explicit choice of words');//------------------------->add
					$("#comment").val(""); // donot append it to div layer nd clear the comment box
					$("#feedback_layer").show('slow');
									}
				else{
				content="<p>"+content+"</p>";
				$("#comment_layer #last_com:last").append(content).fadeIn("slow");
				$("#comment").val(""); //----------------------------------------------->add
					}			
				
			});
	return false;
	}