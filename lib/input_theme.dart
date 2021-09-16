import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const double bottomContainerHeight = 80.0;
const Color activeCardColor = Color(0xFF1D1E33);
const Color inactiveCardColor = Color(0xFF111328);
const Color bottomContainerColor = Color(0xFFEB1555);

enum Gender {
  male, 
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  //Color maleCardColor = inactiveCardColor;
  //Color femaleCardColor = inactiveCardColor;
  Gender selectedGender;

  // void updateColor(Gender gender){
  //   // 1 = male, 2 = female
  //   if(gender == Gender.male){
  //     if(maleCardColor == inactiveCardColor){
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColor;
  //     } else {
  //       maleCardColor = inactiveCardColor;
  //     }
  //   } 

  //   if(gender == Gender.female){
  //     if(femaleCardColor == inactiveCardColor){
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     } else {
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }
  // }

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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //updateColor(Gender.male);
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      cardColor: selectedGender == Gender.male ? activeCardColor : inactiveCardColor,//maleCardColor,
                      cardWidget: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',),  
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //updateColor(Gender.female);
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      cardColor: selectedGender == Gender.female ? activeCardColor : inactiveCardColor,//femaleCardColor,
                      cardWidget: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',),  
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
                  child: ReusableCard(cardColor: activeCardColor,),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(cardColor: activeCardColor,),
                ),
                Expanded(
                  child: ReusableCard(cardColor: activeCardColor,),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            height: bottomContainerHeight,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}


