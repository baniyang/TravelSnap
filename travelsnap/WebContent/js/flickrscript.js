$(document).ready(function()
{
	//$window.onload(function(){
	$("#search").click(function(){
        $.getJSON("http://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?",
        {
          tags: $("#searchterm").val(),
          tagmode: "any",
          format: "json"
        },
        function(data) {
          $.each(data.items, function(i,item){
            //$("<img/>").attr("src", item.media.m).prependTo("#results");
        	  $("<img/>").attr({src:item.media.m,width:"200",height:"150"}).prependTo("#results");
            //$("img").attr({width:"50",height:"80"});
            if ( i == 10 ) return false;
          });
        });
    });
});