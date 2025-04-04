import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubits/addNote/add_note_cubit.dart';
import 'package:notes_app/cubits/addNote/add_note_state.dart';
import 'package:notes_app/customWidgets/custom_form.dart';
import 'package:notes_app/customWidgets/custom_image.dart';
import 'package:notes_app/customWidgets/custom_text.dart';
import '../utils/components/app_colors.dart';

class CustomModalBottomSheet extends StatelessWidget {
  const CustomModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 24),
        child: SingleChildScrollView(
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
              BlocConsumer<AddNoteCubit, AddNoteState>(
                  listener: (BuildContext context, state) {
                    if(state is AddNoteError) {
                      print('Failed, ${state.errMessage}');
                    }
                    if(state is AddNoteSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Note added successfully!")),
                      );
                      Navigator.pop(context);
                    }
                  },
                  builder: (context, state) {
                    return ModalProgressHUD(
                        inAsyncCall: state is AddNoteLoading ? true : false,
                        child: const CustomForm()
                    );
                  }),
            ],
          ),
        ));
  }
}
