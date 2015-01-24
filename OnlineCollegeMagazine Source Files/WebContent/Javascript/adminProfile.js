var type; 
$(function(){
				$("#hide1").hide();
                $("#download1").hide();
               $("#b1").click(function(){
                   
                   $.get("CategoryAverageRating",function(){
                   var image=new Image();
                        $(image).load(function(){
                       
                     
                $("#img1").replaceWith(this);
                 
                $("#pic1").slideDown();
               
                $("#hide1").show();
                
                $("#download1").show();
                  }).attr("src","TemporaryReport/Image1.jpg");
                  });
               });
               
               
            
            $("#hide1").click(function(){
               
                $("#pic1").slideUp();
                $("#hide1").hide();
                $("#download1").hide();
            });
    

});
			$(function(){
                $("#hide2").hide();
                $("#download2").hide();
               $("#b2").click(function(){
                   
                   $.get("CategoryRejectionRate",function(){
                   var image=new Image();
                        $(image).load(function(){
                       
                     
                $("#img2").replaceWith(this);
                 
                $("#pic2").slideDown();
               
                $("#hide2").show();
                
                $("#download2").show();
                
                  }).attr("src","TemporaryReport/Image2.jpg");
                  });
               });
               
               
            
            $("#hide2").click(function(){
               
                $("#pic2").slideUp();
                $("#hide2").hide();
                $("#download2").hide();
            });
    

});
				$(function(){
				$("#restorestatus").hide();
				$("#hide3").hide();
                $("#download3").hide();
               $("#b3").click(function(){
                   
                   $.get("ModeratorActivityRate",function(){
                   var image=new Image();
                        $(image).load(function(){
                       
                     
                $("#img3").replaceWith(this);
                 
                $("#pic3").slideDown();
               
                $("#hide3").show();
                
                $("#download3").show();
                  }).attr("src","TemporaryReport/Image3.jpg");
                  });
               });
               
               
            
            $("#hide3").click(function(){
               
                $("#pic3").slideUp();
                $("#hide3").hide();
                $("#download3").hide();
            });
    
            /*CODE FOR AUTOCOMPLETE */

            type=$("input:radio:checked").val();
           // alert(type);
            $("input:text[name=searchString]").attr("id",type);


            $("#author").autocomplete({
            		source: "AutocompleteAuthorManager"
            	});

            $("input:radio").click(function(){
            	type=$(this).val();
            	//alert(type);
            	$("input:text[name=searchString]").attr("id",type);
            	
            	
            	$( "#author" ).autocomplete({
            			source: "AutocompleteAuthorManager"
            		});
            		
            	$( "#keyword" ).autocomplete({
            			source: "AutocompleteKeywordManager"
            		});
            	
            	$( "#articlename" ).autocomplete({
            		source: "AutocompleteArticleNameManager"
            	});
            });
            /*CODE FOR BACKUP*/
            $("#backup").click(function(){
			var waiting='<img src="images/RegistrationPage/loading.gif" /> Please do not press any button while Backup Operation is in progress...';
			$("#backupstatus").html(waiting);
			
			$.get("DatabaseBackupServlet",function(response){/*alert(response);*/if(response=="1"){
				var content="<b>Backup Succesful!</b>";
			}
			else{
				var content="<b>Backup Failed</b>";
			}
			$("#backupstatus").html(content);
			});
			});
            /*CODE FOR SLIDING RESTORE STATUS*/
            $("#restoreDB").click(function(){
            $("#restorestatus").slideToggle(1000);
            //$("#restoreDB").attr("disabled", "disabled");
            });	
            	
});
				/*CODE FOR RESTORE*/
	            function restoreOp(bName){
	            	var waiting='<img src="images/RegistrationPage/loading.gif" /> Please do not press any button while Restore Operation is in progress...';
	            	var content='<b>Restore Successful!</b>';
	            	$("#restorestatus").html(waiting);
	            	$.get("DatabaseRestoreServlet",{image:bName},function(response){
	            		$("#restorestatus").html(content);
	            	});
	            	}

				
				

