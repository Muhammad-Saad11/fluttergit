import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
class NewWidget extends StatelessWidget {
  NewWidget({required this.icon, required this.label}) ;
  final IconData icon;
  final String label;


  @override
  Widget build(BuildContext context) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Icon(
          icon,
          size: 90,
        ),
        SizedBox(
          height: 15,
        ),
        Text(label, style: labelTextStyle,)
      ],
    );
  }
}