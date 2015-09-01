function toggleHidden(header) {
  if(header.data("collapsed") === true) {
    header.children("section").removeClass("hidden");
    if(header.hasClass("all-hidden")) {
       header.removeClass("hidden");
    }
    header.data("collapsed", false);
  } else {
    header.children("section").addClass("hidden");
    if(header.hasClass("all-hidden")) {
       header.addClass("hidden");
    }
    header.data("collapsed", true);
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