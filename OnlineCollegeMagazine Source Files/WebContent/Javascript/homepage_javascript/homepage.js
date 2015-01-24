var type;

$(function(){


$('#ca-container').contentcarousel();
$( "#searchButton" ).button();
/* ON LOAD AUTOCOMPLETE */
type=$("input:radio:checked").val();
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


	
	/* IMAGE SLIDER CODE */
	
	 // find the elements to be eased and hook the hover event
	/*  $('div.jimgMenu ul li a').hover(function() {
	    // if the element is currently being animated (to a easeOut)...
		  if ($(this).is(':animated')) {
		  $(this).stop().animate({width: "310px"}, {duration: 650, easing:"easeOutQuad"});
		  } else {
		// ease in quickly
			$(this).stop().animate({width: "310px"}, {duration: 600, easing:"easeOutQuad"});
		}
		}, function () {
		// on hovering out, ease the element out
		if ($(this).is(':animated')) {
			$(this).stop().animate({width: "78px"}, {duration: 600, easing:"easeInOutQuad"})
		} else {
		// ease out slowly
			$(this).stop('animated:').animate({width: "78px"}, {duration: 650, easing:"easeInOutQuad"});
		}
	});*/
	

	/*CODE FOR AUTOCOMPLETE */
	
	$("input:radio").click(function(){
	type=$(this).val();
	//alert(type);
	
	$("input:text[name=searchString]").attr("id",type);
	$("#keyword").html("xxxx");
	
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