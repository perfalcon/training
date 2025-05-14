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

6. What is Method Reference and Functional Interface?
    Reference : https://medium.com/@kumar.atul.2122/java-8-lambda-functional-interface-method-reference-stream-api-and-optional-class-f685143635fb

    A functional interface is an interface that contains exactly one abstract method.
    ```
    Define:
          @FunctionalInterface
      interface MyFunctionalInterface {
          void doSomething();
      }
    Usage:
       public class Main {
       public static void main(String[] args) {
           MyFunctionalInterface myLambda = () -> System.out.println("Hello, world!");
           myLambda.doSomething();
       }
   }
   ```
    Java provides several built-in functional interfaces that you can use directly in your code. Here are some examples:
   
    - java.lang.Runnable: This functional interface represents a task that can be executed asynchronously. It has a single abstract method, run(), which takes no arguments and returns no value.
    - java.util.function.Consumer<T>: This functional interface represents an operation that takes a single input and returns no result. It has a single abstract method, accept(T t), which takes an object of type T as its argument and returns no value.
    - java.util.function.Supplier<T>: This functional interface represents a supplier of results. It has a single abstract method, get(), which takes no arguments and returns an object of type T.
    - java.util.function.Predicate<T>: This functional interface represents a predicate (a boolean-valued function) of one argument. It has a single abstract method, test(T t), which takes an object of type T as its argument and returns a boolean.
    - java.util.function.Function<T,R>: This functional interface represents a function that takes one argument and returns a result. It has a single abstract method, apply(T t), which takes an object of type T as its argument and returns an object of type R.
    - java.util.Comparator<T>: This functional interface represents a function that can compare two objects of type T. It has a single abstract method, compare(T o1, T o2), which takes two objects of type T as its arguments and returns an integer value that represents their order.

   Method reference:
    - Method references in Java allow you to refer to an existing method by name instead of defining a new lambda expression. It is a shorthand notation for writing lambdas that call a single method.

   There are four types of method references:
    - Reference to a static method: You can refer to a static method using the Classname::methodname syntax. For example, Math::max refers to the max() method of the Math class.
    - Reference to an instance method of an object: You can refer to an instance method of an object using the object::methodname syntax. For example, if you have an object person of the Person class, you can refer to its getName() method using person::getName.
  
    - Reference to an instance method of a class: You can refer to an instance method of a class using the Classname::methodname syntax. For example, String::length refers to the length() method of the String class.
    - Reference to a constructor: You can refer to a constructor using the Classname::new syntax. For example, ArrayList::new refers to the default constructor of the ArrayList class.
  
   Stream API:
    - stream api enables to perform operations on collections of data. The Stream API provides a fluent and functional way to perform filter/map/reduce operations on collections.
      ```
        // use the Stream API to filter the list of integers
        List<Integer> evenNumbers = numbers.stream()
                                           .filter(n -> n % 2 == 0)
                                           .toList();
      ```
   Optional class:
    - The Optional class in Java is a container object that may or may not contain a non-null value. It is often used as a return type in methods to indicate that the method may or may not return a result.
      Advantages of using Optional:
        1. Avoiding null pointer exceptions: By using Optional instead of null values, you can avoid null pointer exceptions, which are a common source of bugs in Java programs. If you try to access the value of an Optional that is empty, you will get an NoSuchElementException instead of a null pointer exception.
        2. Improved readability: Using Optional in your code makes it more clear that a value may or may not be present. This can make your code more readable and easier to understand for other developers.
        3. Encouraging defensive programming: By using Optional, you are encouraged to write defensive code that handles null values in a clear and explicit way. This can help to prevent bugs and make your code more robust.
        4. Better code design: Using Optional can encourage you to design your code in a way that makes null values less common. For example, you may choose to use default values or other techniques to handle missing data instead of using null values directly.

7. Please define Overridden rules for default/static method in java 8.
  - Default method in Java is a method in java which are defined inside the interface with the keyword default is known as the default method.
  - It is a type of non-abstract method.
  - This method is capable of adding backward capability so that the old interface can grasp the lambda expression capability.
  - Java Interface Default method is also known as Defender Method or virtual extension method.
  - It is not mandatory to override the default method in Java.
  - If we are using Only one interface in a Program then at a time we are using only a single default method and at that time Overriding is not required.
  - But when more than two Interfaces are used and both act as parent class then at that time Overriding of the Default Method is required
    
8. what is database sharding?
   - Database sharding is a technique used to distribute data across multiple database servers, enabling scalability and improved performance for very large datasets.
   - Instead of storing everything on a single server, data is split into smaller chunks, called shards, and placed on different servers, each handling a portion of the total data.
   - This approach helps manage large workloads, reduces the load on individual servers, and can improve query speeds
      Scalability, Reduce Load, Parallel Processing, Fault Tolerance, Different Sharding Strategies & NoSQL and SQL
9. please give brief description about hashcode() and equals()
      equals():
          - Definition:
          equals() is a method used to determine if two objects are logically equal. It compares the content or properties of the objects rather than just their memory addresses.
          - Purpose:
             Determines if two objects are equivalent based on their data, not just their reference in memory.
          - Overriding:
             It's often overridden in custom classes to define what constitutes equality for those classes.
          - Importance:
             Used by collections like HashSet to ensure that only unique elements are stored, and by methods like contains() to check if a collection contains a specific object. 
      
      - hashCode():      
          - Definition:
             hashCode() is a method that returns an integer value representing an object. This value is used by hash-based data structures for efficient storage and retrieval.
          - Purpose:
            Provides a numerical identifier for an object that can be used to quickly locate the object within a collection. 
          - Overriding:
            It's often overridden in custom classes to ensure that equal objects have the same hash code and that hash code is well-distributed. 
          - Importance:
            In hash-based collections like HashMap, hashCode() is used to determine the bucket where an object should be stored, and equals() is then used to find the object within that bucket.
      - hashCode() and equals() contract:
         - The basic rule of the contract states that if two objects are equal to each other based on equals() method, then the hash code must be the same,
         - but if the hash code is the same, then equals() can return false.
   

12. 
