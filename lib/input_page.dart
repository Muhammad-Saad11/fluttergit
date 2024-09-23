import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'calculator.dart';
enum Gender{
  male,
  female,
}


class inputPage extends StatefulWidget {

  _inputPageState createState() => _inputPageState();
}

class _inputPageState extends State<inputPage> {
  Gender? selectedGender;
  int height= 180;
  int weight=60;

  // Color maleCard =inactiveCard;
  // Color femaleCard= inactiveCard;
  // void updateColor(Gender genderType) {
  //   if (genderType == Gender.male) {
  //     if (maleCard == inactiveCard) {
  //       maleCard = activeCard;
  //       femaleCard = inactiveCard;
  //
  //     }
  //     else {
  //       maleCard = inactiveCard;
  //     }
  //   }
  //   if (genderType == Gender.female) {
  //     if (femaleCard == inactiveCard) {
  //       femaleCard = activeCard;
  //       maleCard=inactiveCard;
  //     }
  //     else {
  //       femaleCard = inactiveCard;
  //     }
  //   }
  // }
  int age=20;


  @override
  Widget build(BuildContext context) {
    // maleCard==true;
    // femaleCard==true;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender=Gender.male;
                    });
                  }
                  ,
                  colour: selectedGender== Gender.male? activeCard : inactiveCard,
                cardChild: NewWidget(
                  icon: FontAwesomeIcons.mars,label: 'MALE',),
                              ),),
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      selectedGender=Gender.female;
                    });
                  },
                  colour: selectedGender== Gender.female? activeCard : inactiveCard,
                cardChild: NewWidget(
                  icon: FontAwesomeIcons.venus,
                  label: 'Female',
                ),

                              ),),
            ],
          )),
          Expanded(child: ReusableCard(
            colour: activeCard,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT' , style: labelTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,

                  children: [
                    Text(height.toString(),
                    style: styler),
                    Text('cm',style: labelTextStyle,)
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                     overlayColor: Color(0x15EB1555),

                     thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                  ),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      activeColor: Colors.white,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue){
                        print(newValue);
                        setState(() {
                          height=newValue.round();
                        });
                      }),
                )
              ],
            ),
          ),),
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(
                colour: activeCard,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Weight',style: labelTextStyle,),
                    Text(weight.toString(),
                    style: styler,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                          onPressed: (){
                          setState(() {
                            weight--;
                          });
                          },

                        ),
                        SizedBox(
                          width: 15,
                        ),
                        RoundIconButton(icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },),

                      ],
                    )
                  ],

                ),

              ),),
              Expanded(child: ReusableCard(
                colour: activeCard,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Age',style: labelTextStyle,),
                    Text(age.toString(),
                      style: styler,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              age--;
                            });
                          },

                        ),
                        SizedBox(
                          width: 15,
                        ),
                        RoundIconButton(icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              age++;
                            });
                          },),

                      ],
                    )
                  ],

                ),

              ),),
            ],
          )),
          BottomButton(buttonTitle: 'Calculate',onTap: (){
            // Navigator.pushNamed(context, '/first');
            Navigator.push(context, MaterialPageRoute(builder: (context)=>calculate( height: height,weight: weight,)));
          },),

         ],
      )

    );
  }


}

class BottomButton extends StatelessWidget {
  const BottomButton({
    required this.buttonTitle,
    required this.onTap,
  });

  final String buttonTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(buttonTitle,style: kLBTS,
        ),
        color: Color(0xFFB53D32),
        margin: EdgeInsets.only(top: 10),
        height: 80,
        padding: EdgeInsets.only(bottom: 20),
        width: double.infinity,

      ),
    );
  }
}
class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon,  required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;
  // const RoundIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        elevation: 6.0,
        onPressed: onPressed,
    );
  }
}


