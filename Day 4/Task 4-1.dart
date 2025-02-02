// 4-1
// Create a base class `Animal` with:
// - A method `makeSound()` that prints: "Animal makes a sound."
// Create two subclasses:
// 1. `Dog` → Overrides `makeSound()` to print "Dog barks."
// 2. `Cat` → Overrides `makeSound()` to print "Cat meows."
// In `main()`, create `Dog` and `Cat` objects and call `makeSound()`.

void main() {
  Dog dog = Dog();
  Cat cat = Cat();
  dog.makeSound();
  cat.makeSound();
}

class Animal {
  void makeSound() {
    print("Animal makes a sound.");
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("Dog barks.");
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print("Cat meows.");
  }
}
