import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tot_task/core/utils/media_query_size.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../cart/presentation/manager/cart_cubit.dart';
import '../../domain/entity/product.dart';

class AddCartButton extends StatelessWidget {
  const AddCartButton({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.height * 0.01),
        ),
      ),
      onPressed: () {
        context.read<CartCubit>().addProductToCart(product);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 1),
            content: Text(
              "Item Added To Cart",
              style: AppTextStyles.snackBarStyle(context),
            ),
            backgroundColor: Colors.green,
          ),
        );
      },
      child: Text(
        "Add To Cart",
        style: AppTextStyles.buttonStyle(context),
      ),
    );
  }
}
