1. How will you simulate concurrent modification through stream API ?
   - In Java, the Stream API does not directly support concurrent modification of streams. Streams in Java are designed to be operated in a non-concurrent manner. However, you can simulate concurrent modification by using concurrent data structures or by employing parallel streams.
   - reference : https://medium.com/@sum98kumar/java-developer-interview-questions-and-answers-b5732cd18c5b
   - 
2. How many thread will open for parallel stream and how parallel stream internally works ?
   -  The number of threads that will be opened for a parallel stream depends on the underlying ForkJoinPool that is used to execute parallel streams. Java uses the common ForkJoinPool by default.
   -  Here’s how you can set the parallelism level using system properties: System.setProperty("java.util.concurrent.ForkJoinPool.common.parallelism", "8"); // Set the parallelism level to 8
   -  reference: https://medium.com/@sum98kumar/java-interview-questions-9cb306e392d3
       1. Partitioning: When you create a parallel stream, it divides the elements of the stream into multiple smaller substreams. This process is called partitioning.
       2. Fork-Join Framework: Java’s ForkJoinPool implements a work-stealing algorithm. Each worker thread in the pool has its own deque (double-ended queue) of tasks. When a thread finishes its task, it can steal tasks from the deque of other threads that are busy.
       3. Recursive Task Execution: The tasks are executed recursively. When a task is encountered, the ForkJoinPool decides whether to split it into subtasks or execute it directly. If the task is large enough, it's split into smaller subtasks and distributed across the available worker threads.
       4. Joining Results: As the subtasks are executed, their results are combined using various operations (like summing, reducing, etc.) until the final result is obtained.

3. What are the changes of pegmen in JDK 8. (PermGen and Meta)?
   - PermGen (Permanent Generation) is a special heap space separated from the main memory heap.
     The JVM keeps track of loaded class metadata in the PermGen. Additionally, the JVM stores all the static content in this memory section. This includes all the static methods, primitive variables, and references to the static objects.
  - Metaspace is a new memory space – starting from the Java 8 version; it has replaced the older PermGen memory space. The most significant difference is how it handles memory allocation.
  Specifically, this native memory region grows automatically by default.
   We also have new flags to tune the memory:

    MetaspaceSize and MaxMetaspaceSize – we can set the Metaspace upper bounds.
    MinMetaspaceFreeRatio – is the minimum percentage of class metadata capacity free after garbage collection
    MaxMetaspaceFreeRatio – is the maximum percentage of class metadata capacity free after a garbage collection to avoid a reduction in the amount of space
4. What is the difference between normal REST service and Restful WS (Web Service)?
   - REST is the design, and RESTful is the implementation.
   - A RESTful web service is a specific type of web service that follows the REST constraints.
   - REST :
      - Client-Server, Statelessness, Cacheable, Layered System, Uniform Interface & Code on Demand
    - RESTful Web Service
       - Uses HTTP , Resource Oriented, Data Formats,
5. What are the different types of Http methods and their differences ?
      1. GET: 
    
        Purpose: Retrieves data from a server.
        Example: Fetching a webpage, retrieving a list of products.
        Characteristics: Safe (does not modify the server's state), idempotent (multiple identical requests produce the same result). 
    
    2. POST: 
    
        Purpose: Creates a new resource on the server.
        Example: Submitting a form, creating a new user account.
        Characteristics: Not safe (modifies the server's state), not idempotent (multiple identical requests might create multiple resources). 
    
    3. PUT: 
    
        Purpose: Replaces an existing resource on the server.
        Example: Updating a user's profile with new information.
        Characteristics: Not safe (modifies the server's state), idempotent (multiple identical requests update the resource to the same state). 
    
    4. PATCH: 
    
        Purpose: Partially updates an existing resource.
        Example: Updating a single field in a product record.
        Characteristics: Not safe (modifies the server's state), can be idempotent depending on how the server handles updates. 
    
    5. DELETE: 
    
        Purpose: Deletes a resource on the server.
        Example: Deleting a user account.
        Characteristics: Not safe (modifies the server's state), idempotent (multiple identical requests have the same effect). 
    
    Other HTTP Methods:
    
        HEAD: Similar to GET, but only returns the headers of the response, not the content body. 
    
    OPTIONS: Retrieves the communication options available for the target resource. 
    TRACE: Echoes the request message back to the client to help with debugging. 
    CONNECT: Establishes a tunnel connection to a server. 
    
    Key Differences:
    
        Safety:
        Safe methods (GET, HEAD, OPTIONS) do not modify the server's state, while others (POST, PUT, PATCH, DELETE) do.
        Idempotency:
        Idempotent methods (GET, HEAD, PUT, DELETE, OPTIONS) can be called multiple times without causing different outcomes, while non-idempotent methods (POST, TRACE) may have different results if called multiple times.
        Purpose:
        Each method is designed for a specific type of action on a resource (create, read, update, delete). 

   
