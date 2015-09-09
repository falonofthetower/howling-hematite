function toggleHidden(header) {
  if(header.hasClass("collapsed")) {
    unhide(header);
  } else {
    hide(header);
  }
}
function hide(header) {
  if(typeof header === "object") {
    header.children("section").addClass("hidden");
      if(header.hasClass("all-hidden")) {
         header.addClass("hidden");
      }
      header.addClass("collapsed");
  }
}
function unhide (header) {
  if(!(typeof header === "object")) { return; }
  header.children("section").removeClass("hidden");
    if(header.hasClass("all-hidden")) {
       header.removeClass("hidden");
    }
    header.removeClass("collapsed");
}

function revealThankYou() {
  unhide($("#thank-you"));
}

$(window).load(function() {
  $("article.retractable section h1").hover(
    function() {
      $(this).parent().parent().addClass("hovering"); },
    function() {
      $(this).parent().parent().removeClass("hovering");
    });
  $("article.retractable h1").click(function() { toggleHidden($(this).parent().parent()); });
  toggleHidden($("#privacy-statement"));
  $("#reveal-privacy").click(function() { toggleHidden($("#privacy-statement")); });
  toggleHidden($("#terms-of-use"));
  $("#reveal-terms-of-use").click(function() { toggleHidden($("#terms-of-use")); });
  toggleHidden($("#disclaimer"));
  $("#reveal-disclaimer").click(function() { toggleHidden($("#disclaimer")); });
  toggleHidden($("#contact-us"));
  $("#reveal-contact-info").click(function() { toggleHidden($("#contact-us")); });
  hide($(".start-hidden"));

});