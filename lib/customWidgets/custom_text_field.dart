import 'package:flutter/material.dart';
import '../utils/components/app_colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.hintText,
    required this.colorOne,
    required this.colorTwo,
    required this.borderRadiusOne,
    required this.borderRadiusTwo,
    this.onChanged,
    this.inputType,
    this.initialValue,
    this.textController,
    this.fontSize,
    this.maxLines,
  });

  final String? hintText;
  Function(String)? onChanged;
  bool? obSecureText = false;
  final Color colorOne;
  final Color colorTwo;
  final int borderRadiusOne;
  final int borderRadiusTwo;
  TextInputType? inputType;
  final String? initialValue; // Add this line
  final TextEditingController? textController;
  final double? fontSize;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: colorOne,
      maxLines: maxLines,
      controller: textController ?? TextEditingController(text: initialValue), // Use controller if provided
      obscureText: obSecureText!,
      keyboardType: inputType,
      //isNumeric ? TextInputType.number : TextInputType.text,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: colorOne,
            fontSize: fontSize,
            ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadiusOne.toDouble()),
            borderSide: BorderSide(
              color: colorTwo,
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadiusTwo.toDouble()),
            borderSide: const BorderSide(
              color: AppColors.antiFlashWhite,
            ),),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusTwo.toDouble()),
          borderSide: const BorderSide(
            color: AppColors.dDarkGreen,
          ),),
      ),
    );
  }
}
