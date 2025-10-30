class Car {
  static const String manufacturer = 'Toyota';
  

  final String model;
  final int year;
  

  static int _carCount = 0;
  

  Car(this.model, this.year) {
    _carCount++;  
  }
  
  const Car.constant(this.model, this.year);
  
 
  void displayInfo() {
    print('Manufacturer: $manufacturer');
    print('Model: $model');
    print('Year: $year');
  }
  

  static int getCarCount() {
    return _carCount;
  }
}
