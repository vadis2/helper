There are some approaches:

1. Charge is done. Payment System send message with charge data to our server (json for example).
2. Each request to user that must paid goes through payment check. I.e. our server calls to the payment system and gets answer.
3. Server 1 time per day calls to to the payment system and check payment.
