#[HTL](https://experienceleague.adobe.com/en/docs/experience-manager-htl/content/getting-started)

[HTL Specification](https://github.com/adobe/htl-spec/blob/master/SPECIFICATION.md#121-display-context)



<details>
  <summary>Block and Expressions</summary>
  
  - **Block Statements**: to display the h1 element conditionally, use a data-sly-test
  - **Expression Language**: The ${ and } characters delimit HTL expressions. At runtime, these expressions are evaluated and their value is injected into the outgoing HTML stream.
  ```
    <h1 data-sly-test="${properties.jcr:title}">
    ${properties.jcr:title}
    </h1>
  ```
  - The SLY Element:
  ```
    <sly data-sly-test="${properties.jcr:title && properties.jcr:description}">
    <h1>${properties.jcr:title}</h1>
    <p>${properties.jcr:description}</p>
    </sly>
  ```
  - HTL Comments: HTL comments are HTML comments with an additional JavaScript-like syntax. The processor entirely ignores the whole HTL comment and anything within, removing it from the output.
  ```
    <!--/* An HTL Comment */-->
    <!-- An HTML Comment -->
  ```
  - Special Contexts:
    - To protect against cross-site scripting (XSS) vulnerabilities, HTL automatically recognises the context within which an output string is to be displayed within the final HTML output, and escapes that string appropriately.
    - It is also possible to override the automatic display context handling with the context option.
      <details>
        <summary> Context </summary>
        
         ```      
            ${properties.jcr:title @ context='html'}          <!--/* Use this in case you want to output HTML - Removes markup that may contain XSS risks */-->
            ${properties.jcr:title @ context='text'}          <!--/* Use this for simple HTML content - Encodes all HTML */-->
            ${properties.jcr:title @ context='elementName'}   <!--/* Allows only element names that are white-listed, outputs 'div' otherwise */-->
            ${properties.jcr:title @ context='attributeName'} <!--/* Outputs nothing if the value doesn't correspond to the HTML attribute name syntax - doesn't allow 'style' and 'on*' attributes */-->
            ${properties.jcr:title @ context='attribute'}     <!--/* Applies HTML attribute escaping */-->
            ${properties.jcr:title @ context='uri'}           <!--/* Outputs nothing if the value contains XSS risks */-->
            ${properties.jcr:title @ context='scriptToken'}   <!--/* Outputs nothing if the value doesn't correspond to an Identifier, String literal or Numeric literal JavaScript token */-->
            ${properties.jcr:title @ context='scriptString'}  <!--/* Applies JavaScript string escaping */-->
            ${properties.jcr:title @ context='scriptComment'} <!--/* Context for Javascript block comments. Outputs nothing if value is trying to break out of the comment context */-->
            ${properties.jcr:title @ context='scriptRegExp'}  <!--/* Applies JavaScript regular expression escaping */-->
            ${properties.jcr:title @ context='styleToken'}    <!--/* Outputs nothing if the value doesn't correspond to the CSS token syntax */-->
            ${properties.jcr:title @ context='styleString'}   <!--/* Applies CSS string escaping */-->
            ${properties.jcr:title @ context='styleComment'}  <!--/* Context for CSS comments. Outputs nothing if value is trying to break out of the comment context */-->
            ${properties.jcr:title @ context='comment'}       <!--/* Applies HTML comment escaping */-->
            ${properties.jcr:title @ context='number'}        <!--/* Outputs zero if the value is not a number */-->
            ${properties.jcr:title @ context='unsafe'}        <!--/* Use this at your own risk, this disables XSS protection completely */-->
         ```
       
      </details>
- Element and Attribute Names: Expressions can only be placed in HTML text or attribute values, but not within element names or attribute names, or it wouldn’t be valid HTML anymore.
  - To set element names dynamically, the data-sly-element statement can be used on the desired elements
  - to set attribute names dynamically, even setting multiple attributes at once, the data-sly-attribute statement can be used.
 
  ```
    <h1 data-sly-element="${myElementName}" data-sly-attribute="${myAttributeMap}">...</h1>

  ```
- Contexts Without Block Statements:
  -  it is not possible to define such block statements inside of the following contexts, and only expressions can be used there:
    - HTML comments
    - Script elements
    - Style elements
  - The reason for it is that the content of these contexts is text and not HTML, and contained HTML elements would be considered as simple character data. So, without real HTML elements, there also cannot be data-sly attributes run.
  - The following example illustrates the behavior for HTML comments, but in script or style elements, the same behavior would be observed:

    ```
      <!--
    The title is: ${properties.jcr:title}
    <h1 data-sly-test="${properties.jcr:title}">${properties.jcr:title}</h1>
      -->
     ```
  - Outputs something like the following HTML:

    ```
      <!--
        The title is: MY TITLE
        <h1 data-sly-test="MY TITLE">MY TITLE</h1>
    -->
     ```
- Explicit Contexts Required
    -  one objective of HTL is to reduce the risks of introducing cross-site scripting (XSS) vulnerabilities by automatically applying context-aware escaping to all expressions
    -  HTL detects the context of expressions in HTML markup but does not analyze inline JavaScript or CSS, so developers must specify the exact context for these expressions.
    -  An example of how to set the context for expressions placed inside scripts and styles:

       ```
       <script> var trackingID = "${myTrackingID @ context='scriptString'}"; </script>
       <style> a { font-family: "${myFont @ context='styleString'}"; } </style>
       ```
       
  
  
 
</details>

<details>
  <summary>Enumerable Objects</summary>
   
  These objects provide access to commonly used information. 
  Their content can be accessed with dot notation, and they can be iterated-through using **data-sly-list or data-sly-repeat**.
  
  | Variable Name | Description	| Backed By |
  | ----------- | ----------- | -----------|
  |properties	| List of properties of the current resource |	org.apache.sling.api.resource.ValueMap
  |pageProperties |	List of page properties of the current page | 	org.apache.sling.api.resource.ValueMap
  |inheritedPageProperties |List of inherited page properties of the current page |	org.apache.sling.api.resource.ValueMap

</details>
<details>
  <summary>Java-backed Objects</summary>

  The corresponding Java object backs each of the following objects.
  
  | Variable Name | Description	|
  | ----------- | ----------- | 
 | component	 | com.day.cq.wcm.api.components.Component |
 | componentContext	| com.day.cq.wcm.api.components.ComponentContext |
 | currentContentPolicy	| com.day.cq.wcm.api.policies.ContentPolicy |
 | currentContentPolicyProperties	| com.day.cq.wcm.api.policies.ContentPolicy |
 | currentDesign	| com.day.cq.wcm.api.designer.Design |
| currentNode	| javax.jcr.Node |
| currentPage	| com.day.cq.wcm.api.Page |
| currentSession	| javax.servlet.http.HttpSession |
| currentStyle	| com.day.cq.wcm.api.designer.Style |
| designer	| com.day.cq.wcm.api.designer.Designer |
| editContext	| com.day.cq.wcm.api.components.EditContext |
| log	| org.slf4j.Logger |
| out	| java.io.PrintWriter |
| pageManager	| com.day.cq.wcm.api.PageManager |
| reader	| java.io.BufferedReader |
| request	| org.apache.sling.api.SlingHttpServletRequest |
| resolver	| org.apache.sling.api.resource.ResourceResolver |
| resource	| org.apache.sling.api.resource.Resource |
| resourceDesign	| com.day.cq.wcm.api.designer.Design |
| resourcePage	| com.day.cq.wcm.api.Page |
| response	| org.apache.sling.api.SlingHttpServletResponse |
| sling	| org.apache.sling.api.scripting.SlingScriptHelper |
| slyWcmHelper	| com.adobe.cq.sightly.WCMScriptHelper |
| wcmmode	| com.adobe.cq.sightly.SightlyWCMMode |
| xssAPI	| com.adobe.granite.xss.XSSAPI |
  
</details>

<details> 
  <summary>HTL Tags:</summary>
  
  - data-sly-attribute
  - data-sly-call
  - data-sly-element
  - data-sly-include
  - data-sly-list
  - data-sly-repeat
  - data-sly-resource
  - data-sly-test
    - data-sly-test.joinString
    - data-sly-test.formatString
  - data-sly-set
  - data-sly-use
  - data-sly-unwrap
  - sly

  [Reference : Medium Article](https://medium.com/@techzette2/htl-sightly-cheat-sheet-68a1d6c8fad5)
</details>

<details>
  <summary>General Capabilities of HTL</summary>
  
  - Use-API for Accessing Logic
      - HTL's Java Use-API enables an HTL file to access helper methods in a custom Java class through data-sly-use
      - This process allows all complex business logic to be encapsulated in the Java code, while the HTL code deals only with direct markup production.
  - Automatic Context-Aware Escaping
    -  The HTL automatically escapes each variable accordingly to the context in which it is placed.
    -  Otherwise it would be vulnerable to cross-site scripting (XSS).
  - Automatic Removal of Empty Attributes
    -  ```
       <p class="${properties.class}">some text</p>       
       ```
        here If the value of the class property happens to be empty, the HTL automatically removes the entire class attribute from the output.
    - Additionally, the type of the variable placed in the expression matters:
      - String:
        - not empty: Sets the string as an attribute value.
        - empty: Removes the attribute altogether.
      - Number: Sets the value as an attribute value.
      - Boolean:
        - true: Displays the attribute without value (as a Boolean HTML attribute)
        - false: Removes the attribute altogether.
  </details>

  <details>
    <summary>Common Patterns with HTL</summary>
    <details>    
    <summary>Loading Client Libraries</summary>
  
  - In HTL, client libraries are loaded through a helper template provided by AEM, which can be accessed through **data-sly-use**.
  - Three templates are available in this file, which can be called through **data-sly-call**:
    - **css** - Loads only the CSS files of the referenced client libraries.
    - **js** - Loads only the JavaScript files of the referenced client libraries.
    - **all** - Loads all the files of the referenced client libraries (both CSS and JavaScript).
   
    - Loading multiple client libraries fully at once
      ```
      <sly data-sly-use.clientlib="/libs/granite/sightly/templates/clientlib.html"
       data-sly-call="${clientlib.all @ categories=['myCategory1', 'myCategory2']}"/>
      ``` 
    - Referencing a client library in different sections of a page
      ```
      <!doctype html>
      <html data-sly-use.clientlib="/libs/granite/sightly/templates/clientlib.html">
          <head>
              <!-- HTML meta-data -->
              <sly data-sly-call="${clientlib.css @ categories='myCategory'}"/>
          </head>
          <body>
              <!-- page content -->
              <sly data-sly-call="${clientlib.js @ categories='myCategory'}"/>
          </body>
      </html>
      ```
  
  </details>
  <details>
    <summary>Passing Data to the Client</summary>
  
  - using data attribute , we can pass the data to the client.
  - using the data in the client side
    
      ```
      <!--/* template.html file: */-->
      <div data-sly-use.logic="logic.js" data-json="${logic.json}">...</div>

      ==============
      /* logic.js file: */
      use(function () {
          var myData = {
              str: "foo",
              arr: [1, 2, 3]
          };
      
          return {
              json: JSON.stringify(myData)
          };
      });

      
      ```
 - using the data in the client side

     ```
   
         var elements = document.querySelectorAll("[data-json]");
        for (var i = 0; i < elements.length; i++) {
            var obj = JSON.parse(elements[i].dataset.json);
            //console.log(obj);
        }

    ```

  </details>
  <details>
    <summary>Working with Client-Side Templates</summary>
    
  - [example ](https://experienceleague.adobe.com/en/docs/experience-manager-htl/content/getting-started#working-with-client-side-templates)
  </details>
  
  </details>

  <details>
    <summary>HTL Java Use-API</summary>
     
  - The HTL Java Use-API enables an HTL file to access helper methods in a custom Java class.
  - Example
    - A HTL Component - info
    - HTL File : /apps/my-example/components/info.html

    ```
      <div>
      <h1>${properties.title}</h1>
      <p>${properties.description}</p>
      </div>
    
    ```

    - Content : /content/my-example/

    ```
      {
          "sling:resourceType": "my-example/component/info",
          "title": "My Example",
          "description": "This Is Some Example Content."
      }

    ```
    - Output File : /content/my-example.html

    ```
      <div>
      <h1>My Example</h1>
      <p>This Is Some Example Content.</p>
      </div>

    ```
    - Apply use-class , then the htl file changes to

    ```
      <div data-sly-use.info="Info">
          <h1>${info.lowerCaseTitle}</h1>
          <p>${info.lowerCaseDescription}</p>
      </div>
    
    ``` 
    - Create a Java class ( locally ) in the same folder of the component
      -  /apps/my-example/component/info/Info.java .

    ```
         package apps.my_example.components.info;
        
        import com.adobe.cq.sightly.WCMUsePojo;
        
        public class Info extends WCMUsePojo {
            private String lowerCaseTitle;
            private String lowerCaseDescription;
        
            @Override
            public void activate() throws Exception {
                lowerCaseTitle = getProperties().get("title", "").toLowerCase();
                lowerCaseDescription = getProperties().get("description", "").toLowerCase();
            }
        
            public String getLowerCaseTitle() {
                return lowerCaseTitle;
            }
        
            public String getLowerCaseDescription() {
                return lowerCaseDescription;
            }
        }

    ``` 


    - #### Local vs. Bundle Java Class
      - The Java use-class can be installed in two ways:
      - **Local** - In a local install, the Java source file is placed alongside the HTL file, in the same repository folder.<br/> The source is automatically compiled on demand. No separate compilation or packaging step is required.
      - **Bundle** - In a bundle install, the Java class must be compiled and deployed within an OSGi bundle using the standard AEM bundle deployment mechanism (see the section Bundled Java Class).
      - To know which method to use when, keep these two points in mind:
        - A local Java use-class is recommended when the use-class is specific to the component in question.
        - A bundle Java use-class is recommended when the Java code implements a service that is accessed from multiple HTL components.
      
  - **Context**:
    - The activate method is used to precompute and store (in member variables) the values needed in your HTL code, based on the current context (the current request and resource, for example).
    - The WCMUsePojo class provides access to the same set of context objects as are available within an HTL file (see the document Global Objects.)
    - In a class extending WCMUsePojo, you can access context objects using their names:
        - *<T> T get(String name, Class<T> type)*
    - Alternatively, you can access commonly used context objects directly using the appropriate convenience method listed in this table.
       <details>
        <summary>Table</summary>
        
        
        | Object	|Convenience Method |
        | ----------- | ----------- | 
        |  PageManager|	getPageManager()| 
        |   Page	| getCurrentPage()| 
        |   Page	| getResourcePage()| 
        |   ValueMap	| getPageProperties()| 
        |    ValueMap	| getProperties()| 
        |   Designer	| getDesigner()| 
        |   Design	| getCurrentDesign()| 
        |    Style	| getCurrentStyle()| 
        |    Component| 	getComponent()| 
        |    ValueMap	| getInheritedProperties()| 
        |    Resource	| getResource()| 
        |   ResourceResolver| 	getResourceResolver()| 
        |    SlingHttpServletRequest	| getRequest()| 
        |    SlingHttpServletResponse	| getResponse()| 
        |    SlingScriptHelper	| getSlingScriptHelper()| 
      </details>
    - 
  - 
  
    
  </details>

  
