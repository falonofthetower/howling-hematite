function braintree_setup() {
  braintree.setup(gon.client_token, "custom", {
    id: "payment-form",
    hostedFields: {
      number: {
        selector: "#card-number"
      },
      cvv: {
        selector: "#cvv"
      },
      expirationDate: {
        selector: "#expiration-date"
      }
    }
  });
}
$(document).ready(function() {
  braintree_setup();
});
