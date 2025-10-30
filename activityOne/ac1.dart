import 'dart:io';

double celsiusToFahrenheit(double celsius) {
  return (celsius * 9 / 5) + 32;
}

double fahrenheitToCelsius(double fahrenheit) {
  return (fahrenheit - 32) * 5 / 9;
}

double celsiusToKelvin(double celsius) {
  return celsius + 273.15;
}

double kelvinToCelsius(double kelvin) {
  return kelvin - 273.15;
}


void showMenu() {
  print('Temperature Converter');
  print('1. Celsius to Fahrenheit');
  print('2. Fahrenheit to Celsius');
  print('3. Celsius to Kelvin');
  print('4. Kelvin to Celsius');
  print('5. Exit');
}
void main() {
  while (true) {
    showMenu();
    stdout.write('Enter your choice (1-5): ');
    
    String? choiceInput = stdin.readLineSync();
    if (choiceInput == null || choiceInput.trim().isEmpty) {
      print('Invalid input. Please try again.');
      continue;
    }
    
    int? choice = int.tryParse(choiceInput.trim());
    if (choice == null || choice < 1 || choice > 5) {
      print('Invalid choice. Please enter a number between 1 and 5.');
      continue;
    }
    
    if (choice == 5) {
      print('Exiting the program.');
      break;
    }
    
    stdout.write('Enter the temperature value: ');
    String? tempInput = stdin.readLineSync();
    if (tempInput == null || tempInput.trim().isEmpty) {
      print('Invalid input. Please try again.');
      continue;
    }
    
    double? temp = double.tryParse(tempInput.trim());
    if (temp == null) {
      print('Invalid temperature value. Please enter a valid number.');
      continue;
    }
    
    double result;
    String fromUnit, toUnit;
    
    switch (choice) {
      case 1:
        result = celsiusToFahrenheit(temp);
        fromUnit = 'C';
        toUnit = 'F';
        break;
      case 2:
        result = fahrenheitToCelsius(temp);
        fromUnit = 'F';
        toUnit = 'C';
        break;
      case 3:
        result = celsiusToKelvin(temp);
        fromUnit = 'C';
        toUnit = 'K';
        break;
      case 4:
        result = kelvinToCelsius(temp);
        fromUnit = 'K';
        toUnit = 'C';
        break;
      default:
        continue; 
    }
    
    print('${temp.toStringAsFixed(2)} $fromUnit = ${result.toStringAsFixed(2)} $toUnit');
  }
}