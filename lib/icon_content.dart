import 'package:flutter/material.dart';


const labelTextStyle = TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98));
const kNumberTextStyle = TextStyle(
    fontSize: 50.0,
    fontWeight: FontWeight.w900);

const largeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);
const TitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
);
const resultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);
const KBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
);
const BodyTestStyle = TextStyle(
  fontSize: 22.0,
);


class IconCard extends StatelessWidget{

  IconCard({this.icon , this.label});

  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon,
          size: 80.0,),
        SizedBox(
          height: 15.0,
        ),
        Text(label,
            style: labelTextStyle),
      ],
    );
  }

}