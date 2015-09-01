/* Scrolling */

var main_height = $("main").height();

function checkScrollingSupport() {
  if($(window).width() > 600) {
    $("main").addClass("support-scrolling");
    return true;
  } else {
    $("main").removeClass("support-scrolling");
    return false;
  }
};

// Scroll the donation box so it's always in view
function scrollHandler(event) {
  if(!(checkScrollingSupport())) {
    return;
  }
  var h = $("main").height();
  var sTop = $(window).scrollTop() - 95;
  //console.log(sTop);
  var dBox = $(".donations");
  var boundedScroll = Math.max(55, Math.min(sTop, (h - dBox.outerHeight(true))));
  //console.log((h - dBox.outerHeight(true)));
  //console.log(boundedScroll);

  if(0 > (h - dBox.outerHeight(true))) {
    return;
  }

  dBox.animate({top: boundedScroll},
               40,
               function () {});
};

$(window).load(function() {
  scrollHandler();
  $(window).scroll(scrollHandler);
  $(window).resize(scrollHandler);
});


var formMessagesOn = {
  "Full Name" : "⚠ A name is required (can be 'anonymous')",
  "Email Address" : "⚠ We need your email address so we can send your receipt"
}
var formMessagesOff = {
  "⚠ A name is required (can be 'anonymous')" : "Full Name ✓",
  "⚠ We need your email address so we can send your receipt" : "Email Address ✓"
}

/* Validation */
function addWarning(event, severity) {
  if((severity != "warning") && (severity != "error")) {
    return;
  }
  $(event.target).addClass(severity);
  var label = $(event.target).parent().find("label");
  /*
  var old_text = ""
  old_text = label.text();
  if(old_text in formMessagesOn) {
    label.text(formMessagesOn[old_text]);
  }*/
  label.find("span").remove();
  label.append(" <span class='warning'>" + formMessagesOn[label.text()] + "</span>");

  //label.addClass(severity);

  console.log("warn");
}

function removeWarning(event, severity) {
  if((severity != "warning") && (severity != "error")) {
    return;
  }
  $(event.target).removeClass(severity);
  var label = $(event.target).parent().find("label");
  label.find("span").remove();
  label.removeClass(severity);
}

function validateField(event) {
  //addWarning(event, "warning");
  removeWarning(event, "warning");
}

// Check for validation when losing focus
$(window).load(function() {
  $("input.form-control").blur(function(event) {
    validateField(event);
  });
  $("div.return").click( function() {
    document.body.scrollTop = document.documentElement.scrollTop = 0;
  });
});


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

/* Slideshows */

/*


var jssor_slider_test;

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
                 $BulletNavigatorOptions: {
                   $Class: $JssorBulletNavigator$,
                   $ChanceToShow: 2,
                   $AutoCenter: 1,
                   $SpacingX: 10,
                   $SpacingY: 10
                 },
                  $FillMode: 2
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