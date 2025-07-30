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

