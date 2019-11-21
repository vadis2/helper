# Development workflow
# Step 1
* I am registered in Stripe
* I have stripe keys
* I use Checkout script

# Step 2
Create routes
```` 
Route::get('payment/{unitId?}', 'PaymentsController@index');
Route::post('payment/{unitId?}', 'PaymentsController@pay');
````
 
# Step 3
First route leads to method
````
public function index()
{
    // handyman selects/enters a number of needed bids
    // JS (not stripe's) calculates total and pass it in the stripe script
    // click on the button "Pay" open stripe script
    // view index


}
````
xxx.payments.index is page with stripe script.

````
<form method="POST">
    {{ csrf_field() }}
    <script
            src="https://checkout.stripe.com/checkout.js" class="stripe-button"
            data-key="pk_test_oufcWboUwQKQfEuUuGlQcxZc"
            data-image="{!! Auth::user()->photo != '' ? asset('storage/' . Auth::user()->photo) : asset('admin/production/images/user.png') !!}"
            data-name="Unit Management DHH"
            data-description="Payment for N item"
            data-amount="{!! $total !!}"
            data-label="Pay"
            data-email="{!! $user->email !!}">
    </script>
</form>
````

Script is on after click on a button. Modal page is pop up.

Click on a button in the modal page leads to 
1. payment request to Stripe
2. second route (post).

Bottom is  processing code:
* connect to processing library from cartalyst
* get in DB/create new customer
* create charge
* save data in DB
````
private function payFirst($request)
{
    // connect to processing library from cartalyst
    putenv('STRIPE_API_KEY=sk_test_26hwt5YVL9Z7Uy8YJKF8lTEf');
    $stripe = new Stripe();
    $userId = Auth::id();

    // get customer
    // or create new customer
    try {
        // create customer
        $customer = $stripe->customers()->create([
            'email' => $request->get('stripeEmail'),
        ]);
    } catch (Exception $exception) {
        return redirect()->action('Landlord\UnitsController@index')->with('status', "unable to sign up customer:" . $request->get('stripeEmail') .
            ", error:" . $exception->getMessage());
    }

    // payment instead subscription
    try {
        // create subscription
        $subscription = $stripe->subscriptions()->create($customer['id'], [
            'plan' => 'UM',
        ]);
    } catch (Exception $exception) {
        return redirect()->action('Landlord\UnitsController@index')->with('status', "unable to subscribe:" . $request->get('stripeEmail') .
            ", error:" . $exception->getMessage());
    }

    // save data in DB instead bottom code
    $user = User::whereId($userId)->firstOrFail();

    $user->customer_id     = $customer['id'];
    $user->subscription_id = $subscription['id'];
    $user->save();

    return $user;
}
````