import 'package:flutter/material.dart';
import '../components/bottom_button.dart';
import '../constants.dart';
import '../components/reusable_card.dart';

class ResultsPage extends StatelessWidget{

  ResultsPage({@required this.bmi, @required this.result, @required this.interpretation});

  final String bmi; 
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result', 
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardColor: kActiveCardColor,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    result,
                    style: kResultType,  
                  ),
                  Text(
                    bmi,
                    style: kResultsTextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kResultMessageTextStyle,
                  ),
                ],
              ),
            )
          ),
          BottomButton(
            buttonText: 'RE-CALCULATE', 
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ],
      )
    );
  }
}