part of 'home_bloc.dart';

@immutable
//^Take some actions
sealed class HomeState {}

//^Build something on the UI
abstract class HomeActionState extends HomeState {}

//^This state holds the initial state that we need to render everytime app starts
final class HomeInitial extends HomeState {}

//^This state shows me a loading state whic shows a loading screen on for my UI
final class HomeLoadingState extends HomeState {}

//^This state shows me a succes state
final class HomeLoadedSuccesState extends HomeState {
  //!we get Product model because whenever we got a succes state we want our products list to be
  //!loaded
  final List<ProductsDataModel> products;

  HomeLoadedSuccesState({
    required this.products,
  });
}

//^This state handles error and show an error state
final class HomeLoadedFailureState extends HomeState {}

//^This handles the navigation from home to wishlist state thats why we extends the HomeActionState
final class HomeNavigateToWishListState extends HomeActionState {}

//^This handles the navigation from home to cart state and we also extends  it from HomeActionState
final class HomeNavigateToCartState extends HomeActionState {}

//^This state handles the notification if the item is being wishlisted
final class HomeProductItemWishlistedState extends HomeActionState {}

//^This state handles the notification if the item is being added to cart
final class HomeProductItemCartedState extends HomeActionState {}
