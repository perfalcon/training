<details>
  <summary>What is React</summary>
  
  - React is a JavaScript Library known for front-end development (or user interface).
  - It is popular due to its component-based architecture, Single Page Applications (SPAs), and Virtual DOM for building web applications that are fast, efficient, and scalable.

 

  
</details>
 <details>
    <summary>Links</summary>
    
  - [Geeks](https://www.geeksforgeeks.org/react/)
  - [Scimba](https://scrimba.com/learn-react-c0e/~04xn)
  - [React DEV](https://react.dev/learn)
    
  </details>
  <details>
    <summary>Examples</summary>

  - Image Example

    ```
    import { createElement } from "react"
    import { createRoot } from "react-dom/client"
    const root = createRoot(document.getElementById("root"))
    root.render(
        <main>
            <img src="react-logo.png" />
            <h1>This is another element</h1>
        </main>
    )
    ```
  
  - s
  - Basic Example

   ```
      import {createRoot} from "react-dom/client"
      const root = createRoot(document.getElementById("root"))
      root.render(
      <h1>Hello from React!</h1>
      )
   ```
  - Example 1

   ```
    import { createRoot } from "react-dom/client"
    const root = createRoot(document.getElementById("root"))
    
    root.render(
      <main>
          <img src="react-logo.png" width="40px" alt="React logo" />
          <h1>Fun facts about React!</h1>
          <ul>
              <li>Was first release in 2013</li>
              <li>Was originally created by Jordan Walke</li>
              <li>Has well over 200K stars on GitHub</li>
              <li>Is maintained by Meta</li>
              <li>Powers thousands of enterprise apps, including mobile apps</li>
          </ul>
      </main>
    )

   ```



    
    
  
    
  </details>
