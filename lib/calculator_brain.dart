import 'dart:math';


class CalculatorBrain{
   CalculatorBrain({this.height, this.weight,});

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI(){

     _bmi = weight/ pow(height/ 100, 2);
    return _bmi.toStringAsFixed(1); // 1: kam ra2m b3d el 3lama//

}
  String getResult(){
    if(_bmi >=25){
      return 'Over Weight';
    }else if (_bmi >18){
      return 'Normal';
    } else {
      return'Under Weight';
    }
  }
  String getFeedBack(){
    if(_bmi >=25){
      return 'You have a higher than normal body weight. Try to exercises more. ';
    }else if (_bmi >18){
      return 'You have normal body. Good job!';
    } else {
      return'You have lower than normal body. You can eat more.';
    }
  }

}