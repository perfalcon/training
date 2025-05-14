# Patterns
<details>
    <summary>1.Singleton</summary>

1. Singleton
    - The Singleton pattern in Java ensures that a class has only one instance and provides a global point of access to it. This pattern is useful when exactly one object is needed to coordinate actions across the system, such as managing a database connection or a configuration file.
   ```
            public class Singleton {
            private static Singleton instance;
        
            private Singleton() {
                // Private constructor to prevent external instantiation
            }
        
            public static Singleton getInstance() {
                if (instance == null) {
                    instance = new Singleton();
                }
                return instance;
            }
        
            public void doSomething() {
                System.out.println("Singleton is doing something!");
            }
        
            public static void main(String[] args) {
                Singleton singleton = Singleton.getInstance();
                singleton.doSomething();
            }
        }
</details>   
<details>
    <summary>2. Builder</summary>
2. Builder
   - The builder pattern allows you to enforce a step-by-step process to construct a complex object as a finished product.
   - Create the setter methods and call them in the order for the final activity to be completed.
   - ref: https://springframework.guru/gang-of-four-design-patterns/builder-pattern/
</details>
<details>
    <summary>3. Factory</summary>
3. Factory
       - The Factory Pattern is a creational design pattern that provides an interface for creating objects, but allows subclasses to alter the type of objects that will be created.
       - It encapsulates object creation, promoting loose coupling and flexibility in code.
       - There are two main types of factory patterns: Factory Method and Abstract Factory.
       ###  Factory Method:
          - The Factory Method pattern defines an interface for creating an object, but lets subclasses decide which class to instantiate.
          - This allows a class to defer instantiation to subclasses.
             ```
                    // Product interface
                    interface Animal {
                        String makeSound();
                    }
                    
                    // Concrete products
                    class Dog implements Animal {
                        @Override
                        public String makeSound() {
                            return "Woof!";
                        }
                    }
                    
                    class Cat implements Animal {
                        @Override
                        public String makeSound() {
                            return "Meow!";
                        }
                    }
                    
                    // Creator interface
                    interface AnimalFactory {
                        Animal createAnimal();
                    }
                    
                    // Concrete creators
                    class DogFactory implements AnimalFactory {
                        @Override
                        public Animal createAnimal() {
                            return new Dog();
                        }
                    }
                    
                    class CatFactory implements AnimalFactory {
                        @Override
                        public Animal createAnimal() {
                            return new Cat();
                        }
                    }
                    
                    // Client code
                    public class Main {
                        public static void main(String[] args) {
                            AnimalFactory dogFactory = new DogFactory();
                            Animal dog = dogFactory.createAnimal();
                            System.out.println(dog.makeSound()); // Output: Woof!
                    
                            AnimalFactory catFactory = new CatFactory();
                            Animal cat = catFactory.createAnimal();
                            System.out.println(cat.makeSound()); // Output: Meow!
                        }
                    }
              ```
      ### Abstract Factory
        - The Abstract Factory pattern provides an interface for creating families of related or dependent objects without specifying their concrete classes
      ```
      // Abstract products
          interface Chair {
              void sitOn();
          }
          
          interface Table {
              void use();
          }
          
          // Concrete products
          class ModernChair implements Chair {
              @Override
              public void sitOn() {
                  System.out.println("Sitting on a modern chair!");
              }
          }
          
          class ModernTable implements Table {
              @Override
              public void use() {
                  System.out.println("Using a modern table!");
              }
          }
          
          class VictorianChair implements Chair {
              @Override
              public void sitOn() {
                  System.out.println("Sitting on a Victorian chair!");
              }
          }
          
          class VictorianTable implements Table {
              @Override
              public void use() {
                  System.out.println("Using a Victorian table!");
              }
          }
          
          // Abstract factory
          interface FurnitureFactory {
              Chair createChair();
              Table createTable();
          }
          
          // Concrete factories
          class ModernFurnitureFactory implements FurnitureFactory {
              @Override
              public Chair createChair() {
                  return new ModernChair();
              }
          
              @Override
              public Table createTable() {
                  return new ModernTable();
              }
          }
          
          class VictorianFurnitureFactory implements FurnitureFactory {
              @Override
              public Chair createChair() {
                  return new VictorianChair();
              }
          
              @Override
              public Table createTable() {
                  return new VictorianTable();
              }
          }
          
          // Client code
          public class Main {
              public static void main(String[] args) {
                  FurnitureFactory modernFactory = new ModernFurnitureFactory();
                  Chair modernChair = modernFactory.createChair();
                  Table modernTable = modernFactory.createTable();
                  modernChair.sitOn(); // Output: Sitting on a modern chair!
                  modernTable.use();  // Output: Using a modern table!
          
                  FurnitureFactory victorianFactory = new VictorianFurnitureFactory();
                  Chair victorianChair = victorianFactory.createChair();
                  Table victorianTable = victorianFactory.createTable();
                  victorianChair.sitOn(); // Output: Sitting on a Victorian chair!
                  victorianTable.use();  // Output: Using a Victorian table!
              }
          }
      ```
</details>
 <details>
    <summary>4. Prototype</summary>     
4. Prototype:
   - The Prototype pattern is a creational design pattern that enables the creation of new objects by cloning an existing object, known as the prototype.
   - This pattern is useful when creating new objects is costly or complex, and it's more efficient to copy an existing object and modify it as needed.
   - Implementation
      - Prototype Interface/Abstract Class: Declares the clone() method.
      - Concrete Prototypes: Implement the clone() method to return a copy of themselves.
      - Client: Creates new objects by calling the clone() method on a prototype object.
      ```
            // Prototype interface
        interface Shape extends Cloneable {
            Shape clone();
            void draw();
        }
        
        // Concrete prototype class
        class Circle implements Shape {
            private int radius;
        
            public Circle(int radius) {
                this.radius = radius;
            }
        
            public int getRadius() {
                return radius;
            }
        
            public void setRadius(int radius) {
                this.radius = radius;
            }
        
            @Override
            public Circle clone() {
                try {
                    return (Circle) super.clone();
                } catch (CloneNotSupportedException e) {
                    throw new AssertionError(); // Won't happen because Circle implements Cloneable
                }
            }
        
            @Override
            public void draw() {
                System.out.println("Drawing circle with radius: " + radius);
            }
        }
        
        // Client class
        public class PrototypePatternExample {
            public static void main(String[] args) {
                Circle circlePrototype = new Circle(5);
                Circle newCircle = circlePrototype.clone();
                newCircle.setRadius(10);
        
                circlePrototype.draw(); // Output: Drawing circle with radius: 5
                newCircle.draw();      // Output: Drawing circle with radius: 10
            }
        }
        ```
              
        - Advantages
            - Reduces the need for subclassing.
            - Hides the complexity of creating objects.
            - Allows adding or removing objects at runtime.
            - Provides a way to create copies of objects with complex configurations.
        
        - Disadvantages        
            - Cloning complex objects can be challenging, especially when dealing with circular references.
            - Requires implementing the Cloneable interface and handling CloneNotSupportedException.
 </details>  
 <details>
    <summary>5. Adapter</summary>     
5. Adapter    
     - The Adapter Pattern is a structural design pattern that enables objects with incompatible interfaces to collaborate.
     - It acts as a bridge, converting the interface of one class (the adaptee) into an interface (the target) that a client expects.
     - This allows the client to use the adaptee's functionality without modifying the adaptee's code.
     - Two types of adapters:
          - Object Adapter:
            - Uses composition. The adapter class holds an instance of the adaptee and implements the target interface by delegating calls to the adaptee.
          - Class Adapter:
            - Uses inheritance. The adapter class inherits from both the target interface and the adaptee class. This approach is less common in Java due to its single inheritance limitation.
     - Participants in the Adapter Pattern:
       - Target Interface: Defines the interface that the client expects to use.
       - Adaptee: The existing class with an incompatible interface.
       - Adapter: Implements the target interface and adapts the adaptee's interface to the target interface. 
       - Client: The class that uses the target interface to interact with the adaptee through the adapter.
       ```
            // Target Interface
        interface Shape {
            void draw();
        }
        
        // Adaptee
        class LegacyRectangle {
            public void display(int x, int y, int w, int h) {
                System.out.println("Legacy Rectangle: x=" + x + ", y=" + y + ", width=" + w + ", height=" + h);
            }
        }
        
        // Adapter
        class RectangleAdapter implements Shape {
            private LegacyRectangle rectangle;
            private int x, y, w, h;
        
            public RectangleAdapter(LegacyRectangle rectangle, int x, int y, int w, int h) {
                this.rectangle = rectangle;
                this.x = x;
                this.y = y;
                this.w = w;
                this.h = h;
            }
        
            @Override
            public void draw() {
                rectangle.display(x, y, w, h);
            }
        }
        
        // Client
        public class Main {
            public static void main(String[] args) {
                LegacyRectangle legacyRectangle = new LegacyRectangle();
                RectangleAdapter adapter = new RectangleAdapter(legacyRectangle, 10, 20, 30, 40);
                adapter.draw(); // Output: Legacy Rectangle: x=10, y=20, width=30, height=40
            }
        }
        ```
       
       - Benefits of the Adapter Pattern:
         - Allows reusing existing classes that have incompatible interfaces.
         - Separates the client from the adaptee, promoting loose coupling.
         - Improves code maintainability and flexibility.
        
       - When to Use the Adapter Pattern:
         - When you want to use an existing class, but its interface does not match the one you need.
         - When you want to create a reusable class that can work with different, unforeseen classes.
         - When you need to use several existing subclasses, but it's impractical to adapt their interface by modifying their parent class.
</details>
<details>
    <summary>6. Observer</summary>
6. Observer
    - The Observer pattern is a behavioral design pattern that establishes a one-to-many dependency between objects.
    - When the state of one object (the subject) changes, all its dependents (observers) are automatically notified and updated.
    - This pattern is useful in scenarios where a change in one object requires corresponding actions in other objects, without tightly coupling the objects together
      - Here's how the Observer pattern is typically implemented in Java:        
       - Subject Interface: Defines methods for attaching, detaching, and notifying observers.        
       - Concrete Subject: Implements the Subject interface, maintains a list of observers, and notifies them of state changes. 
       - Observer Interface: Defines the update method that observers must implement.
       - Concrete Observers: Implement the Observer interface and react to state changes in the subject.
     ```
             // Subject interface
        interface Subject {
            void attach(Observer observer);
            void detach(Observer observer);
            void notifyObservers();
        }
        
        // Concrete Subject
        class ConcreteSubject implements Subject {
            private List<Observer> observers = new ArrayList<>();
            private String state;
        
            public String getState() {
                return state;
            }
        
            public void setState(String state) {
                this.state = state;
                notifyObservers();
            }
        
            @Override
            public void attach(Observer observer) {
                observers.add(observer);
            }
        
            @Override
            public void detach(Observer observer) {
                observers.remove(observer);
            }
        
            @Override
            public void notifyObservers() {
                for (Observer observer : observers) {
                    observer.update(state);
                }
            }
        }
        
        // Observer interface
        interface Observer {
            void update(String state);
        }
        
        // Concrete Observers
        class ConcreteObserverA implements Observer {
            @Override
            public void update(String state) {
                System.out.println("ConcreteObserverA: State changed to " + state);
            }
        }
        
        class ConcreteObserverB implements Observer {
            @Override
            public void update(String state) {
                System.out.println("ConcreteObserverB: State changed to " + state);
            }
        }
        
        // Example usage
        public class ObserverPatternExample {
            public static void main(String[] args) {
                ConcreteSubject subject = new ConcreteSubject();
        
                ConcreteObserverA observerA = new ConcreteObserverA();
                ConcreteObserverB observerB = new ConcreteObserverB();
        
                subject.attach(observerA);
                subject.attach(observerB);
        
                subject.setState("New State");
                subject.detach(observerA);
                subject.setState("Another State");
            }
        }
      ``` 
</details>

7. Circuit Breaker - MicroServices
 - The Circuit Breaker pattern is a design pattern used to prevent cascading failures in distributed systems, especially microservices, by isolating faulty services. It acts like an electrical circuit breaker, tripping and isolating a service that's experiencing a high rate of failures, preventing further requests from overloading it and potentially impacting other parts of the system.
 - State Transitions:
     - A circuit breaker typically operates in three states:
     - Closed: Requests pass through normally, and the system monitors for failures.
     - Open: All requests to the service are blocked, preventing further failures and giving the service time to recover.
     - Half-Open: After a timeout period, a small number of test requests are allowed to determine if the service has recovered. If the test requests are successful, the circuit breaker returns to the closed state. If they fail, it returns to the open state.
 - Failure Detection:
     - The circuit breaker monitors the number of failures or the failure rate within a specific time window. When the failure rate exceeds a predefined threshold, the circuit breaker trips and transitions to the open state. 
 - Benefits:
     - Prevents Cascading Failures: By isolating failing services, the circuit breaker prevents failures from spreading to other parts of the system.
     - Improved System Resilience: The system can handle temporary failures without completely shutting down.
     - Resource Optimization: Repeated failed requests are avoided, freeing up resources for other parts of the system. 
8. 
