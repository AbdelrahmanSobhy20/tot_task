import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entity/cart_item.dart';

part 'price_state.dart';

class PriceCubit extends Cubit<PriceState> {
  double discount = 0.0;
  double subTotal = 0.0;
  double total = 0.0;
  bool isDiscountApplied = false;
  double discountPercentage = 0.0;

  PriceCubit() : super(PriceInitial());

  void applyDiscount(String promoCode) {
    if (promoCode == "DISCOUNT10" && !isDiscountApplied) {
      discountPercentage = 0.1;
      isDiscountApplied = true;
      discount = subTotal * discountPercentage;
    }else if(promoCode!="DISCOUNT10"){
      discountPercentage = 0.0;
      isDiscountApplied = false;
    }
    getTotal();
  }

  void getSubTotal(List<CartItem> cartItems) {
    subTotal = cartItems.fold(
      0.0,
      (previousValue, element) =>
          previousValue + element.product.price * element.quantity,
    );
    if(isDiscountApplied){
      discount = subTotal * discountPercentage;
    }
    getTotal();
  }

  void getTotal() {
    total = subTotal - discount;
    emit(PriceUpdated(
      subTotal: subTotal,
        discount: discount,
        total: total,
    ));
  }

  void clearDiscount() {
    isDiscountApplied = false;
    discountPercentage = 0.0;
    discount = 0.0;
    getTotal();
  }
}
