import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:block_learning/data/wishlist_items.dart';
import 'package:block_learning/features/home/models/home_products_datamodels.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveItemEvent>(wishlistRemoveItemEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) async {
    emit(WishlistLoadingState());

    await Future.delayed(const Duration(seconds: 2));

    emit(WishlistSuccessState(wishlistItems: wishListItems));
  }

  FutureOr<void> wishlistRemoveItemEvent(
      WishlistRemoveItemEvent event, Emitter<WishlistState> emit) {
    wishListItems.remove(event.removedWishlistItems);
    emit(WishlistSuccessState(wishlistItems: wishListItems));

    emit(WishlistNotifRemovedState());
  }
}
