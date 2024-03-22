//I learned that everything should have a state so it can be manage.

part of 'cart_bloc.dart';

@immutable
//*This state holds all of the states
sealed class CartState {}

//*This state holds all of the actions states that holds of the actions like event
abstract class CartActionState extends CartState {}

//*This state holds all of the states
final class CartInitial extends CartState {}

//*This state holds all of the loading state for the cartedItemPage
final class CartLoadingState extends CartState {}

//*This state holds the succes states like after loading states and it holds the model that we need to fetch that we need to emit after the succes state
final class CartSuccessState extends CartState {
  //^We need the list of Class ProductsDataModel so we can output it on frontend
  final List<ProductsDataModel> cartItems;

  CartSuccessState({required this.cartItems});
}

//*This state holds the unsuccessful states like not fetching data's
final class CartFailState extends CartState {}

//*This state holds the notifaction when item is removed
final class CartItemRemovedState extends CartState {}

//^This state holds the notifaction for changes state
final class CartNotifAddedState extends CartActionState {}
