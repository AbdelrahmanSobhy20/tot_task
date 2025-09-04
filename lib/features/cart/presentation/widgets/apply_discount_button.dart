import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tot_task/core/utils/media_query_size.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../manager/price_cubit.dart';

class ApplyDiscountButton extends StatelessWidget {
  const ApplyDiscountButton({super.key, required this.priceCubit, required this.discountController});
  final PriceCubit priceCubit;
  final TextEditingController discountController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
        priceCubit.isDiscountApplied
            ? AppColors.grayColor
            : AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            context.height * 0.01,
          ),
        ),
      ),
      onPressed:priceCubit.isDiscountApplied?null: () {
        final code = discountController.text.trim();
        context.read<PriceCubit>().applyDiscount(code);
      },
      child: Text(
        priceCubit.isDiscountApplied?"Applied":"Apply",
        style: AppTextStyles.buttonStyle(context),
      ),
    );
  }
}
