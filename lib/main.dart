import 'package:flutter/material.dart';
import 'input_page.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "BMI",
    theme: ThemeData.dark().copyWith(
      primaryColor: Color(0xFF0A0E21),
      scaffoldBackgroundColor: Color(0xFF0A0E21),
    ),
    home: Inputpage(),
  ));
}


