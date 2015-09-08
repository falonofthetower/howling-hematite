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
    .attr("r", 5)
    .style("fill", "black");

  var message = animgroup.append("text")
    .attr("text-anchor", "middle")
    .attr("font-size","2px")
    .attr("dy",2)
    .style("fill", "white")
    .text("Processing...");

  var secgroup = animgroup.append("g").attr("id", "secgroup");

  var circletwo = secgroup.append("circle")
    .attr("r", 5)
    .attr("cy", 0)
    .style("fill", "white");

  function circleAnimate() {
    secgroup.transition().duration(transitionDuration * 0.5).attr("transform","rotate(90)").ease("linear");
    secgroup.transition().delay(transitionDuration * 0.5).duration(transitionDuration * 0.5).attr("transform","rotate(180)").ease("linear");
    secgroup.transition().delay(transitionDuration * 1.0).duration(transitionDuration * 0.5).attr("transform","rotate(270)").ease("linear");
    secgroup.transition().delay(transitionDuration * 1.5).duration(transitionDuration * 0.5).attr("transform","rotate(360)").ease("linear");
    secgroup.transition().delay(transitionDuration * 2).duration(0).attr("transform","rotate(0)");

    circle.transition().duration(transitionDuration).style("fill", "black").attr("r",75).ease("bounce");
    message.transition().duration(transitionDuration).ease("bounce").attr("font-size","24px").attr("dy",6);
    circletwo.transition().duration(transitionDuration).attr("r",15).attr("cy", 75).ease("bounce");


    circle.transition().delay(transitionDuration).duration(transitionDuration).style("fill", "limegreen").attr("r",30).ease("cubic");
    circletwo.transition().delay(transitionDuration).duration(transitionDuration).attr("r",5).attr("cy",30).ease("cubic");
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