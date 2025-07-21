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
  - [HandsOnReact](https://handsonreact.com/)
    
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
 - Example  - Component

    ```
      import { createRoot } from "react-dom/client"
      const root = createRoot(document.getElementById("root"))
      
      root.render(
      <TemporaryName />
      )
      
      function TemporaryName() {
      return (
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
      }
   ```
 - Example - Challenge
Part 2: 
- Add a `<header>` element with an `<img />` element with the image of the 
  React logo inside (src="react-logo.png") and make sure to set the 
  width to something more manageable so it doesn't take up the whole screen.
  Also, as always, you should include some alt text on the image.
- Add an `<h1>` with some text describing the page. (E.g. "Reasons
  I'm excited to learn React"). Place it above the ordered list, then wrap
  the `<h1>` and `<ol>` inside a `<main>` element to keep our semantic
  structure flowing well.
- Add a `<footer>` after the list that says: 
    "© 20xx <last name here> development. All rights reserved."
 */

  ```
    import { createRoot } from "react-dom/client"
    const root = createRoot(document.getElementById("root"))
    
    function Page() {
        return (
            <div>
                <header>
                    <img src="react-logo.png" width="40px" alt="React logo" />
                </header>
                <main>
                    <h1>Reason I am excited to learn React</h1>
                    <ol>
                        <li>React is a popular library, so I will be able to fit in with all the coolest devs out there! 😎</li>
                        <li>I am more likely to get a job as a front end developer if I know React</li>
                    </ol>
                </main>
                <footer>
                    <small>© 2024 Ziroll development. All rights reserved.</small>
                </footer>
            </div>
        )
    }

  ```
 - s
 - Example - challenge components

   ```
      /** Mini Challenge:
      * 
      * Move the `header` element from the Page component into 
      * its own component called "Header"
      * 
      * Then render an instance of the Header component inside
      * the Page component where the `header` used to be.
      */

     import { createRoot } from "react-dom/client"
     const root = createRoot(document.getElementById("root"))
     root.render(
     <Page/>
     )
  
     functino Header(){
     return(
      <header>   <img src="react-logo.png" width="40px" alt="React logo" /></header>
     )
     }
  
  
     /** Challenge: 
     * Move the `main` element into its own component called "MainContent" 
     * and render that component inside the Page component.
     * 
     * Do the same with the `footer` element, moving it into a new
     * component called "Footer"
      */
  
       functino MainComponent(){
          <main>
              <h1>Reason I am excited to learn React</h1>
              <ol>
                  <li>React is a popular library, so I will be able to fit in with all the coolest devs out there! 😎</li>
                  <li>I am more likely to get a job as a front end developer if I know React</li>
              </ol>
          </main>
       }
  
     function Footer(){
      <footer>
          <small>© 2024 Ziroll development. All rights reserved.</small>
      </footer>
     }

     function Page(){
   <>
     <Header/>
     <MainComponent/>
     <Footer/>
   </>
     }
   
   ```
  - Example -- with CSS

  ```
      import { createRoot } from "react-dom/client"
      const root = createRoot(document.getElementById("root"))
      
      function Header() {
          return (
              <header className="header">
                  <img src="react-logo.png" className="nav-logo" alt="React logo" />
                  <nav>
                      <ul className="nav-list">
                          <li className="nav-list-item">Pricing</li>
                          <li className="nav-list-item">About</li>
                          <li className="nav-list-item">Contact</li>
                      </ul>
                  </nav>
              </header>
          )
      }
      
      function MainContent() {
          return (
              <main>
                  <h1>Reason I am excited to learn React</h1>
                  <ol>
                      <li>React is a popular library, so I will be able to fit in with all the coolest devs out there! 😎</li>
                      <li>I am more likely to get a job as a front end developer if I know React</li>
                  </ol>
              </main>
          )
      }
      
      function Footer() {
          return (
              <footer>
                  <small>© 2024 Ziroll development. All rights reserved.</small>
              </footer>
          )
      }
      
      function Page() {
          return (
              <>
                  <Header />
                  <MainContent />
                  <Footer />
              </>
          )
      }
      
      root.render(
          <Page />
      )


    -------
      css
    -------
        
          * {
            box-sizing: border-box;
        }
        
        body {
            padding: 20px;
            font-family: Arial, Helvetica, sans-serif;
            background: #27292c;
            color: white;
        }
        
        h1 {
            margin-top: 30px;
        }
        
        .header {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        
        .nav-list {
            list-style: none;
            display: flex;
        }
        
        .nav-list-item {
            margin-left: 10px;
            font-size: 1.1rem;
        }
        
        .nav-logo {
            width: 55px;
        }


  ```
  
  - ad

    
    
  
    
  </details>
