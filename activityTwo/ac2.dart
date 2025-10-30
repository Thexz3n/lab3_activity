class Car {
  // Static const manufacturer (same for all cars)
  static const String manufacturer = 'Toyota';
  
  // Final variables for model and year (immutable per instance)
  final String model;
  final int year;
  
  // Static counter to track number of Car objects created
  static int _carCount = 0;
  
  // Constructor to initialize model and year
  Car(this.model, this.year) {
    _carCount++;  // Increment counter on creation
  }
  
  // Const constructor for compile-time constants (extension)
  // Note: Const constructors require all fields to be final and initialized.
  // The static counter won't increment for const objects since they are compile-time constants.
  const Car.constant(this.model, this.year);
  
  // Method to display car information
  void displayInfo() {
    print('Manufacturer: $manufacturer');
    print('Model: $model');
    print('Year: $year');
  }
  
  // Static method to get the total count of cars created
  static int getCarCount() {
    return _carCount;
  }
}

void main() {
  // Create multiple Car objects
  Car car1 = Car('Camry', 2020);
  Car car2 = Car('Corolla', 2019);
  Car car3 = Car('RAV4', 2021);
  
  // Create a const Car object using the const constructor (extension)
  const Car car4 = const Car.constant('Prius', 2022);
  
  // Display information for each car
  print('Car 1:');
  car1.displayInfo();
  print('');
  
  print('Car 2:');
  car2.displayInfo();
  print('');
  
  print('Car 3:');
  car3.displayInfo();
  print('');
  
  print('Car 4 (const):');
  car4.displayInfo();
  print('');
  
  // Display total count (extension)
  print('Total cars created: ${Car.getCarCount()}');
  // Note: The const car (car4) does not increment the counter since const objects are compile-time constants.
  
  // Extension: Attempting to modify a final variable (this would cause a compile-time error)
  // Uncomment the line below to see the error:
  // car1.model = 'New Model';  // Error: The final variable 'model' can only be set once.
}