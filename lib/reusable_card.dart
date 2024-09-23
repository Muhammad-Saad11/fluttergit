import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
  final VoidCallback? onPress;
  ReusableCard({this.colour= const Color(0xFF1D1E33), this.cardChild,  this.onPress});

  // const ReusableCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
          // color: Color(0xFF1D1E33),
        ),
      ),
    );
  }
}

