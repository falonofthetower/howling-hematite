var main_height = $("main").height();

function checkScrollingSupport() {
  if($(window).width() > 600) {
    $("main").addClass("support-scrolling");
  } else {
    $("main").removeClass("support-scrolling");
  }
};

// Scroll the donation box so it's always in view
function scrollHandler(event) {
  checkScrollingSupport();
  var h = $("main").height();
  var sTop = $(window).scrollTop();
  var dBox = $(".donations");
  var boundedScroll = Math.max(55, Math.min(sTop, h - dBox.outerHeight(true)));

  if(0 > (h - dBox.outerHeight(true))) {
    return;
  }

  dBox.animate({top: boundedScroll},
               50,
               function () {});
};

$(window).load(scrollHandler);
$(window).scroll(scrollHandler);
$(window).resize(scrollHandler);