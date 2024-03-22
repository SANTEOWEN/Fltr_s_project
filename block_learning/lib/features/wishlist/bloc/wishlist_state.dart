part of 'wishlist_bloc.dart';

@immutable
//*This state holds all of the states
sealed class WishlistState {}

//*This state holds all of the actions states that holds of the actions like event
abstract class WishlistActionState extends WishlistState {}

//*This state holds all of the states
final class WishlistInitial extends WishlistState {}

//*This state holds all of the loading state for the WishlistedItemPage
final class WishlistLoadingState extends WishlistState {}

//*This state holds the succes states like after loading states and it holds the model that we need to fetch that we need to emit after the succes state
final class WishlistSuccessState extends WishlistState {

  //^We need the list of Class ProductsDataModel so we can output it on frontend
  final List<ProductsDataModel> wishlistItems;

  WishlistSuccessState({required this.wishlistItems});
}

//*This state holds the unsuccessful states like not fetching data's
final class WishlistFailState extends WishlistState {}

//*This state holds the notifaction when item is removed
final class WishlistItemRemovedState extends WishlistState {}
