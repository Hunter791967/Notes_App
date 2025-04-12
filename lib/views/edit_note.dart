import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notes_app/customWidgets/custom_app_bar.dart';
import 'package:notes_app/models/note_model.dart';

import '../customWidgets/custom_persistent_footer_button.dart';
import '../customWidgets/custom_text_field.dart';
import '../utils/components/app_colors.dart';

class EditNote extends StatelessWidget {
  const EditNote({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backGround: AppColors.dMedGreen,
        foreGround: AppColors.antiFlashWhite,
        title: 'EDIT NOTE',
        dFontSize: 36,
        dFontWeight: FontWeight.w500,
        dElevation: 0,
        dFontFamily: 'RushfordPrinted',
        textColor: AppColors.antiFlashWhite,
        toolbarHeight: 76,
        lSpacing: 3,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 4, right: 12.0),
            child: IconButton(
              icon: const Icon(
                Icons.check_circle,
                size: 40,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
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
              const Gap(20),
              const CustomPersistentFooterButton(
                textOne: 'If you make any updated then you need to press ',
                textTwo: 'Check-Box ',
                textThree: 'else, go back by pressing the Back-Arrow.',
                colorOne: AppColors.antiFlashWhite,
                colorTwo: AppColors.dDarkGreen,
                fontSizeOne: 16,
                fontSizeTwo: 18,
                lineHeight: 1.5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
