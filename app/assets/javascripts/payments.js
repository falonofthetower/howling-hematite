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
          "color":"blue"
        },
        "card-number": {"background-color":"blue"}

      }
    }
  });
}
$(document).ready(function() {
  braintree_setup();
});
