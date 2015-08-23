var main_height = $('main').height();

var scrolling_support = false;
function checkScrollingSupport() {
  if($(window).width() > 600) {
    $("main").addClass("support-scrolling");
    scrolling_support = true;
  }
}

// Scroll the donation box so it's always in view
function scrollHandler(event) {
  checkScrollingSupport();
  var h = $("main").height();
  var s_top = $(window).scrollTop();
  var d_box = $(".donations");
  var bounded_scroll = Math.max(55, Math.min(s_top, h - d_box.outerHeight(true)));

  if(0 > (h - d_box.outerHeight(true))) {
    return;
  }

  d_box.animate({top: bounded_scroll},
               50,
               function () {});
}

$(window).load(scrollHandler);
$(window).scroll(scrollHandler);
$(window).resize(scrollHandler);