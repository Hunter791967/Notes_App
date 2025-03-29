import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notes_app/customWidgets/custom_form.dart';
import 'package:notes_app/customWidgets/custom_image.dart';
import 'package:notes_app/customWidgets/custom_text.dart';
import '../utils/components/app_colors.dart';


class CustomModalBottomSheet extends StatelessWidget {
  const CustomModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  textTitle: 'NEW NOTE',
                  textColor: AppColors.antiFlashWhite,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Anton',
                ),
                Gap(8),
                CustomImage(
                    imagePath: 'assets/images/iconmonstr-plus-circle-filled-240.png',
                  imageHeight: 30,
                )
              ],
            ),
            Gap(16),
            CustomForm(),
          ],
        ),
      ),
    );
  }
}
