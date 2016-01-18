
$(document).ready(function(){
	$(".opinion_image").waitForImages(function(){
		$(function() {
			var wall = new Freewall("#opinions");
			wall.fitWidth();
			wall.reset({
				selector: '.box',
				animate: true,
				cellW: 300,
				cellH: 'auto',
				onResize: function() {
					wall.fitWidth();
				}
			});
		});
	});
	
	$('#unsplash-search-box').hide();
	
	$('#upload-image').on('click', function(){
		$('#unsplash-search-box').hide();
		$('#image-box').html('<input type="file" name="opinion[image]">')
	});

	$('#search-image').on('click', function(){
		$('#unsplash-search-box').show();
		$('#image-box').html('<input type="hidden" name="opinion[image]" class="image-link">')
	});

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

