import 'package:flutter/material.dart';
import 'package:tot_task/core/utils/media_query_size.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../domain/entity/product.dart';
import 'add_cart_button.dart';

class HomeProductCard extends StatelessWidget {
  const HomeProductCard({super.key,  required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: context.height * 0.01),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(context.height * 0.01),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: AppTextStyles.productTitleStyle(context),
                ),
                Text(
                  "\$${product.price}",
                  style: AppTextStyles.productPriceStyle(context),
                ),
                AddCartButton(product: product,),
              ],
            ),
            Spacer(),
            Image.asset(product.image ,
              width: context.height * 0.2,
              height: context.height * 0.2,
            ),
          ],
        ),
      ),
    );
  }
}
