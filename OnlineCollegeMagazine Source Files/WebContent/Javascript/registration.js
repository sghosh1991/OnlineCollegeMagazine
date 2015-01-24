 var min_chars = 3;
 var type;
                var captcha_string;
		
		
		var characters_error = 'Minimum amount of chars is 3';
		var checking_html = '<img src="images/RegistrationPage/loading.gif" /> Checking...';
		
  $(function() {
   			$("#tip").hide();
  
   			
   				
   				
   				
   			
   			
   			
   			$.get("captcha",function(response,status){
                   		
                       captcha_string=response;
                   
                      });
        var image=new Image();
                        $(image).load(function(){
                                  
                    $("#capimage").replaceWith(this);
                      }).attr('src','images/CaptchaImage/captcha.png');
                      
                     
                 
                
		//when we move out of the email box...
		$('#email').change(function(){
			//run the character number check
			var email=$('#email').val();
			
			if($('#email').val().length < min_chars){
				//if it's bellow the minimum show characters_error text
				$('#username_availability_result').html(characters_error);
			}else{			
				//else show the cheking_text and run the function to check
				
				$('#username_availability_result').html(checking_html);
				check_availability();
			}
		});
		
                
                   
                   
                
                $("#captcha_str").change(function(){
                	//alert(captcha_string);
                  var x=$("#captcha_str").val()
                  if(captcha_string!=x){
                          //$("#submit").attr("disabled", "true");
                	  	  $("#captcha_str").val('');
                          $("#captcha_result").html("<small>Captcha is incorrect</small>");
                          $("#captcha_str").focus();
                          }   
                   if(captcha_string==x)
                   {
                       //alert("correct input!!");
                        //$("#submit").removeAttr("disabled");
                        $("#captcha_result").html("<small>Captcha is correct</small>");
                }  
                });
		
   

//function to check username availability	
function check_availability(){
		
		//get the username
		var email = $('#email').val();
		
		//use ajax to run the check
		$.post("EmailValidatorServlet", { email: email },
			function(result,status){
						
					
				if(result=="alr_reg"){
					
					$('#username_availability_result').html('<span class="is_not_available"><b>' +email + '</b> is already registered!</span>');
					$('#email').val('');
					$("#email").focus();
				}
				if(result=="available"){
					
					$('#username_availability_result').html('<span class="is_available"><b>' +email + '</b> is AVAILABLE!</span>');
				}
				
				if(result=="unavailable"){
					
					$('#username_availability_result').html('<span class="is_not_available"><b>' +email + '</b> is not a college member!</span>');
					$('#email').val('');
					$("#email").focus();
				}
		
	});

}  

$("#hlp").hover(function(){
                 $("#tip").show("slow");
                    },function(){
    $("#tip").hide();
  });




/*CODE FOR AUTOCOMPLETE */

type=$("input:radio:checked").val();
//alert(type);
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




    });