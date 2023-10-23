import 'package:test/test.dart';
import 'package:bmi_calculator_dio/utils/utils.dart';

void main() {
  group('calculateBmi', () {
  final testData = [
    {'weight': 70.0, 'height': 170.0, 'expected': 24.22},
    {'weight': 0.0, 'height': 170.0, 'throws': true},
    {'weight': 70.0, 'height': 0.0, 'throws': true},
    {'weight': -70.0, 'height': 170.0, 'throws': true},
    {'weight': 70.0, 'height': -170.0, 'throws': true},
  ];

  for (final data in testData) {
    final weight = data['weight'] as double;
    final height = data['height'] as double;
    final expected = data['expected'] as double?;
    final throws = data['throws'] as bool?;

    test('Entry: weight=$weight, height=$height --- Expected: $expected', () {
      if (throws != null && throws) {
        expect(() => Utils.calculateBmi(weight: weight, height: height), throwsException);
      } else {
        expect(Utils.calculateBmi(weight: weight, height: height), equals(expected));
      }
    });
  }
});

 group('bmiClassifications', () {
  final testData = [
    {'bmi': 15.0, 'expected': 'Severe Underweight'},
    {'bmi': 16.5, 'expected': 'Moderate Underweight'},
    {'bmi': 18.0, 'expected': 'Underweight'},
    {'bmi': 22.0, 'expected': 'Healthy'},
    {'bmi': 27.5, 'expected': 'Overweight'},
    {'bmi': 32.5, 'expected': 'Obese Class I'},
    {'bmi': 37.5, 'expected': 'Obese Class II (Severe)'},
    {'bmi': 42.0, 'expected': 'Obese Class III (Morbid)'},
  ];

  for (final data in testData) {
    final bmi = data['bmi'] as double;
    final expected = data['expected'] as String;

    test('returns correct classification for: BMI $bmi / BMI Classification $expected', () {
      expect(Utils.bmiClassifications(bmi), equals(expected));
    });
  }
});
}