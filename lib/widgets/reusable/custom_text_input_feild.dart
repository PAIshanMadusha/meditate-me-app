import 'package:flutter/material.dart';
import 'package:meditate_me_app/utils/app_colors.dart';
import 'package:meditate_me_app/utils/app_text_style.dart';

class CustomTextInputFeild extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final TextInputType keyBoardType;

  const CustomTextInputFeild({
    super.key,
    required this.labelText,
    this.hintText,
    this.onSaved,
    this.validator,
    required this.keyBoardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: AppTextStyle.kBodyStyle.copyWith(
          // ignore: deprecated_member_use
          color: AppColors.kBlackColor.withOpacity(0.25),
        ),
        hintText: hintText,
        fillColor: AppColors.kFChipContainerColor1,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
          borderSide: BorderSide(
            color: AppColors.kFChipContainerColor1,
            width: 2,
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
          borderSide: BorderSide(
            color: AppColors.kWhiteColor,
            width: 2,
          )
        ),
      ),
      validator: validator,
      onSaved: onSaved,
      keyboardType: keyBoardType,
    );
  }
}
