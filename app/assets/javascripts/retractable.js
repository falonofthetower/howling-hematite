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
function hideThanks() {
  if((window.location.href.indexOf("thanks") != -1) || (/thanks/.test(self.location.href))) {
    unhide($("#thank-you"));
  } else {
    hide($("#thank-you"));
  }
}

function unhideUrlTag(tagname) {
  if((window.location.href.indexOf(tagname) != -1)) {
    unhide($(tagname));
  }
}

$(window).load(function() {
  $("article.retractable h1").hover(
    function() {
      $(this).parent().parent().addClass("hovering"); },
    function() {
      $(this).parent().parent().removeClass("hovering");
    });
  $("article.retractable h1").click(function() { toggleHidden($(this).parent()); });
  $("article.retractable section h1").click(function() { toggleHidden($(this).parent().parent()); });
  $("article.retractable.entire-retract").click(function() { toggleHidden($(this)); });
  toggleHidden($("#privacy-statement"));
  $("#reveal-privacy").click(function() { toggleHidden($("#privacy-statement")); });
  toggleHidden($("#terms-of-use"));
  $("#reveal-terms-of-use").click(function() { toggleHidden($("#terms-of-use")); });
  toggleHidden($("#disclaimer"));
  $("#reveal-disclaimer").click(function() { toggleHidden($("#disclaimer")); });
  toggleHidden($("#contact-us"));
  $("#reveal-contact-info").click(function() { toggleHidden($("#contact-us")); });
  hide($(".start-hidden"));
  unhideUrlTag("#privacy-statement");
  unhideUrlTag("#disclaimer");
  unhideUrlTag("#terms-of-use");
  unhideUrlTag("#contact-us");
});