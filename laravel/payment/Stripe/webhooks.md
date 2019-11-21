# Webhooks
## Set up
https://dashboard.stripe.com/account/webhooks

Stripe supports two webhook types: Account and Connect. 
You'll likely want to create an account webhook, unless you've created a Connect application.

Install:
https://github.com/stripe/stripe-php
````
composer require stripe/stripe-php
````
Don't register in app.php.
````
namespace App\Http\Controllers;

use Cartalyst\Stripe\Stripe;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Stripe\Webhook;
use Stripe\Error\SignatureVerification;

class WebhooksController extends Controller
{
    public function failedCharge(Request $request)
    {
        putenv('STRIPE_API_KEY=sk_test_...');
        $stripe = new Stripe();

        // webhook secret
        $endpoint_secret = "whsec_...";

        $payload = @file_get_contents("php://input");
        $sig_header = $_SERVER["HTTP_STRIPE_SIGNATURE"];
        $event = null;

        try {
            $event = Webhook::constructEvent(
                $payload, $sig_header, $endpoint_secret
            );
        } catch(\UnexpectedValueException $e) {
            // Invalid payload
            http_response_code(400); // PHP 5.4 or greater
            exit();
        } catch(SignatureVerification $e) {
            // Invalid signature
            http_response_code(400); // PHP 5.4 or greater
            exit();
        }

        // Do something with $event
        $event_json = json_decode($payload);

        $rowRequest = DB::table('requests')
            ->where('id', 8)
            ->update(['description' => $event_json->data->object->source->name]);

        http_response_code(200); // PHP 5.4 or greater
    }
}
````

Request:
````
"{
  "created": 1326853478,
  "livemode": false,
  "id": "evt_00000000000000",
  "type": "charge.failed",
  "object": "event",
  "request": null,
  "pending_webhooks": 1,
  "api_version": "2017-08-15",
  "data": {
    "object": {
      "id": "ch_00000000000000",
      "object": "charge",
      "amount": 1112600,
      "amount_refunded": 0,
      "application": null,
      "application_fee": null,
      "balance_transaction": "txn_00000000000000",
      "captured": true,
      "created": 1513557218,
      "currency": "usd",
      "customer": null,
      "description": null,
      "destination": null,
      "dispute": null,
      "failure_code": null,
      "failure_message": null,
      "fraud_details": {
      },
      "invoice": null,
      "livemode": false,
      "metadata": {
      },
      "on_behalf_of": null,
      "order": null,
      "outcome": {
        "network_status": "approved_by_network",
        "reason": null,
        "risk_level": "normal",
        "seller_message": "Payment complete.",
        "type": "authorized"
      },
      "paid": false,
      "receipt_email": null,
      "receipt_number": null,
      "refunded": false,
      "refunds": {
        "object": "list",
        "data": [

        ],
        "has_more": false,
        "total_count": 0,
        "url": "/v1/charges/ch_1BaCZaKqHlwyVNJMC22sBmtq/refunds"
      },
      "review": null,
      "shipping": null,
      "source": {
        "id": "card_00000000000000",
        "object": "card",
        "address_city": null,
        "address_country": null,
        "address_line1": null,
        "address_line1_check": null,
        "address_line2": null,
        "address_state": null,
        "address_zip": null,
        "address_zip_check": null,
        "brand": "Visa",
        "country": "US",
        "customer": null,
        "cvc_check": "pass",
        "dynamic_last4": null,
        "exp_month": 12,
        "exp_year": 2020,
        "fingerprint": "joJoFF0EuiYJwuCy",
        "funding": "credit",
        "last4": "4242",
        "metadata": {
        },
        "name": "handyman-a@admin.com",
        "tokenization_method": null
      },
      "source_transfer": null,
      "statement_descriptor": null,
      "status": "succeeded",
      "transfer_group": null
    }
  }
}"
````

