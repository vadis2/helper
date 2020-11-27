# Definitions
## Functional programming
The fundamental, defining principles that make up this paradigm are that the code:

+ follows a declarative pattern
+ is composed of pure functions
+ avoids shared state, mutable data, and side effects

### Imperative Pattern
Telling the computer exactly HOW to do something.

### Declarative Pattern
Telling the computer WHAT needs to be done.

### Pure Functions
+ accept at least one parameter
+ return something as a result
+ return the same output if given the same input
+ produce no side effects
+ are referentially transparent -- you can replace the function call with its resulting value without changing the meaning of the program

### Immutability and Side Effects
#### Immutability
When an object cannot be modified in any way after it has been created.

The goal is to keep state and data from being shared or altered and solely keep it within the scope of each function, when possible.

#### Side Effects
Any application state changes that are observable outside the called function other than its return value.

Elements in your code that can cause side effects are:

+ modifying any external variable or object property
+ logging to the console
+ writing to the screen, a file, or the network
+ triggering any external process
+ calling other functions that contain side effects

#### Shared State
Shared State is something that will create side effects within your code if it is altered.

An example of this would be if there was a user object for your program that needed to be saved. 
The saveUser() function makes a request to the API on the server and while that is happening, 
the user changes their profile picture with the updateAvatar() function. 
This triggers a second request with saveUser(). 
Since these are async calls, if the second call is received first, 
when the first call (now outdated) call gets returned, 
the new profile picture will get deleted and replaced with the old one.

## Summary
+ Functional programming is a way to approach solving software challenges based on 
    a set of fundamental, defining principles: follows a declarative pattern, 
    utilizes pure functions, and avoids using shared state, mutable data, 
    as well as creating side effects.
+ The declarative pattern entails giving the computer what you are wanting as a result 
    without telling it exactly how it needs to be done.
+ Pure functions are simple reusable blocks of code that are completely independent from any 
    outside state. They are immune to bugs related to state changes and help make your code 
    flexible to future changes because they are easy to move around and refactor.
+ Shared state, mutable data, and side effects are avoided as much as possible. 
    Although, a program can never be completely free of side effects, the goal is to keep them 
    contained and isolated inside your code.
+ Adopting a functional programming approach in the right situations has potential to take your code 
    to the next level
