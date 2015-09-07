function braintree_setup() {
  braintree.setup(gon.client_token, "custom", {
    id: "payment-form",
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
            $("#card-number").addClass("card-image-" + event.card.type);
            console.log(card_image);
          }
        }
      }
    }
  });
}
$(document).ready(function() {
  braintree_setup();
});
