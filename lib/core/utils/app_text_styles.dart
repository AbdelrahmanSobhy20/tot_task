import 'package:flutter/material.dart';
import 'package:tot_task/core/utils/media_query_size.dart';

import 'app_colors.dart';
import 'font_constants.dart';

class AppTextStyles{
  static TextStyle appBarTitleStyle(BuildContext context){
    return  TextStyle(
      fontSize: FontConstants.fontSize026 * context.height,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle productTitleStyle(BuildContext context){
    return TextStyle(
      fontSize:
      FontConstants.fontSize024 * context.height,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  static TextStyle productPriceStyle(BuildContext context){
    return TextStyle(
      fontSize:
      FontConstants.fontSize018 * context.height,
      fontWeight: FontWeight.w400,
      color: AppColors.grayColor,
    );
  }

  static TextStyle buttonStyle(BuildContext context){
    return TextStyle(
      fontSize: FontConstants.fontSize016 * context.height,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  static TextStyle snackBarStyle(BuildContext context){
    return TextStyle(
      fontSize: FontConstants.fontSize020 * context.height,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  static TextStyle cartNoItemsStyle(BuildContext context){
    return TextStyle(
      fontSize: FontConstants.fontSize026 * context.height,
      fontWeight: FontWeight.bold,
      color: AppColors.grayColor,
    );
  }
  static TextStyle cartQuantityStyle(BuildContext context){
    return TextStyle(
      fontSize:
      FontConstants.fontSize024 *
          context.height,
      fontWeight: FontWeight.w400,
      color: Colors.black,
    );
  }
  static TextStyle hintTextStyle(BuildContext context){
    return TextStyle(
      color: AppColors.grayColor,
      fontSize: FontConstants.fontSize016 * context.height,
      fontWeight: FontWeight.w400,
    );
  }
}