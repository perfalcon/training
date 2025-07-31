## React Components
- Components are independent and reusable bits of code. They serve the same purpose as JavaScript functions, but work in isolation and return HTML.
- Components come in two types, Class components and Function components.
### Class Component
- A class component must include the extends React.Component statement.
-  This statement creates an inheritance to React.Component, and gives your component access to React.Component's functions.
-  The component also requires a render() method, this method returns HTML.

 ```
   class Car extends React.Component {
    render() {
      return <h2>Hi, I am a Car!</h2>;
    }  
  }

```

### Function Component
- A Function component also returns HTML, and behaves much the same way as a Class component, but Function components can be written using much less code, are easier to understand.
 ```
function Car() {
  return <h2>Hi, I am a Car!</h2>;
}

```

### Rendering the Component
- To use this component in your application, use similar syntax as normal HTML: <Car />
 ```
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Car />);

```


### Props
- Components can be passed as props, which stands for properties.
- Props are like function arguments, and you send them into the component as attributes.
 ```
function Car(props) {
  return <h2>I am a {props.color} Car!</h2>;
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Car color="red"/>);

```

- you can send a variable as
```
function Car(props) {
  return <h2>I am a { props.brand }!</h2>;
}

function Garage() {
  const carName = "Ford";
  return (
    <>
      <h1>Who lives in my garage?</h1>
      <Car brand={ carName } />
    </>
  );
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Garage />);

```
- you can send an object as
```
function Car(props) {
  return <h2>I am a { props.brand.model }!</h2>;
}

function Garage() {
  const carInfo = { name: "Ford", model: "Mustang" };
  return (
    <>
      <h1>Who lives in my garage?</h1>
      <Car brand={ carInfo  } />
    </>
  );
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Garage />);

```

### Components in Components
- We can refer to components inside other components
 ```
function Car() {
  return <h2>I am a Car!</h2>;
}

function Garage() {
  return (
    <>
      <h1>Who lives in my Garage?</h1>
      <Car />
    </>
  );
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Garage />);

```
### Components in Files
- React is all about re-using code, and it is recommended to split your components into separate files.
- To do that, create a new file with a .js file extension and put the code inside it
- Car.js
 ```
function Car() {
  return <h2>Hi, I am a Car!</h2>;
}

export default Car;

```  
- To be able to use the Car component, you have to import the file in your application.
```
import React from 'react';
import ReactDOM from 'react-dom/client';
import Car from './Car.js';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Car />);

```

### Events
-  React can perform actions based on user events like click, change, mouseover etc.
-  React events are written in camelCase syntax as onClick
-  React event handlers are written inside curly braces: onClick={shoot}
-  <button onClick={shoot}>Take the Shot!</button>
```
function Football() {
  const shoot = () => {
    alert("Great Shot!");
  }

  return (
    <button onClick={shoot}>Take the shot!</button>
  );
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Football />);

```
### Passing Arguments
- To pass an argument to an event handler, use an arrow function.
```
function Football() {
  const shoot = (a) => {
    alert(a);
  }

  return (
    <button onClick={() => shoot("Goal!")}>Take the shot!</button>
  );
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Football />);

```
### React Event Object
- Event handlers have access to the React event that triggered the function.
```
function Football() {
  const shoot = (a, b) => {
    alert(b.type);
    /*
    'b' represents the React event that triggered the function,
    in this case the 'click' event
    */
  }

  return (
    <button onClick={(event) => shoot("Goal!", event)}>Take the shot!</button>
  );
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Football />);

```
