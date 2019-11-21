# Sendgrid
````
$user = Auth::user();

$data = array(
    'name' => $user->name,
    'email'=>$user->email,
    'subject'=>$request->subject,
    'body'=>$request->message
);
Mail::send('emails.support', $data, function ($message) use ($data) {
    $message->from($data['email'], $data['name']);
    $message->to('vadiasov.volodymyr@gmail.com')->subject($data['subject']);
});

return redirect()->action('Landlord\SupportController@form')->with('status', 'A new Message to Support has been sent!');
````