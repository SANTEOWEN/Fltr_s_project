part of 'home_bloc.dart';

//This classes of events holds any kind of emited events

@immutable
sealed class HomeEvent {}

//!we need to pass a initial event that emits succes/fail/or loading state
final class HomeInitialEvent extends HomeEvent {}

final class WishListButtonEvent extends HomeEvent {
  //*To pass an data to the bloc through a event we need to initialize the model on the event.
  final ProductsDataModel clickedWishListProduct;

  WishListButtonEvent({required this.clickedWishListProduct});
}

final class CartButtonEvent extends HomeEvent {
  //*For data that we need to pass to the bloc using event we need to initialize its model.
  final ProductsDataModel clickedCartProduct;

  CartButtonEvent({required this.clickedCartProduct});
}

final class HomeWishListNavigateButtonEvent extends HomeEvent {}

final class HomeCartNavigateButtonEvent extends HomeEvent {}
