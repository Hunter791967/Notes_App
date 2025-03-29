import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../utils/components/app_colors.dart';
import 'custom_button.dart';
import 'custom_form_text_field.dart';
import 'custom_persistent_footer_button.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? formFieldOne, formFieldTwo;
  double? formFieldThree, formFieldFour;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          CustomFormTextField(
            hintText: formFieldOne,
            colorOne: AppColors.antiFlashWhite,
            colorTwo: AppColors.antiFlashWhite,
            borderRadiusOne: 16,
            borderRadiusTwo: 16,
            fontSize: 13,
            onSaved: (value) {
              formFieldOne = value;
            },
            //textController: productNameController,
          ),
          const Gap(20),
          CustomFormTextField(
            //textController: productPriceController,
            hintText: formFieldTwo,
            //inputType: TextInputType.number,
            colorOne: AppColors.antiFlashWhite,
            colorTwo: AppColors.antiFlashWhite,
            borderRadiusOne: 16,
            borderRadiusTwo: 16,
            fontSize: 13,
            maxLines: 6,

            onSaved: (value) {
              formFieldTwo = value;
            },
          ),
          const Gap(40),
          CustomButton(
            buttonText: 'ADD',
            fgColor: AppColors.dMedGreen,
            bgColor: AppColors.antiFlashWhite,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            onTap: () {
              if(formKey.currentState!.validate()) {
                formKey.currentState!.save(

                );
              } else {
                autoValidateMode = AutovalidateMode.always; //always validate if fields has null value

                setState(() {

                });
              }
            },
          ),
          const Gap(12),
          const CustomPersistentFooterButton(
            textOne: 'You need to drag it down if you need to ',
            textTwo: 'Close it ',
            textThree: 'and back to the Notes View Page.',
            colorOne: AppColors.antiFlashWhite,
            colorTwo: AppColors.dDarkGreen,
          )
        ],
      ),
    );
  }
}
