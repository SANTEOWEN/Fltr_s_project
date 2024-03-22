part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

final class WishlistInitialEvent extends WishlistEvent {}

final class WishlistRemoveItemEvent extends WishlistEvent {
  final ProductsDataModel removedWishlistItems;

  WishlistRemoveItemEvent({required this.removedWishlistItems});
}
