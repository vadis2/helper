# Test
## Postman
1. http://wny2.com/api/auth/signup

    1.1. Body: name, email, password

    1.2. Response: JSON (status, token)

2. http://wny2.com/api/auth/login

    2.1. Body: email, password

    2.2. Response: JSON (status, token)

3. All Postman' tabs need to save after creating before sending to keep token.

4. Put needs
    
    4.1. Content-Type: application/x-www-form-urlencoded
    
    4.2. Body: x-www-form-urlencoded.   