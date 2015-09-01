$(window).load(function() {
$("article.retractable").click(function() {
  header = $(this);
  if(header.data("collapsed") === true) {
    header.children("section").removeClass("hidden");
    header.data("collapsed", false);
  } else {
    header.children("section").addClass("hidden");
    header.data("collapsed", true);
  }
  console.log(header);
});
});