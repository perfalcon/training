1. Where does React put all of the elements I create in JSX when I 
   call `root.render()`?

Ans: All the elements I render get put inside the div with the id of "root"
(or whatever other element I might select when calling createRoot)


2. What would show up in my console if I were to run this line of code:
```
console.log(<h1>Hello world!</h1>)
```
Ans: An object! Unlike creating an HTML element in vanilla DOM JS, what
gets created from the JSX we have in our React code is a plain JS object
that React will use to fill in the view.


3. What's wrong with this code:
```
root.render(
    <section>
        <h1>Hi there</h1>
        <p>This is my website!</p>
    </section>
)
```
Ans: You can only render 1 parent element at a time. That parent element can have
as many children elements as you want.


4. What does it mean for something to be "declarative" instead of "imperative"?

Ans: *Imperative* means we need to give specific step-by-step instructions on how to
accomplish a task.
 
 *Declarative* means we can write our code to simply "describe" *what* should show up
on the page and allow the rool (React, e.g.) to handle the details on *how* to 
put those things on the page.


5. What does it mean for something to be "composable"?

Ans: We have small pieces that we can put together to make something
larger or greater than the individual pieces themselves.

1. What is a React component?

Ans: A function that returns React elements. (UI)

2. What's wrong with this code?

```
function myComponent() {
    return (
        <small>I'm tiny text!</small>
    )
}

```
Ans: function name should be Pascal Case : MyComponent()

3. What's wrong with this code?

```
function Header() {
    return (
        <header>
            <img src="./react-logo.png" width="40px" alt="React logo" />
        </header>
    )
}

root.render(Header())
```
Ans: Calling the component should be <Header/> instead of Header()
