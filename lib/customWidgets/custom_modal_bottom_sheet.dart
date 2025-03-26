import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notes_app/customWidgets/custom_persistent_footer_button.dart';
import '../utils/components/app_colors.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class CustomModalBottomSheet extends StatelessWidget {
  const CustomModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Title',
              colorOne: AppColors.antiFlashWhite,
              colorTwo: AppColors.antiFlashWhite,
              borderRadiusOne: 16,
              borderRadiusTwo: 16,
              fontSize: 13,
              //textController: productNameController,
            ),
            const Gap(20),
            CustomTextField(
              //textController: productPriceController,
              hintText: 'Content',
              //inputType: TextInputType.number,
              colorOne: AppColors.antiFlashWhite,
              colorTwo: AppColors.antiFlashWhite,
              borderRadiusOne: 16,
              borderRadiusTwo: 16,
              fontSize: 13,
              maxLines: 6,
            ),
            const Gap(40),
            CustomButton(
              buttonText: 'ADD',
              fgColor: AppColors.dMedGreen,
              bgColor: AppColors.antiFlashWhite,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              onTap: () {},
            ),
            const Gap(12),
            const CustomPersistentFooterButton(
              textOne:
                  'You need to drag it down if you need to ',
              textTwo: 'Close it ',
              textThree:
                  'and back to the Notes View Page.',
              colorOne: AppColors.antiFlashWhite,
              colorTwo: AppColors.dDarkGreen,
            )
          ],
        ),
      ),
    );
  }
}
