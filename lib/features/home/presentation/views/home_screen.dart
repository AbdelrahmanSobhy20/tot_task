import 'package:flutter/material.dart';
import 'package:tot_task/core/utils/media_query_size.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/font_constants.dart';
import '../../../cart/presentation/views/cart_screen.dart';
import '../../domain/utils/home_items_list.dart';
import '../widgets/home_product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Products',
          style: AppTextStyles.appBarTitleStyle(context),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
              size: context.height * 0.03,
            ),
          ),
        ],
        backgroundColor: AppColors.bgColor,
        surfaceTintColor: AppColors.bgColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.height * 0.02),
        child: ListView.builder(
          itemCount: homeItemsList.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: context.height * 0.15,
              child: HomeProductCard(
                product: homeItemsList[index]
              ),
            );
          },
        ),
      ),
    );
  }
}
