function toggleHidden(header) {
  if(header.hasClass("collapsed")) {
    header.children("section").removeClass("hidden");
    if(header.hasClass("all-hidden")) {
       header.removeClass("hidden");
    }
    header.removeClass("collapsed");
  } else {
    header.children("section").addClass("hidden");
    if(header.hasClass("all-hidden")) {
       header.addClass("hidden");
    }
    header.addClass("collapsed");
  }
}

$(window).load(function() {
  $("article.retractable").click(function() { toggleHidden($(this)); });
  toggleHidden($("#privacy-statement"));
  $("#reveal-privacy").click(function() { toggleHidden($("#privacy-statement")); });
  toggleHidden($("#terms-of-use"));
  $("#reveal-terms-of-use").click(function() { toggleHidden($("#terms-of-use")); });
  toggleHidden($("#disclaimer"));
  $("#reveal-disclaimer").click(function() { toggleHidden($("#disclaimer")); });

});