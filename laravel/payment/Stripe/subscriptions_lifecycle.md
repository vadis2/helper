## API Description
https://stripe.com/docs/subscriptions/lifecycle

## Settings
It's needed to setting up subscription.
https://dashboard.stripe.com/account/recurring

## Status of subscription:
````
trialing
active
past_due
canceled
unpaid
````

## Cancel in Settings leads to
If payment is failed status will be changed to past_due.
After all emails to customer status will be changed to unpaid.

Events for canceled subscription (if settings mean status cancelled after email is finished):
````
charge.failed
invoice.payment_failed
customer.subscription.deleted

````

## Renew payments from unpaid status
To set a subscription status back to active from an unpaid or past_due state, 
open the most recent invoice and attempt to pay it. 
Note that paying any other invoice—that is not the most recent—does not change 
the subscription’s status.

## Event charge.failed
Send response https://stripe.com/docs/api#charge_object
We use
````
paid                // false or true
source['name']      // customers email
````

## Webhooks
Webhooks are a tool Stripe uses to notify your site of account events. 

Follow the general webhooks guide to create your webhook endpoint and 
configure it in your Stripe account.

Webhooks are only necessary for behind-the-scenes transactions. 
The results of most Stripe requests (e.g., creating charges or refunds) are reported 
synchronously to your code and don’t require webhooks for verification.

