import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:block_learning/data/cart_items.dart';
import 'package:block_learning/features/home/models/home_products_datamodels.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveItemEvent>(cartRemoveItem);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());

    await Future.delayed(const Duration(seconds: 2));

    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartRemoveItem(
      CartRemoveItemEvent event, Emitter<CartState> emit) async {
    cartItems.remove(event.removedCardItems);
    emit(CartSuccessState(cartItems: cartItems));
    emit(CartNotifItemRemovedState());
  }
}
