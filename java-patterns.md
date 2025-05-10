# Patterns
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
   

2. Builder
   - The builder pattern allows you to enforce a step-by-step process to construct a complex object as a finished product.
   - Create the setter methods and call them in the order for the final activity to be completed.
   - ref: https://springframework.guru/gang-of-four-design-patterns/builder-pattern/

3. Factory
   - The Factory Pattern is a creational design pattern that provides an interface for creating objects, but allows subclasses to alter the type of objects that will be created.
   - It encapsulates object creation, promoting loose coupling and flexibility in code.
   - There are two main types of factory patterns: Factory Method and Abstract Factory.
   ### Factory Method:
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
5. Prototype:
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
   
