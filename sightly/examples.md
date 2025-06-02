#[HTL](https://experienceleague.adobe.com/en/docs/experience-manager-htl/content/getting-started)

[HTL Specification](https://github.com/adobe/htl-spec/blob/master/SPECIFICATION.md#121-display-context)



<details>
  <summary>Block and Expressions</summary>
  
  - Block Statements: to display the h1 element conditionally, use a data-sly-test 
  
 
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
  
  - data-sly-list
  - data-sly-repeat
</details>

  
