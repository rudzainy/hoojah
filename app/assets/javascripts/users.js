$("body").on("click", ".tab", function(e) {
	$(".active").removeClass("active");
	$(this).addClass("active");
	$($(this).children("a").attr("href")).addClass("active");
});