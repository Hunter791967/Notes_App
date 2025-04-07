import 'package:flutter/material.dart';
import '../utils/components/app_colors.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField(
      {super.key,
      required this.colorOne,
      required this.colorTwo,
      required this.borderRadiusOne,
      required this.borderRadiusTwo,
      this.hintText,
      this.onChanged,
      this.obSecureText = false,
      this.initialValue,
      this.textController,
      this.fontSize,
      this.maxLines,
      this.onSaved,
      this.inputType});

  final String? hintText;
  final Function(String)? onChanged;
  final bool? obSecureText;
  final Color colorOne;
  final Color colorTwo;
  final int borderRadiusOne;
  final int borderRadiusTwo;
  final TextInputType? inputType;
  final String? initialValue; // Add this line
  final TextEditingController? textController;
  final double? fontSize;
  final int? maxLines;
  final Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      keyboardType: inputType,
      cursorColor: colorOne,
      maxLines: maxLines,
      controller: textController,
      initialValue: textController == null ? initialValue : null,
      obscureText: obSecureText!,
      validator: (data) {
        if (data?.isEmpty ?? true) {
          return 'This Field Is Required';
        }
        return null; // Validation passed
      },
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
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusTwo.toDouble()),
          borderSide: const BorderSide(
            color: AppColors.dDarkGreen,
          ),
        ),
      ),
    );
  }
}
