There are three different ways to create a charge:

1. with the source parameter only. In this case, source needs to be a token ID (created by Checkout or Stripe.js), i.e. a string that starts with tok_.
2. with the customer parameter only. In this case, customer needs to be a customer ID, i.e. a string that starts with cus_. The customer's default card will be charged.
3. with both the customer and source parameters. In this case, customer needs to be a customer ID as in the previous case, but source should be a card ID, i.e. a string that starts with card_. The card object should belong to the customer.