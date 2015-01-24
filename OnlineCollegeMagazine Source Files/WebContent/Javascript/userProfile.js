$(function(){
		//alert('hello');
		
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