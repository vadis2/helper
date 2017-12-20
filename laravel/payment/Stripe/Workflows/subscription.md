# Development workflow
# Step 1
* I am registered in Stripe
* I have stripe keys
* I use Checkout script

# Step 2
Create routes
```` 
Route::get('payment', 'PaymentsController@index');
Route::post('payment', 'PaymentsController@pay');
````
 
# Step 3
First route leads to method
````
public function index($unit_id)
{
    $user     = Auth::user();
    $active   = 'payments';
    $settings = AdminSetting::all();
    $settings = $settings->keyBy('title');
    $settings = AdminSetting::insertNumberOfPaidUnits($settings);
    $units    = Unit::landlordUnitsPaid($user->id);
    $total    = 195 * (count($units) + 1);

    return view('landlord.payments.subscription',
        compact(
            'active',
            'settings',
            'total',
            'user'
        ));
}
````
landlord.payments.subscription is page with stripe script.

````
<form method="POST">
    {{ csrf_field() }}
    <script
            src="https://checkout.stripe.com/checkout.js" class="stripe-button"
            data-key="pk_test_oufcWboUwQKQfEuUuGlQcxZc"
            data-image="{!! Auth::user()->photo != '' ? asset('storage/' . Auth::user()->photo) : asset('admin/production/images/user.png') !!}"
            data-name="Unit Management DHH"
            data-description="Monthly Subscription"
            data-amount="{!! $total !!}"
            data-label="Sign Me Up"
            data-email="{!! $user->email !!}">
    </script>
</form>
````

Script is on after click on a button. Modal page is pop up.

Click on a button in the modal page leads to second route (post).

Bottom is processing code (pay method is redirected to payFirst, it's current needs):
* connect to processing library from cartalyst
* create customer
* create subscription
* save data in DB
````
private function payFirst($request)
{
    // connect to processing library from cartalyst
    putenv('STRIPE_API_KEY=sk_test_26hwt5YVL9Z7Uy8YJKF8lTEf');
    $stripe = new Stripe();
    $userId = Auth::id();

    try {
        // create customer
        $customer = $stripe->customers()->create([
            'email' => $request->get('stripeEmail'),
        ]);
    } catch (Exception $exception) {
        return redirect()->action('Landlord\UnitsController@index')->with('status', "unable to sign up customer:" . $request->get('stripeEmail') .
            ", error:" . $exception->getMessage());
    }

    try {
        // create subscription
        $subscription = $stripe->subscriptions()->create($customer['id'], [
            'plan' => 'UM',
        ]);
    } catch (Exception $exception) {
        return redirect()->action('Landlord\UnitsController@index')->with('status', "unable to subscribe:" . $request->get('stripeEmail') .
            ", error:" . $exception->getMessage());
    }

    $user = User::whereId($userId)->firstOrFail();

    $user->customer_id     = $customer['id'];
    $user->subscription_id = $subscription['id'];
    $user->save();

    return $user;
}
````