/* Slideshows */

var jssor_slider_test;


function videoSizing() {
  var allVideos = $("iframe")
  var newWidth = $("article.video").width();

	allVideos.each(function() {
		var $el = $(this);
		$el
			.width(newWidth)
			.height(newWidth * $el.data('aspectRatio'));
	});
}

function slideshowSizing(slider) {
  var shows = $("section.slideshow");
  var showsdiv = $("div.slideshow");
  var article = $("article.images");
  var articleWidth = article.width();

  if(slider) {
    if(articleWidth) {
      slider.$ScaleWidth(articleWidth);
      //jssorUtils.$SetStyleLeft(slider.$Elmt, articleWidth / 2);
      shows.each(function() {
        //$(this).height(slider.$ScaleHeight());
      });
    }
    //
  }
}

$(window).load(function(x) {
  var options = {$AutoPlay: true,
                 $DragOrientation: 1,
                 $SlideSpacing: 50,
                 $BulletNavigatorOptions: {
                   $Class: $JssorBulletNavigator$,
                   $ChanceToShow: 2,
                   $AutoCenter: 1,
                   $SpacingX: 10,
                   $SpacingY: 10
                 },
                 $ArrowNavigatorOptions: {
                   $Class: $JssorArrowNavigator$,
                   $ChanceToShow: 1,
                   $AutoCenter: 2
                 },
                  $FillMode: 4
                };
  jssor_slider_test = new $JssorSlider$("slideshow_test", options);

  function scaleSlider() {
    var parentWidth = jssor_slider_test.$Elmt.parentNode.clientWidth;
    var parentHeight = jssor_slider_test.$Elmt.parentNode.clientHeight;
    var imgHeight = $("div.slideshow img").height();

    if(parentWidth) {
      jssor_slider_test.$ScaleWidth(Math.min(parentWidth, 800));
      jssor_slider_test.$ScaleHeight(Math.min(parentHeight, 800));
      var shows = $("section.slideshow");
      shows.each(function() {
        //$(this).height(imgHeight);
      });
    } else {
      window.setTimeout(scaleSlider, 30);
    }
  }
  scaleSlider();

  //slideshowSizing(jssor_slider_test);
  $(window).bind("load", scaleSlider);
  $(window).bind("resize", scaleSlider);
  $(window).bind("orientationchange", scaleSlider);

})


/*
$(window).load(function() {
  var allVideos = $("iframe")
  var newWidth = $("main").width();

  allVideos.each(function() {
    $(this)
			.data('aspectRatio', this.height / this.width)
			.removeAttr('height')
			.removeAttr('width');
	});
  videoSizing();

  $(window).resize(videoSizing);
});
*/