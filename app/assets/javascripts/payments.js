function braintree_setup() {
  braintree.setup(gon.client_token, "custom", {
    id: "payment-form",
    paypal: {
      container: "paypal-button"
    },
    hostedFields: {
      number: {
        selector: "#card-number",
        placeholder: "Card Number"
      },
      cvv: {
        selector: "#cvv-number",
        placeholder: "CVV"
      },
      expirationDate: {
        selector: "#expiration-date",
        placeholder: "MM/YYYY"
      },
      styles: {
        "input": {
          "font-size:":"36pt",
          "font-family":"'Courier New', Courier, 'Lucida Sans Typewriter', 'Lucida Typewriter', monospace"
        },
        ":focus": {
          "color":"blue",
          "font-weight":"bold"
        }
      },
      onFieldEvent: function(event) {
        if(event.type === "fieldStateChange") {
          console.log(event.isValid);
          if(event.card) {
            console.log(event.card.type);
            $("#card-number").removeClass("card-image-visa card-image-diners-club card-image-discover card-image-jcb card-image-maestro card-image-master-card card-image-paypal card-image-american-express card-unionpay");
            switch (event.card.type) {
              case "visa":
                $("#card-number").addClass("card-image-visa");
                break;
              case "diners-club":
                $("#card-number").addClass("card-image-diners-club");
                break;
              case "discover":
                $("#card-number").addClass("card-image-discover");
                break;
              case "jcb":
                $("#card-number").addClass("card-image-jcb");
                break;
              case "maestro":
                $("#card-number").addClass("card-image-maestro");
                break;
              case "master-card":
                $("#card-number").addClass("card-image-master-card");
                break;
              case "paypal":
                $("#card-number").addClass("card-image-paypal");
                break;
              case "american-express":
                $("#card-number").addClass("card-image-american-express");
                break;
              case "unionpay":
                $("#card-number").addClass("card-image-unionpay");
                break;
            }
          }
        }
      }
    }
  });
}
$(document).ready(function() {
  braintree_setup();
});
