var main_height = $('main').height();

// Scroll the donation box so it's always in view
function scrollHandler(event) {
  var w = $(window).width();
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

$(window).scroll(scrollHandler);
$(window).resize(scrollHandler);