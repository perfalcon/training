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

### React Conditional Rendering
- if Statement
We can use the if JavaScript operator to decide which component to render.
```
function MissedGoal() {
  return <h1>MISSED!</h1>;
}

function MadeGoal() {
  return <h1>Goal!</h1>;
}

function Goal(props) {
  const isGoal = props.isGoal;
  if (isGoal) {
    return <MadeGoal/>;
  }
  return <MissedGoal/>;
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Goal isGoal={false} />);
```

- Logical && Operator
```
function Garage(props) {
  const cars = props.cars;
  return (
    <>
      <h1>Garage</h1>
      {cars.length > 0 &&
        <h2>
          You have {cars.length} cars in your garage.
        </h2>
      }
    </>
  );
}
const cars = ['Ford', 'BMW', 'Audi'];
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Garage cars={cars} />);
```
- Ternary Operator
```
function Goal(props) {
  const isGoal = props.isGoal;
  return (
    <>
      { isGoal ? <MadeGoal/> : <MissedGoal/> }
    </>
  );
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Goal isGoal={false} />);
```

### React Lists
- The JavaScript map() array method is generally the preferred method.
- render all of the cars from our garage:
```
function Car(props) {
  return <li>I am a { props.brand }</li>;
}

function Garage() {
  const cars = ['Ford', 'BMW', 'Audi'];
  return (
    <>
      <h1>Who lives in my garage?</h1>
      <ul>
        {cars.map((car) => <Car brand={car} />)}
      </ul>
    </>
  );
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Garage />);
```
- Keys

   - Keys allow React to keep track of elements. This way, if an item is updated or removed, only that item will be re-rendered instead of the entire list.
   - Keys need to be unique to each sibling. But they can be duplicated globally.
   - Generally, the key should be a unique ID assigned to each item. As a last resort, you can use the array index as a key.

```
function Car(props) {
  return <li>I am a { props.brand }</li>;
}

function Garage() {
  const cars = [
    {id: 1, brand: 'Ford'},
    {id: 2, brand: 'BMW'},
    {id: 3, brand: 'Audi'}
  ];
  return (
    <>
      <h1>Who lives in my garage?</h1>
      <ul>
        {cars.map((car) => <Car key={car.id} brand={car.brand} />)}
      </ul>
    </>
  );
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<Garage />);
```

### React Forms
- Adding Forms in React
```
function MyForm() {
  return (
    <form>
      <label>Enter your name:
        <input type="text" />
      </label>
    </form>
  )
}
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<MyForm />);

```
- Handling Forms
 -  Handling forms is about how you handle the data when it changes value or gets submitted.
 -  In HTML, form data is usually handled by the DOM.
 -  In React, form data is usually handled by the components.
 -  When the data is handled by the components, all the data is stored in the component state.
 -  You can control changes by adding event handlers in the onChange attribute.
 -  We can use the useState Hook to keep track of each inputs value and provide a "single source of truth" for the entire application.
 -  Use the useState Hook to manage the input:
 ```
import { useState } from 'react';
import ReactDOM from 'react-dom/client';

function MyForm() {
  const [name, setName] = useState("");

  return (
    <form>
      <label>Enter your name:
        <input
          type="text" 
          value={name}
          onChange={(e) => setName(e.target.value)}
        />
      </label>
    </form>
  )
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<MyForm />);
```  
- Submitting Forms
 - You can control the submit action by adding an event handler in the onSubmit attribute for the <form>:

 ```
import { useState } from 'react';
root.render(<MyForm />);
```
```
import { useState } from 'react';
import ReactDOM from 'react-dom/client';

function MyForm() {
  const [name, setName] = useState("");

  const handleSubmit = (event) => {
    event.preventDefault();
    alert(`The name you entered was: ${name}`)
  }

  return (
    <form onSubmit={handleSubmit}>
      <label>Enter your name:
        <input 
          type="text" 
          value={name}
          onChange={(e) => setName(e.target.value)}
        />
      </label>
      <input type="submit" />
    </form>
  )
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<MyForm />);
``` 
