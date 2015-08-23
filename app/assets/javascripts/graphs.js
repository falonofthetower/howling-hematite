function toLocaleStringSupportsLocales() {
  var number = 0;
  try {
    number.toLocaleString("i");
  } catch (e) {
    return e.name === "RangeError";
  }
  return false;
}

function toLocaleStringSupportsOptions() {
  return !!(typeof Intl == "object" && Intl && typeof Intl.NumberFormat == "function");
}

function toCurrencyString(amount) {
  var currency = amount;
  if(toLocaleStringSupportsLocales() && toLocaleStringSupportsOptions()) {
    currency = Number(amount).toLocaleString("en-US",
                                             {style: "currency",
                                              currency: "USD",
                                              minimumFractionDigits: 2,
                                              maximumFractionDigits: 2});
  }
  return currency;
}

/* TODO: Update this to pull the data dynamically, not just on load. */
function displayDonations() {
  d3.xml("donations.xml", "application/xml", function(error, data) {
    var data_total = Number(data.documentElement
                                .getElementsByTagName("total")
                                .item(0)
                                .textContent)
                   + 9578942515.2; // add this to total for testing
    var donorTotal = Number(data.documentElement
                                .getElementsByTagName("total_number_of_donors")
                                .item(0)
                                .textContent)
    + 4568;

    d3.selectAll(".donation-amount")
      .text("")
      .transition()
      .duration(4000)
      .tween("text", function(d) {
        var last = 0;
        var i = d3.interpolate(last, data_total);
        return function(t) { this.textContent = toCurrencyString(i(t))};
      });
    
    d3.selectAll(".donation-donors")
      .text("")
      .transition()
      .duration(4000)
      .tween("text", function(d) {
        var last = 0;
        var i = d3.interpolate(last, donorTotal);
        return function(t) { this.textContent = Math.round(i(t))};
      });
  });
};

