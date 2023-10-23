class Person {
  String _name = "";
  double _height = 0.0;
  double _weight = 0.0;
  String _bmi = "";
  String _bmiClassifications = '';

  void setName(String name){
    _name = name;
  }

  String getName(){
    return _name;
  }

  void setHeight(double height){
    _height = height;
  }

  double getHeight(){
    return _height;
  }

  void setWeight(double weight){
    _weight = weight;
  } 

  double getWeight(){
    return _weight;
  }

  void setBmi(String bmi){
    _bmi = bmi;
  }

  String getBmi(){
    return _bmi;
  }

  void setBmiClassifications(String bmiClassifications){
    _bmiClassifications = bmiClassifications;
  }

  String getBmiClassifications(){
    return _bmiClassifications;
  } 

}