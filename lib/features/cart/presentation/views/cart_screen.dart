import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tot_task/core/utils/media_query_size.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../manager/cart_cubit.dart';
import '../widgets/cart_bottom_sheet.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: CartBottomSheet(),
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: AppTextStyles.appBarTitleStyle(context),
        ),
        centerTitle: true,
        backgroundColor: AppColors.bgColor,
        surfaceTintColor: AppColors.bgColor,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cubit = context.read<CartCubit>();
          final cartItems = cubit.cartItems;
          return cubit.cartItems.isEmpty ? Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: context.height * 0.4),
              child: Text("No Items Yet" ,
              style: AppTextStyles.cartNoItemsStyle(context),
              ),
            ),
          ) : Padding(
            padding: EdgeInsets.symmetric(horizontal: context.height * 0.02),
            child: ListView.builder(
              padding: EdgeInsets.only(bottom: context.height * 0.34),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final product = cartItems[index].product;
                return SizedBox(
                  height: context.height * 0.12,
                  child: Card(
                    margin: EdgeInsets.symmetric(
                      vertical: context.height * 0.01,
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(context.height * 0.01),
                      child: Row(
                        children: [
                          Image.asset(product.image,
                          height: context.height * 0.1,
                            width: context.height * 0.1,
                          ),
                          SizedBox(width: context.height * 0.02),
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
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Container(
                                height: context.height * 0.04,
                                width: context.height * 0.04,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.lightGrayColor,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    context.read<CartCubit>().decreaseQuantity(product);
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    color: AppColors.grayColor,
                                    size: context.height * 0.02,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.height * 0.01,
                                ),
                                child: Text(
                                  cartItems[index].quantity.toString(),
                                  style: AppTextStyles.cartQuantityStyle(context),
                                ),
                              ),
                              Container(
                                height: context.height * 0.04,
                                width: context.height * 0.04,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.lightGrayColor,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    context.read<CartCubit>().increaseQuantity(product);
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: AppColors.grayColor,
                                    size: context.height * 0.02,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
