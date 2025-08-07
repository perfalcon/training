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
- Multiple Input Fields
-  You can control the values of more than one input field by adding a name attribute to each element.
-  We will initialize our state with an empty object.
-  To access the fields in the event handler use the event.target.name and event.target.value syntax.
-  To update the state, use square brackets [bracket notation] around the property name.
 ```
import { useState } from 'react';
import ReactDOM from 'react-dom/client';

function MyForm() {
  const [inputs, setInputs] = useState({});

  const handleChange = (event) => {
    const name = event.target.name;
    const value = event.target.value;
    setInputs(values => ({...values, [name]: value}))
  }

  const handleSubmit = (event) => {
    event.preventDefault();
    alert(inputs);
  }

  return (
    <form onSubmit={handleSubmit}>
      <label>Enter your name:
      <input 
        type="text" 
        name="username" 
        value={inputs.username || ""} 
        onChange={handleChange}
      />
      </label>
      <label>Enter your age:
        <input 
          type="number" 
          name="age" 
          value={inputs.age || ""} 
          onChange={handleChange}
        />
        </label>
        <input type="submit" />
    </form>
  )
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<MyForm />);
``` 
### React Router
- Create React App doesn't include page routing.
- React Router is the most popular solution.
- Add React Router
 - To add React Router in your application, run this in the terminal from the root directory of the application:
 - npm i -D react-router-dom
- Folder Structure
- To create an application with multiple page routes, let's first start with the file structure.Within the src folder, we'll create a folder named pages with several files:
  src\pages\:
  Layout.js
  Home.js
  Blogs.js
  Contact.js
  NoPage.js
 ```
import ReactDOM from "react-dom/client";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Layout from "./pages/Layout";
import Home from "./pages/Home";
import Blogs from "./pages/Blogs";
import Contact from "./pages/Contact";
import NoPage from "./pages/NoPage";

export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Layout />}>
          <Route index element={<Home />} />
          <Route path="blogs" element={<Blogs />} />
          <Route path="contact" element={<Contact />} />
          <Route path="*" element={<NoPage />} />
        </Route>
      </Routes>
    </BrowserRouter>
  );
}

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<App />);
```

- Example Explained
   - We wrap our content first with <BrowserRouter>.
   - Then we define our <Routes>. An application can have multiple <Routes>. Our basic example only uses one.
   - <Route>s can be nested. The first <Route> has a path of / and renders the Layout component.
   - The nested <Route>s inherit and add to the parent route. So the blogs path is combined with the parent and becomes /blogs.
   - The Home component route does not have a path but has an index attribute. That specifies this route as the default route for the parent route, which is /.
   - Setting the path to * will act as a catch-all for any undefined URLs. This is great for a 404 error page.

- Pages / Components
   - The Layout component has <Outlet> and <Link> elements.
   - The <Outlet> renders the current route selected.
   - <Link> is used to set the URL and keep track of browsing history
   - Anytime we link to an internal path, we will use <Link> instead of <a href="">.
   - The "layout route" is a shared component that inserts common content on all pages, such as a navigation menu.
   - Layout.js
 
```
import { Outlet, Link } from "react-router-dom";

const Layout = () => {
  return (
    <>
      <nav>
        <ul>
          <li>
            <Link to="/">Home</Link>
          </li>
          <li>
            <Link to="/blogs">Blogs</Link>
          </li>
          <li>
            <Link to="/contact">Contact</Link>
          </li>
        </ul>
      </nav>

      <Outlet />
    </>
  )
};

export default Layout;
```  

Home.js
```
const Home = () => {
  return <h1>Home</h1>;
};

export default Home;
``` 
Blog.js
```
const Blogs = () => {
  return <h1>Blog Articles</h1>;
};

export default Blogs;
```
Contact.js
```
const Contact = () => {
  return <h1>Contact Me</h1>;
};

export default Contact;
```
NoPage.js
```
const NoPage = () => {
  return <h1>404</h1>;
};

export default NoPage;
```

### React Memo
- Using memo will cause React to skip rendering a component if its props have not changed.
- This can improve performance.

```
import { useState } from "react";
import ReactDOM from "react-dom/client";
import Todos from "./Todos";

const App = () => {
  const [count, setCount] = useState(0);
  const [todos, setTodos] = useState(["todo 1", "todo 2"]);

  const increment = () => {
    setCount((c) => c + 1);
  };

  return (
    <>
      <Todos todos={todos} />
      <hr />
      <div>
        Count: {count}
        <button onClick={increment}>+</button>
      </div>
    </>
  );
};

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(<App />);
```
```
import { memo } from "react";

const Todos = ({ todos }) => {
  console.log("child render");
  return (
    <>
      <h2>My Todos</h2>
      {todos.map((todo, index) => {
        return <p key={index}>{todo}</p>;
      })}
    </>
  );
};

export default memo(Todos);
```
