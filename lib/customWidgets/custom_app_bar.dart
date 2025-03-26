import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.backGround,
    required this.foreGround,
    required this.title,
    required this.dFontSize,
    required this.dFontWeight,
    required this.dElevation,
    required this.dFontFamily,
    required this.textColor,
    this.lSpacing,
    this.toolbarHeight,
    this.actions,
    this.centerTitle = false,
    this.implyLeading = true,
  });

  final Color backGround;
  final Color foreGround;
  final String title;
  final Color textColor;
  final int dFontSize;
  final FontWeight dFontWeight;
  final String dFontFamily;
  final int dElevation;
  final double? lSpacing;
  final double? toolbarHeight;
  final List<Widget>? actions;
  final bool centerTitle;
  final bool implyLeading;
  final double kToolbarHeight = 56.0; // Default AppBar height is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backGround,
      foregroundColor: foreGround,
      title: Text(
        title,
        style: TextStyle(
          fontFamily: dFontFamily,
          fontSize: dFontSize.toDouble(),
          fontWeight: dFontWeight,
          color: textColor,
          letterSpacing: lSpacing,
        ),
      ),
      iconTheme: IconThemeData(color: foreGround),
      elevation: dElevation.toDouble(),
      toolbarHeight: toolbarHeight,
      actions: actions,
      centerTitle: centerTitle,
      automaticallyImplyLeading: implyLeading,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);
}
