import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_button.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';

enum Gender {
  male, 
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardColor: selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,//maleCardColor,
                    cardWidget: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),  
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      },);
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,//femaleCardColor,
                    cardWidget: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      },);
                    }  
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'HEIGHT', 
                          style: kLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(), 
                              style: kNumberTextStyle
                            ),
                            Text(
                              'cm',
                              style: kLabelStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: kLightGrey,
                            activeTrackColor: kSliderActiveTrackColor,
                            thumbColor: kSliderActiveTrackColor,
                            overlayColor: kSliderThumbOverlayColor,
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:RoundSliderOverlayShape(overlayRadius: 30.0) 

                          ), 
                          child: Slider(
                            value: height.toDouble(), 
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue){
                              setState(() {
                                height = newValue.round();
                              });
                            }
                          ),
                        ),
                      ],
                    ),  
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: kLabelStyle,),
                        Text(weight.toString(), style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundActionButton(
                              icon:FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },  
                            ),
                            SizedBox(width: 10.0,),
                            RoundActionButton(
                              icon:FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },  
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: kActiveCardColor,
                    cardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE', style: kLabelStyle,),
                        Text(age.toString(), style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundActionButton(
                              icon:FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  if(age == 0){
                                    age = 0;
                                  }else age--;
                                });
                              },  
                            ),
                            SizedBox(width: 10.0,),
                            RoundActionButton(
                              icon:FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },  
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonText: 'CALCULATE', 
            onTap: (){

              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(bmi:calc.calculateBMI(), result:calc.getResult(), interpretation: calc.getInterpretation()),),);
            },
          ),
        ],
      ),
    );
  }
}


