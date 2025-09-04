import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../home/domain/entity/product.dart';
import '../../domain/entity/cart_item.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<CartItem> cartItems = [];

  void addProductToCart(Product product) {
    final indexItem = cartItems.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (indexItem != -1) {
      cartItems[indexItem] = CartItem(
        product: product,
        quantity: cartItems[indexItem].quantity + 1,
      );
    } else {
      cartItems.add(CartItem(product: product, quantity: 1));
    }
    emit(CartUpdated(cartItem: cartItems));
  }

  void increaseQuantity(Product product) {
    final indexItem = cartItems.indexWhere(
      (item) => item.product.id == product.id,
    );
    if (indexItem != -1) {
      cartItems[indexItem] = CartItem(
        product: product,
        quantity: cartItems[indexItem].quantity + 1,
      );
      emit(CartUpdated(cartItem: cartItems));
    }
  }

  void decreaseQuantity(Product product) {
    final indexItem = cartItems.indexWhere(
          (item) => item.product.id == product.id,
    );
    if (indexItem != -1) {
      final quantity= cartItems[indexItem].quantity;
      if (quantity > 1) {
        cartItems[indexItem] = CartItem(
          product: product,
          quantity: cartItems[indexItem].quantity - 1,
        );
      }else{
        cartItems.removeAt(indexItem);
      }
      emit(CartUpdated(cartItem: cartItems));
    }
  }

  void clearCart() {
    cartItems.clear();
    emit(CartUpdated(cartItem: cartItems));
  }
}
