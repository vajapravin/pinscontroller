
$(document).ready(function(){
	$(".chzn-select").chosen({default_multiple_text: 'Choose categories'});
	$(".like-this-post").click(function(){
		vote = $(this).attr("data-vote-type");
		user_id = $(this).attr("data-user-id");
		product_id = $(this).attr("data-product-id");
		$.ajax({
	        url : "/api/products/"+product_id+"/vote_by",
	        type : "POST",
	        dataType: 'json',
	    	data : "user_id=" + user_id + "&vote=" + vote,
	        success : function(data) {
        		// $("#"+product_id+"-like-this-post-"+vote).attr({"data-vote":data.is_liked});
        		// $("#"+product_id+"-like-this-post-"+vote).html(vote_icon(data.is_liked));
        		$("#"+product_id+"-like-this-post-down").next("span").html(data.total_votes);
	        },
	        error : function(xhr, ajaxOptions, thrownError) {
	            alert(thrownError + ". Please try after sometime");
	        }
	    });
	});
	vote_icon = function(vote){
		if(vote=="like")
			return '<i class="fa fa-heart"></i>'
		else
			return '<i class="fa fa-heart-o"></i>'

	}
	$('.search-txt').keypress(function (e) {
	  if (e.which == 13)
	    $(this).closest('form').submit();
	});
});