import 'dart:convert';
import 'dart:io';
class Utils {

  static double askForDouble(String prompt) {
    while (true) {
      stdout.write(prompt);
      final input = stdin.readLineSync();
      if (input == null) {
        throw Exception('Input was null!');
      }
      try {
        return double.parse(input);
      } on FormatException {
         throw Exception('Invalid number!');
      }
    }
  }

static askForString(String prompt) {
  stdout.write(prompt);
  final input = stdin.readLineSync(encoding: utf8);
  if (input == null || input.isEmpty) {
    throw Exception('Input was null or empty!');
  }
  return input;
}

static double calculateBmi({required double weight, required double height}) {
  if (weight <= 0 || height <= 0) {
    throw Exception('Weight and height must be positive and non-zero!');
  }
  final heightInMeters = height / 100;
  final bmi = weight / (heightInMeters * heightInMeters);
  return double.parse(bmi.toStringAsFixed(2));
}

static bool askToAbort() {
  stdout.write('Do you want to abort the calculator? (y/n) ');
  final input = stdin.readLineSync()?.toLowerCase();
  return input == 'y' || input == 'yes';
}

static String bmiClassifications(double bmi) {
  if (bmi < 16.0) {
    return 'Severe Underweight'; // BMI < 16.0
  } else if (bmi <= 17.0) {
    return 'Moderate Underweight'; // 16.0 <= BMI < 17.0
  } else if (bmi <= 18.5) {
    return 'Underweight'; // 17.0 <= BMI < 18.5
  } else if (bmi <= 25.0) {
    return 'Healthy'; // 18.5 <= BMI < 25.0
  } else if (bmi <= 30.0) {
    return 'Overweight'; // 25.0 <= BMI < 30.0
  } else if (bmi <= 35.0) {
    return 'Obese Class I'; // 30.0 <= BMI < 35.0
  } else if (bmi <= 40.0) {
    return 'Obese Class II (Severe)'; // 35.0 <= BMI < 40.0
  } else {
    return 'Obese Class III (Morbid)'; // BMI >= 40.0
  }
}

static String printResults (String name, double weight, double height, String bmi, String bmiClassifications) {
  return ''' --- Here are your results ---
  Name: $name
  Weight: $weight kg
  Height: $height cm
  BMI: $bmi
  BMI Classification: $bmiClassifications

  Thank you for using the BMI Calculator!

  --- Finishing the program ---
''';
}

}