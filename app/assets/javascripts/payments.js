function braintree_setup() {
  braintree.setup(gon.client_token, "custom", {id: "payment-form"});
}
$(document).ready(function() {
  braintree_setup();
});
