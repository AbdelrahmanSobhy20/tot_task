import 'package:flutter/material.dart';
import 'package:tot_task/core/utils/media_query_size.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/font_constants.dart';

class CustomRowBottomSheet extends StatelessWidget {
  const CustomRowBottomSheet({
    super.key,
    required this.title,
    required this.price,
    this.isDiscount = false,
    this.isTotal = false,
  });

  final String title;
  final String price;
  final bool? isDiscount;
  final bool? isTotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color:
                isDiscount == true
                    ? AppColors.greenColor
                    : isTotal == true
                    ? Colors.black
                    : AppColors.grayColor,
            fontSize:
                isTotal == true
                    ? FontConstants.fontSize020 * context.height
                    : FontConstants.fontSize016 * context.height,
            fontWeight: isTotal == true ? FontWeight.bold:FontWeight.w400,
          ),
        ),
        Spacer(),
        Text(
          price,
          style: TextStyle(
            color: isDiscount == true ? AppColors.greenColor : Colors.black,
            fontSize:
                isTotal == true
                    ? FontConstants.fontSize022 * context.height
                    : FontConstants.fontSize018 * context.height,
            fontWeight: isTotal== true ? FontWeight.bold:FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
