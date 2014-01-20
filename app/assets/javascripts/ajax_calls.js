$(document).ready(function(){
	$('.comment-link').on('click',commentForm);
});

function commentForm(event){
	event.preventDefault();
	console.log(this)
	var url = $(this).attr('href');
	var element = $(this);
	$.get(url, function(data){
		$(element).after(data)
	});
}