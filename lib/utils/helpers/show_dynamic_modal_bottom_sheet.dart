import 'package:flutter/material.dart';
import '../components/app_colors.dart';

void showDynamicModalBottomSheet({
  required BuildContext context,
  required Widget child,
  double widthFactor = 0.8, // 70% width
  double heightFactor = 0.54, // 49% height
  double borderRadius = 16.0,
  Color backgroundColor = AppColors.dMedGreen,
  bool isScrollControlled = true,
  EdgeInsetsGeometry? padding,
  Alignment alignment = Alignment.bottomCenter,
}) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.transparent, // Make background transparent for custom shape
      //enableDrag: true,
      isDismissible: true,
      builder: (context) {
        // final screenHeight = MediaQuery.of(context).size.height;
        // final screenWidth = MediaQuery.of(context).size.width;

        return SafeArea(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              widthFactor: widthFactor,
              heightFactor: heightFactor,
              child: Container(
                  // height: screenHeight * heightFactor,   // 👈 height 50%
                  // width: screenWidth * widthFactor,      // 👈 width 70%
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  padding: padding ?? const EdgeInsets.all(16),
                  child: child,
              ),
            ),
          ),
        );
      });
}
