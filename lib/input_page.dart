import 'package:bmi/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'package:bmi/calculator_brain.dart';


const bottomContainerHeight = 70.0;
const activeCardColour = Color(0xFF1D1E33);
const bottomContainerColour = Color(0xFFEB1555);
const inactiveCardColor = Color(0xFF111328);

enum Gender{
  male,
  female,
}

class Inputpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _Inputpage();
  }
}
class _Inputpage extends State<Inputpage> {

  Gender  selectedGander;
  int height = 140;
  int weight = 74;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(children: <Widget>[
            Expanded(
              child: Rusable(
                onpress: (){
                  setState(() {
                    selectedGander = Gender.male;
                  });
                },
                colour: selectedGander == Gender.male ? activeCardColour : inactiveCardColor,
                cardChild:IconCard(
                  icon: FontAwesomeIcons.mars,
                  label: "MALE",
                ),
              ),
            ),
            Expanded(child: Rusable(
              onpress: (){
                setState(() {
                  selectedGander = Gender.female;
                });
              },
                colour: selectedGander == Gender.female ? activeCardColour : inactiveCardColor,
                 cardChild: IconCard(
              icon: FontAwesomeIcons.venus,
              label: "FEMALE",
            ),)),
          ],),),
          Expanded(child: Rusable(
              colour: activeCardColour,
               cardChild: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Text('HEIGHT', style: labelTextStyle,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.baseline,
                   textBaseline: TextBaseline.alphabetic,
                   children: <Widget>[
                     Text(height.toString(),
                       style: kNumberTextStyle,
                     ),
                     Text('cm', style: labelTextStyle,
                     ),
                   ],
                 ),
                   SliderTheme(
                     data: SliderTheme.of(context).copyWith(
                       inactiveTrackColor: Color(0xFF8D8E98),
                       activeTrackColor: Colors.white,
                       thumbColor: Color(0xFFEB1555),
                       thumbShape:
                         RoundSliderThumbShape(enabledThumbRadius: 15.0),
                     ),
                     child: Slider(
                       value: height.toDouble(),
                       min: 140,
                       max: 220,
                       onChanged: (double newValue){
                         setState(() {
                           height = newValue.round();
                         });
                       },
                     ),
                   )],
                   ),)),
          Expanded(
            child: Row(
               children: <Widget>[
              Expanded(
                child: Rusable(
                    colour: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT',style: labelTextStyle,),
                        Text(weight.toString(), style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    )
                )
            ),
              Expanded(
                child: Rusable(
                    colour: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE',
                        style: labelTextStyle,
                        ),
                        Text(age.toString(),
                             style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                )
            ),
          ],),),
          BottomButton(
            buttonTitle: "CALCULAT",
            onTap: (){

              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                  context,
              MaterialPageRoute(
                  builder: (context)=> ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    feedBack: calc.getFeedBack(),
              )));
            },
          ),
        ],
      )
    );
  }
}
class Rusable extends StatelessWidget{

  Rusable({@required this.colour, this.cardChild, this.onpress});
  Color colour;
  final Widget cardChild;
  final Function onpress;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5B),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 46.0,
        height: 46.0,
      ),
      child: Icon(icon),
    );
  }
}
class BottomButton extends StatelessWidget {
    BottomButton({@required this.onTap, @required this.buttonTitle});

  final Function onTap;
  final  String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(buttonTitle,
                   style: largeButtonTextStyle,)),
        color: bottomContainerColour,
        margin: EdgeInsets.only(top: 10.0),
        height: bottomContainerHeight,
        width: double.infinity,
      ),
    );
  }
}

