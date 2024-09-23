import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:projectrr/constants.dart';
import 'package:projectrr/input_page.dart';
import 'package:projectrr/reusable_card.dart';
class calculate extends StatelessWidget {
  final int height;
  final int weight;
 late String finalResult;
 String finalBMI='';
double bmi=0;
   calculate({super.key,required this.weight, required this.height}){
     bmi = weight / ((height / 100) * (height / 100));
     finalResult = bmi.toStringAsFixed(1);
     double bmiValue=double.parse(finalResult);

     if (bmiValue < 18.5) {
       finalBMI = 'Underweight';
     } else if (bmiValue >= 18.5 && bmiValue < 25) {
       finalBMI = 'Normal weight';
     } else if (bmiValue >= 25 && bmiValue < 30) {
       finalBMI = 'Overweight';
     } else if (bmiValue >= 30 && bmiValue < 35) {
       finalBMI = 'Obese (Class 1)';
     } else if (bmiValue >= 35 && bmiValue < 40) {
       finalBMI = 'Obese (Class 2)';
     } else {
       finalBMI = 'Obese (Class 3)';
     }
   }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Calculator',style: TextStyle(fontSize: 25),
        ),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
              child: Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 30),
              child: Text('Your Result',
              style: TextStyle(
                fontSize: 40
              ),),
          ),



          ),
          Expanded(
              flex:5,

              child: ReusableCard(
                colour: activeCard,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                
                  children: [

                    Text(finalBMI,textAlign: TextAlign.center,
                  style: TextStyle(
                
                      fontSize: 30,
                      color: Colors.green,
                    ),),

                    Text(finalResult,
                      textAlign: TextAlign.center,
                      style: TextStyle(

                
                      fontSize: 100,
                      fontWeight: FontWeight.bold
                    ),),
                
                  ],
                ),
              )),
          Expanded(flex: 1,child:
           BottomButton(buttonTitle: 'ReCalculate',onTap: (){
             // Navigator.pushNamed(context, '/first');
             Navigator.push(context, MaterialPageRoute(builder: (context)=>inputPage()));
           },))

          // Expanded(child: Container(
          //   child: Text('OBESE',style: TextStyle(fontSize: 20),),
          // ))
        ],
      )
    );
  }
}

