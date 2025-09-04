import 'package:flutter/material.dart';
import 'package:tot_task/core/utils/media_query_size.dart';

import '../../../../core/utils/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: context.height * 0.02,
      ),
      width: context.width,
      height: 3,
      color: AppColors.lightGrayColor,
    );
  }
}
