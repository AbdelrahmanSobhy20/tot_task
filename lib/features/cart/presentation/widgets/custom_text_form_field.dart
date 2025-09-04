import 'package:flutter/material.dart';
import 'package:tot_task/core/utils/media_query_size.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.discountController});
  final TextEditingController discountController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: discountController,
      decoration: InputDecoration(
        hintText: 'Promo Code...',
        hintStyle: AppTextStyles.hintTextStyle(context),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.height * 0.02),
          borderSide: BorderSide(
            color: AppColors.lightGrayColor,
            width: context.height * 0.002,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.height * 0.02),
          borderSide: BorderSide(
            color: AppColors.lightGrayColor,
            width: context.height * 0.002,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.height * 0.02),
          borderSide: BorderSide(
            color: AppColors.lightGrayColor,
            width: context.height * 0.002,
          ),
        ),
      ),
    );
  }
}
