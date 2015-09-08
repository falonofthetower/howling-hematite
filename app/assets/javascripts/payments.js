function braintree_setup() {
  braintree.setup(gon.client_token, "custom", {
    /*
    onPaymentMethodReceived: function (result) {
      $("div.overlay").removeClass("invisible");
      addProgressIndicator();
      document.forms[0].submit();
    },
    */
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
          if(event.isValid) {
            switch(event.target.fieldKey) {
              case "number":
                $("#donation-form-submit-button").addClass("validation-braintree-valid-number");
                break;
              case "cvv":
                $("#donation-form-submit-button").addClass("validation-braintree-valid-cvv");
                break;
              case "expirationDate":
                $("#donation-form-submit-button").addClass("validation-braintree-valid-date");
                break;
            }
          } else {
            switch(event.target.fieldKey) {
              case "number":
                $("#donation-form-submit-button").removeClass("validation-braintree-valid-number");
                break;
              case "cvv":
                $("#donation-form-submit-button").removeClass("validation-braintree-valid-cvv");
                break;
              case "expirationDate":
                $("#donation-form-submit-button").removeClass("validation-braintree-valid-date");
                break;
            }
          }



          if(event.card) {
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
