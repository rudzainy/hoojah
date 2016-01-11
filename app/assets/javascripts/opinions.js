$(document).ready(function(){

	$('#unsplash-search-box').hide();

	$('.search-button').click(function(event){
		event.preventDefault();
		var search = $('.search-box').val();
		$('.search-result-box').empty();

		$.ajax({
			url: '/opinions/query_image',
			method: 'POST',
			data: { search: search }
		}).done(function(response){
			// $('.spinner').hide();

			response.forEach(function(image){
				$('.search-result-box').append('<div class="unsplash-thumb"><img class="unsplash-result" src="' + image.thumb + '" name="' + image.regular + '"><br><br>');
			})
		})
	});

	$(document).on('click', '.unsplash-result', function(event){
		// event.preventDefault();
		var image_address = $(this).attr('name');
		$('.image-link').attr('value', image_address);
		$('.image-placeholder').html(image_address);
		$('#unsplash-search-box').hide();
	})
})

