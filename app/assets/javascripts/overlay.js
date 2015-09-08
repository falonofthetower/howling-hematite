function addProgressIndicator() {
  var width = 300, height = 300, twoPI = 2 * Math.PI, progress = 0, total = 10000, formatPercent = d3.format(".0%");
/*
  var arc = d3.svg.arc().startAngle(0), innerRadius(180), .outerRadius(240);

  var svg = d3.select("div.overlay").append("svg")
  .attr("width", width)
  .attr("height", height)
  .append("g")
  .attr("transform", "translate(" + width / 2 + "," + height / 2 +")");

  var meter = svg.append("g")
  .attr("class", "progress-meter");

  meter.append("path")
  .attr("class", "background")
  .attr("d", arc.endAngle(twoPI));
*/

  var transitionDuration = 1500;
  var cAnim;

  var svg = d3.select("div.overlay").append("svg")
  .attr("width", width)
  .attr("height", height);
  //.attr("transform", "translate(" + width / 2 + "," + height / 2 +")");

  var animgroup = svg.append("g").attr("id", "animgroup")
    .attr("transform", "translate(" + width / 2 + "," + height / 2 +")");

  var circle = animgroup.append("circle")
    .attr("r", 30)
    .style("fill", "limegreen");

  var message = animgroup.append("text")
    .attr("text-anchor", "middle")
    .attr("font-size","8px")
    .attr("dy",2)
    .text("Processing...");

  function circleAnimate() {
    circle.transition().duration(transitionDuration).style("fill", "cyan").attr("r",75).ease("bounce");
    message.transition().duration(transitionDuration).ease("bounce").attr("font-size","24px").attr("dy",6);
    circle.transition().delay(transitionDuration).duration(transitionDuration).style("fill", "limegreen").attr("r",30).ease("cubic");
    message.transition().delay(transitionDuration).duration(transitionDuration).ease("cubic").attr("font-size","8px").attr("dy",2);

  }
  function startAnimation() {
    circleAnimate();
    cAnim = setInterval(circleAnimate, transitionDuration * 2);
  }
  function stopAnimation() {
    clearInterval(cAnim);
  }
  //circleAnimate();
  startAnimation();
}