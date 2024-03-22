part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class CartInitialEvent extends CartEvent {}

final class CartRemoveItemEvent extends CartEvent {
  final ProductsDataModel removedCardItems;

  CartRemoveItemEvent({required this.removedCardItems});
}
