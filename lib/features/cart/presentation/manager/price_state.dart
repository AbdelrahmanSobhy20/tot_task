part of 'price_cubit.dart';

@immutable
sealed class PriceState {}

final class PriceInitial extends PriceState {}

final class PriceUpdated extends PriceState {
  final double subTotal;
  final double discount;
  final double total;

  PriceUpdated({
    required this.subTotal,
    required this.discount,
    required this.total,
  });
}
