function braintree_setup() {
  braintree.setup(gon.client_token, "custom", {
    /*
    onPaymentMethodReceived: function (result) {
      $("#payment-form").submit();
      $("div.overlay").removeClass("invisible");
      addProgressIndicator();
    },*/
    id: "payment-form",
    paypal: {
      container: "paypal-button",
      onSuccess: function (nonce, email) {
        console.log(nonce, email);
        $("#donation-form-submit-button").prop("value","Donate with Paypal");
        $("#donation-form-submit-button span").prop("Donate with Paypal");
        $("#donation-form-submit-button").addClass("validation-paypal");
        $("#donation-form-submit-button").addClass("no-top-margin");
        $(".braintree-card").addClass("invisible-fields");
        $("div.paypal-group p").addClass("invisible-fields");
        $("div.paypal-group p").text("");
      },
      onCancelled: function () {
        $("#donation-form-submit-button").prop("value","Donate with Credit Card");
        $("#donation-form-submit-button span").prop("Donate with Credit Card");
        $("#donation-form-submit-button").removeClass("validation-paypal");
        $("#donation-form-submit-button").removeClass("no-top-margin");
        $(".braintree-card").removeClass("invisible-fields");
        $("div.paypal-group p").removeClass("invisible-fields");
        $("div.paypal-group p").text("OR pay with");
      },
      enableBillingAddress: true
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

function validateForm() {
  $("#payment-form").validate({
    onfocusout: function (element) {
      this.element(element);
    },
    rules: {
      "giver[first_name]": {
        required: true,
        minlength: 1
      },
      "giver[last_name]": {
        required: true,
        minlength: 1
      },
      "giver[amount]": {
        required: true,
        min: 1.00,
        number: true
      },
      "giver[zip]": {
        required: true,
        minlength: 3
      },
      "giver[state]": {
        required: true,
        minlength: 2
      },
      "giver[city]": {
        required: true,
        minlength: 2
      },
      "giver[address]": {
        required: true,
        minlength: 1
      },
      "giver[email]": {
        required: true,
        email: true,
        minlength: 2
      }
    },
    highlight: function (element) {
      $(element).parent().addClass("validate-fail").removeClass("validate-valid");
    },
    unhighlight: function (element) {
      $(element).parent().addClass("validate-valid").removeClass("validate-fail");
    },
    /*success: function(element) {

    },
    submitHandler: function(form) {
      $()
    },*/
    messages: {
      "giver[address]": {
        required: "We need your address for potential tax deduction reporting purposes"
      },
      "giver[amount]": {
        required: "Please donate something!",
        min: "Please donate at least enough to cover the cost of the transaction"
      },
      "giver[state]": {
        required: "The State field is required. Enter 'XX' if not in a State."
      },
      "giver[city]": {
        required: "We need your address for tax purposes"
      },
      "giver[email]": {
        required: "Your receipt will be sent to this email address",
        email: "We need a valid email address so we can send your receipt"
      },
      "giver[first_name]": {
        required: "We need a name for your receipt"
      },
      "giver[last_name]": {
        required: "We need a name for your receipt"
      }
    }
  });
}

function updateValidation(element) {
    $(element).validate();
    if($("#payment-form").valid()) {
      $("#donation-form-submit-button").addClass("validation-basic-yes").attr('disabled', false);
    } else {
      $("#donation-form-submit-button").removeClass("validation-basic-yes").attr('disabled', true);
    }
}

$(document).ready(function() {
  braintree_setup();

  // Validation
  validateForm();
  $("input.form-control").blur(function () { updateValidation(this); });
  $("input.form-control").keypress(function () { updateValidation(this); });
  $("input.form-control").focusout(function () { updateValidation(this); });
  $("input.form-control").focusin(function () { updateValidation(this); });


  $("#donation-form-submit-button").click(function(event) {
    if((
      $("#donation-form-submit-button").hasClass("validation-braintree-valid-number") &&
      $("#donation-form-submit-button").hasClass("validation-braintree-valid-cvv") &&
      $("#donation-form-submit-button").hasClass("validation-braintree-valid-date") &&
      $("#donation-form-submit-button").hasClass("validation-basic-yes"))
      || ($("#donation-form-submit-button").hasClass("validation-paypal") &&
      $("#donation-form-submit-button").hasClass("validation-basic-yes"))) {
       updateValidation(this);
        $("div.overlay").removeClass("invisible");
        addProgressIndicator();
      } else {
        updateValidation(this);
    }
  });
});
