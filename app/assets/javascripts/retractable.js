function toggleHidden(header) {
  if(header.hasClass("collapsed")) {
    unhide(header);
  } else {
    hide(header);
  }
}
function hide(header) {
  if(typeof header === "object") {
    header.addClass("collapsed");
    header.children("section").hide();
      if(header.hasClass("all-hidden") || header.hasClass("content-primary")) {
         header.hide();
      }

  }
}
function unhide (header) {
  if(!(typeof header === "object")) { return; }
  header.children("section").show();
    header.removeClass("collapsed");
    if(header.hasClass("all-hidden") || header.hasClass("content-primary")) {
       header.show();
    }

}

function unhideUrlTag(tagname) {
  if((window.location.href.indexOf(tagname) != -1)) {
    unhide($(tagname));
  } else {
    hide($(tagname));
  }
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

function hideLegal() {
  toggleHidden($("#privacy-statement"));
  toggleHidden($("#terms-of-use"));
  toggleHidden($("#disclaimer"));
  toggleHidden($("#contact-us"));
  unhideUrlTag("#privacy-statement");
  unhideUrlTag("#disclaimer");
  unhideUrlTag("#terms-of-use");
  unhideUrlTag("#contact-us");
}

function hideContentPrimary() {
  hide($(".content-primary"));
}

function showContentPrimary() {
  unhide($(".content-primary"));
}

function pageLoadHideInfo() {
  hide($("#info"));
  hide($("#conceal-info"));
  hide($("#reveal-info"));
  unhideUrlTag("#info");
  if((window.location.href.indexOf("#info") != -1)) {
    hide($("#reveal-info"));
    unhide($("#conceal-info"));
    hideContentPrimary();
  } else {
    unhide($("#reveal-info"));
    hide($("#conceal-info"));
    showContentPrimary();
  }
}

function hideInfo() {
  hide($("#info"));
  unhide($("#reveal-info"));
  hide($("#conceal-info"));
  showContentPrimary();
  console.log("hide info");
  //location.href = "#";
}

function showInfo() {
  unhide($("#info"));
  unhide($("#conceal-info"));
  hide($("#reveal-info"));
  hideContentPrimary();
  location.href = "#info";
}

$(window).load(function() {


  hide($(".start-hidden"));

  $("article.retractable h1").hover(
    function() {
      $(this).parent().parent().addClass("hovering"); },
    function() {
      $(this).parent().parent().removeClass("hovering");
    });
  $("article.retractable h1").click(function() { toggleHidden($(this).parent()); });
  $("article.retractable section h1").click(function() { toggleHidden($(this).parent().parent()); });
  $("article.retractable.entire-retract").click(function() { toggleHidden($(this)); });
  $("article.retractable.entire-retract section h1").click(function() { toggleHidden($(this).parent().parent()); });
  $("#reveal-privacy").click(function() { toggleHidden($("#privacy-statement")); });
  $("#reveal-terms-of-use").click(function() { toggleHidden($("#terms-of-use")); });
  $("#reveal-disclaimer").click(function() { toggleHidden($("#disclaimer")); });
  $("#reveal-contact-info").click(function() { toggleHidden($("#contact-us")); });

  $("#reveal-info").click(function() {
    if(Modernizr.history) {
      history.pushState(null, "", "#info");
    }
    showInfo();
  });

  $("#conceal-info").click(function() {
    if(Modernizr.history) {
      history.pushState(null, "", "/");
    }
    hideInfo();
  });
});