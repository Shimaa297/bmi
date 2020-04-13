import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'input_page.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResult, @required this.resultText , @required this.feedBack});
  final String bmiResult;
  final String resultText;
  final String feedBack;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULAT')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text('Your Result', style: TitleTextStyle ,),
            ),
          ),
          Expanded(
            flex: 10,
            child: Rusable(colour: activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                   Text(
                     resultText,
                     style: resultTextStyle,
                   ),
                  Text(
                    bmiResult,
                    style: KBMITextStyle,
                  ),
                  Text(
                    feedBack,
                    textAlign: TextAlign.center,
                    style: BodyTestStyle,
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}


