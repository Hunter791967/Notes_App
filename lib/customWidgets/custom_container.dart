import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.boxShadowColor,
    required this.opacity,
    required this.offsetOne,
    required this.offsetTwo,
    required this.blurRadius,
    required this.spreadRadius,
    required this.borderRadius,
    required this.containerBgColor,
    required this.widget,
  });

  final Widget widget;
  final Color containerBgColor;
  final Color boxShadowColor;
  final int opacity;
  final int offsetOne, offsetTwo;
  final int blurRadius;
  final int spreadRadius;
  final int borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: blurRadius.toDouble(),
            color: boxShadowColor.withOpacity(opacity.toDouble()),
            spreadRadius: spreadRadius.toDouble(),
            offset: Offset(offsetOne.toDouble(), offsetTwo.toDouble()),
          )
        ],
        borderRadius: BorderRadius.circular(borderRadius.toDouble()),
        color: containerBgColor,
      ),
      child: widget,
    );
  }
}
