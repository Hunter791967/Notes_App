import 'package:flutter/material.dart';

class CustomPersistentFooterButton extends StatelessWidget {
  const CustomPersistentFooterButton(
      {super.key,
      required this.textOne,
      required this.textTwo,
      required this.textThree,
      required this.colorOne,
      required this.colorTwo,
      this.fontSizeOne,
      this.fontSizeTwo,
      this.lineHeight});

  final String textOne;
  final String textTwo;
  final String textThree;
  final Color colorOne;
  final Color colorTwo;
  final double? fontSizeOne;
  final double? fontSizeTwo;
  final double? lineHeight;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: textOne,
          style: TextStyle(
            color: colorOne,
            fontSize: fontSizeOne,
            height: lineHeight,
          ),
          children: <TextSpan>[
            TextSpan(
                text: textTwo,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: colorTwo,
                  fontSize: fontSizeTwo,
                  height: lineHeight,
                )),
            TextSpan(
              text: textThree,
            )
          ]),
    );
  }
}
