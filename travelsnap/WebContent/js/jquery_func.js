/*
    grey screen functions
    make sure you have #screen and #screen-box and #restore in the html
*/
function triggerPopOut(width, height)
{
    $("#screen").css({
    	"display": "block",
		"width": $(document).width(),
		"height": $(document).height(),
		opacity: .7,
	});

	$("#screen-box").css({
		"display": "block",
		"width": width,
		"height": height,
		"margin-top": -(height / 2),
		"margin-left": -(width / 2),
	});
	return false;
}

$( function()
{
    $("#restore").on( "click", function()
	{
		$("#screen").css({
			"display": "none",
			"width": 0,
			"height": 0,
			opacity: 0,
		});

		$("#screen-box").css({
			"display": "none",
			"width": 0,
			"height": 0,
			"margin-top": 0,
			"margin-left": 0,
		});
        $("#screen-box").load("loading.html");
	});
});
