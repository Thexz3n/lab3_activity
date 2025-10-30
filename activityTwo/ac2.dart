
import 'dart:io';
import 'cars.dart';


void showMenu() {
  print('\nCar Information System');
  print('1. Add a new car');
  print('2. Display all cars');
  print('3. Display total car count');
  print('4. Exit');
}
void main() {
  List<Car> cars = []; 
  
  while (true) {
    showMenu();
    stdout.write('Enter your choice (1-4): ');
    
    String? choiceInput = stdin.readLineSync();
    if (choiceInput == null || choiceInput.trim().isEmpty) {
      print('Invalid input. Please try again.');
      continue;
    }
    
    int? choice = int.tryParse(choiceInput.trim());
    if (choice == null || choice < 1 || choice > 4) {
      print('Invalid choice. Please enter a number between 1 and 4.');
      continue;
    }
    
    if (choice == 4) {
      print('Exiting the program.');
      break;
    }
    
    switch (choice) {
      case 1:

        stdout.write('Enter the car model: ');
        String? modelInput = stdin.readLineSync();
        if (modelInput == null || modelInput.trim().isEmpty) {
          print('Invalid model. Please try again.');
          continue;
        }
        String model = modelInput.trim();
        
        stdout.write('Enter the production year: ');
        String? yearInput = stdin.readLineSync();
        if (yearInput == null || yearInput.trim().isEmpty) {
          print('Invalid year. Please try again.');
          continue;
        }
        
        int? year = int.tryParse(yearInput.trim());
        if (year == null || year < 1886 || year > DateTime.now().year) {  // Basic validation: cars invented ~1886
          print('Invalid year. Please enter a valid year.');
          continue;
        }
        

        Car newCar = Car(model, year);
        cars.add(newCar);
        print('Car added successfully!');
        break;
      
      case 2:

        if (cars.isEmpty) {
          print('No cars added yet.');
        } else {
          for (int i = 0; i < cars.length; i++) {
            print('\nCar ${i + 1}:');
            cars[i].displayInfo();
          }
        }
        break;
      
      case 3:
        print('Total cars created: ${Car.getCarCount()}');
        break;
    }
  }

}