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
  
