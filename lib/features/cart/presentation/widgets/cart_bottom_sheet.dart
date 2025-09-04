import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tot_task/core/utils/media_query_size.dart';
import '../../../../core/utils/app_colors.dart';
import '../manager/cart_cubit.dart';
import '../manager/price_cubit.dart';
import 'apply_discount_button.dart';
import 'custom_divider.dart';
import 'custom_row_bottom_sheet.dart';
import 'custom_text_form_field.dart';

class CartBottomSheet extends StatefulWidget {
  const CartBottomSheet({super.key});

  @override
  State<CartBottomSheet> createState() => _CartBottomSheetState();
}

class _CartBottomSheetState extends State<CartBottomSheet> {
  TextEditingController discountController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<PriceCubit>().getSubTotal(context.read<CartCubit>().cartItems);
  }

  @override
  Widget build(BuildContext context) {
    final priceCubit = context.read<PriceCubit>();
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartUpdated) {
          context.read<PriceCubit>().getSubTotal(state.cartItem);
          if (state.cartItem.isEmpty) {
            context.read<PriceCubit>().clearDiscount();
          }
        }
      },
      child: Container(
        height: context.height * 0.32,
        width: context.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.bgColor,
              blurRadius: context.height * 0.02,
              spreadRadius: context.height * 0.01,
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(context.height * 0.05),
            topRight: Radius.circular(context.height * 0.05),
          ),
          color: Colors.white,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.07,
          vertical: context.height * 0.02,
        ),
        child: BlocBuilder<PriceCubit, PriceState>(
          builder: (context, state) {
            if (state is PriceUpdated) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Form(
                        key: formKey,
                        child: SizedBox(
                          width: context.width * 0.6,
                          child: CustomTextFormField(
                            discountController: discountController,
                          ),
                        ),
                      ),
                      Spacer(),
                      ApplyDiscountButton(
                        priceCubit: priceCubit,
                        discountController: discountController,
                      ),
                    ],
                  ),
                  CustomDivider(),
                  SizedBox(height: context.height * 0.02),
                  CustomRowBottomSheet(
                    title: "Subtotal",
                    price: "\$${state.subTotal}",
                  ),
                  SizedBox(height: context.height * 0.01),
                  state.discount == 0.0
                      ? Container()
                      : CustomRowBottomSheet(
                        title: "Discount",
                        price: "-\$${state.discount}",
                        isDiscount: true,
                      ),
                  SizedBox(height: context.height * 0.02),
                  CustomRowBottomSheet(
                    title: "Total",
                    price: "\$${state.total}",
                    isTotal: true,
                  ),
                ],
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
