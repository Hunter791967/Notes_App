import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/addNote/add_note_cubit.dart';
import 'package:notes_app/cubits/addNote/add_note_state.dart';
import 'package:notes_app/customWidgets/custom_form.dart';
import 'package:notes_app/customWidgets/custom_image.dart';
import 'package:notes_app/customWidgets/custom_snack_bar_text.dart';
import 'package:notes_app/customWidgets/custom_text.dart';
import '../utils/components/app_colors.dart';

class CustomModalBottomSheet extends StatelessWidget {
  const CustomModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 24),
          child: Column(
            children: [
              const Row(
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
                    imagePath:
                        'assets/images/iconmonstr-plus-circle-filled-240.png',
                    imageHeight: 30,
                  )
                ],
              ),
              const Gap(16),
              Expanded(
                child: BlocConsumer<AddNoteCubit, AddNoteState>(
                    listener: (BuildContext context, state) {
                  if (state is AddNoteError) {
                    //print('Failed, ${state.errMessage}');
                    CustomSnackBarText(
                      snackBarText:
                          "Note Failed to be added, ${state.errMessage}",
                      backgroundColor: AppColors.dHeartRed,
                      snackBarColor: AppColors.antiFlashWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      duration: 14,
                    ).showCustomSnackBar(context);
                  }
                  if (state is AddNoteSuccess) {
                    //print('The Note Is Added Successfully');
                    CustomSnackBarText(
                      snackBarText: "Note added successfully!",
                      backgroundColor: AppColors.antiFlashWhite,
                      snackBarColor: AppColors.dMedGreen,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      duration: 2,
                    ).showCustomSnackBar(context);
                    Future.delayed(const Duration(milliseconds: 300), () {
                      if (context.mounted) Navigator.pop(context);
                    });
                  }
                }, builder: (context, state) {
                  return ModalProgressHUD(
                      inAsyncCall: state is AddNoteLoading ? true : false,
                      color: AppColors.dMedGreen
                          .withOpacity(0.3), // Use your custom color
                      progressIndicator: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.antiFlashWhite), // Spinner color
                      ),
                      child: AbsorbPointer(
                        absorbing: state is AddNoteLoading ? true : false,
                        child: const SingleChildScrollView(
                          child: CustomForm(),
                        ),
                      ));
                }),
              ),
            ],
          )),
    );
  }
}
