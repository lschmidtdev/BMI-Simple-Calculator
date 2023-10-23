
import 'package:bmi_calculator_dio/person/person.dart';
import 'package:bmi_calculator_dio/utils/utils.dart';

void main() {
  print('----- BMI Calculator -----');
  double weight, height, bmi;
  String name = '';
  String bmiClassifications = '';
  Person person = Person();

  while(true){
    try{
      name = Utils.askForString('Enter your name: ');
      person.setName(name);
      break;
    } on Exception catch (e){
      print(e.toString()); 
      if (Utils.askToAbort()){
        return;
      } else {
        print('Please enter a valid name');
      }
    }
  }

  while (true) {
    try {

      weight = Utils.askForDouble('Enter your weight in kg: ');
height = Utils.askForDouble('Enter your height in cm: ');
person.setHeight(height);
person.setWeight(weight);

bmi = Utils.calculateBmi(weight: weight, height: height);
person.setBmi(bmi.toString());

bmiClassifications = Utils.bmiClassifications(bmi);
person.setBmiClassifications(bmiClassifications);

break;
    } on Exception catch (e) {
      print(e.toString());
      if (Utils.askToAbort()) {
        return;
      }else{
        print('Please enter a valid number');
      }
    }
  }

  print(Utils.printResults(
    person.getName(), 
    person.getWeight(), 
    person.getHeight(), 
    person.getBmi(), 
    person.getBmiClassifications()));
}