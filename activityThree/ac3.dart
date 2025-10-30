import 'dart:io';

// Mixins
mixin Walker {
  void walk() {
    print('It can walk.');
  }
}

mixin Flyer {
  void fly() {
    print('It can fly.');
  }
}

mixin Swimmer {
  void swim() {
    print('It can swim.');
  }
}

mixin Hunter {
  void hunt() {
    print('It can hunt.');
  }
}

// Base class
class Animal {
  final String name;
  
  Animal(this.name);
  
  void displayAbilities() {
    // This will be overridden in subclasses to show specific abilities
  }
}

// Subclasses
class Dog extends Animal with Walker {
  Dog(String name) : super(name);
  
  @override
  void displayAbilities() {
    print('$name abilities:');
    walk();
  }
}

class Bird extends Animal with Flyer, Walker {
  Bird(String name) : super(name);
  
  @override
  void displayAbilities() {
    print('$name abilities:');
    fly();
    walk();
  }
}

class Fish extends Animal with Swimmer {
  Fish(String name) : super(name);
  
  @override
  void displayAbilities() {
    print('$name abilities:');
    swim();
  }
}

// Extension: Add a class that uses Hunter mixin, e.g., a Tiger
class Tiger extends Animal with Walker, Hunter {
  Tiger(String name) : super(name);
  
  @override
  void displayAbilities() {
    print('$name abilities:');
    walk();
    hunt();
  }
}

void main() {
  List<Animal> animals = [];
  Set<String> uniqueNames = {};
  Map<String, String> animalHabitats = {};
  
  // Pre-add some animals
  animals.add(Dog('Buddy'));
  animals.add(Bird('Tweety'));
  animals.add(Fish('Nemo'));
  animals.add(Tiger('Sheru'));  // Extension: Added Tiger with Hunter mixin
  
  // Add to Set and Map
  for (var animal in animals) {
    uniqueNames.add(animal.name);
    // Assign habitats (example)
    if (animal is Dog) {
      animalHabitats[animal.name] = 'Land';
    } else if (animal is Bird) {
      animalHabitats[animal.name] = 'Sky';
    } else if (animal is Fish) {
      animalHabitats[animal.name] = 'Water';
    } else if (animal is Tiger) {
      animalHabitats[animal.name] = 'Jungle';
    }
  }
  
  // Display all animals
  print('All Animals:');
  for (var animal in animals) {
    animal.displayAbilities();
    print('');
  }
  
  // Display unique names
  print('Unique Animal Names: $uniqueNames');
  
  // Display habitats
  print('Animal Habitats: $animalHabitats');
  
  // Extension: User input to add new animals
  while (true) {
    print('\nAnimal Tracker Menu:');
    print('1. Add a Dog');
    print('2. Add a Bird');
    print('3. Add a Fish');
    print('4. Add a Tiger');
    print('5. Display all animals');
    print('6. Display animals grouped by ability');
    print('7. Exit');
    stdout.write('Enter your choice (1-7): ');
    
    String? choiceInput = stdin.readLineSync();
    if (choiceInput == null || choiceInput.trim().isEmpty) {
      print('Invalid input. Please try again.');
      continue;
    }
    
    int? choice = int.tryParse(choiceInput.trim());
    if (choice == null || choice < 1 || choice > 7) {
      print('Invalid choice. Please enter a number between 1 and 7.');
      continue;
    }
    
    if (choice == 7) {
      print('Exiting the program.');
      break;
    }
    
    switch (choice) {
      case 1:
      case 2:
      case 3:
      case 4:
        stdout.write('Enter the animal name: ');
        String? nameInput = stdin.readLineSync();
        if (nameInput == null || nameInput.trim().isEmpty) {
          print('Invalid name. Please try again.');
          continue;
        }
        String name = nameInput.trim();
        
        Animal? newAnimal;
        if (choice == 1) {
          newAnimal = Dog(name);
          animalHabitats[name] = 'Land';
        } else if (choice == 2) {
          newAnimal = Bird(name);
          animalHabitats[name] = 'Sky';
        } else if (choice == 3) {
          newAnimal = Fish(name);
          animalHabitats[name] = 'Water';
        } else if (choice == 4) {
          newAnimal = Tiger(name);
          animalHabitats[name] = 'Jungle';
        }
        
        if (newAnimal != null) {
          animals.add(newAnimal);
          uniqueNames.add(name);
          print('Animal added successfully!');
        }
        break;
      
      case 5:
        // Display all animals
        if (animals.isEmpty) {
          print('No animals added yet.');
        } else {
          for (var animal in animals) {
            animal.displayAbilities();
            print('');
          }
        }
        break;
      
      case 6:
        // Extension: Display animals grouped by ability
        displayGroupedByAbility(animals);
        break;
    }
  }
}

// Extension: Method to display animals grouped by ability
void displayGroupedByAbility(List<Animal> animals) {
  List<String> walkers = [];
  List<String> flyers = [];
  List<String> swimmers = [];
  List<String> hunters = [];
  
  for (var animal in animals) {
    if (animal is Walker) {
      walkers.add(animal.name);
    }
    if (animal is Flyer) {
      flyers.add(animal.name);
    }
    if (animal is Swimmer) {
      swimmers.add(animal.name);
    }
    if (animal is Hunter) {
      hunters.add(animal.name);
    }
  }
  
  print('Walkers: $walkers');
  print('Flyers: $flyers');
  print('Swimmers: $swimmers');
  print('Hunters: $hunters');
}