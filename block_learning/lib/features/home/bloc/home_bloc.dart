import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:block_learning/data/cart_items.dart';
import 'package:block_learning/data/grocery_data.dart';
import 'package:block_learning/data/wishlist_items.dart';
import 'package:block_learning/features/home/models/home_products_datamodels.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    //*Remember always make sure that the event that you are calling is right it might end up on a mess or some unregistered error thing on debug mode

    on<HomeInitialEvent>(homeEnitialEvent);

    //*This handles the product click either its wishlist or cartitem
    on<WishListButtonEvent>(wishListButtonEvent);
    on<CartButtonEvent>(cartButtontEvent);

    //*This handles the wishlist and cart navigatiom button
    on<HomeWishListNavigateButtonEvent>(wishListNavigateButton);
    on<HomeCartNavigateButtonEvent>(cartListNavigationButton);
  }

  /*
  &This method is called whenever the app starts so it gets all of the items from the database
  */

  //^This we took all of the list of maps and converted it into the productDataModel
  FutureOr<void> homeEnitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit)  {
    emit(HomeLoadingState());

    //* We add a fabricated delay so we can emitate the API calls but in real world implementations we need to use try and catch method
    //await Future.delayed(const Duration(seconds: 3));

    //* then we emit the HomeLoadedSuccessState so we can get all of the items, in our case as of now that we are learning how to use bloc so we dont have an actual API calls
    //* in this case we use map to get all of the products and map it so we can use all of its data.
    emit(HomeLoadedSuccesState(
        products: GroceryData.groceryProducts
            .map((e) => ProductsDataModel(
                  id: e['id'],
                  name: e['name'],
                  description: e['description'],
                  price: e['price'].toDouble( ),
                  imageUrl: e['imageUrl'],
                ))
            .toList()));
  }

  /* 
  todo - This method handles the wishlist product event everytime a product is being added to wishlist this event will be emited
  todo - Need to add functionality for this one
  */
  FutureOr<void> wishListButtonEvent(
      WishListButtonEvent event, Emitter<HomeState> emit) {
    print('WishList Product is Clicked');
    //^ Now to actuall add items from the events to the list if wishlist items we need to add event on the emit
    wishListItems.add(event.clickedWishListProduct);
    emit(HomeProductItemWishlistedState());
  }

  /*
  todo - This method handles the cart product event everytime a product is being added to cart this event will be emited
  todo - Need to add functionality for this one
  */
  FutureOr<void> cartButtontEvent(
      CartButtonEvent event, Emitter<HomeState> emit) {
    print('Cart Product is clicked');

    //^ Now to actuall add items from the events to the list if wishlist items we need to add event on the emit
    cartItems.add(event.clickedCartProduct);

    //*We call this state so we can listen to clicked events that we use so we can do something on listene on blocconsumer like popping some snackbar on our UI
    emit(HomeProductItemCartedState());
    print(cartItems.length.toString());
  }

  /*
  todo - This method handles the wishlist Navigate event everytime we press the wishlist navigate it navigates it to the wishlist items
  todo - Need to add functionality for this one
  */

  FutureOr<void> wishListNavigateButton(
      HomeWishListNavigateButtonEvent event, Emitter<HomeState> emit) {
    print('WishList Navigate is Clicked');

    //*Now this are the actionstates it means whenever i get this states it means we want some actions
    emit(HomeNavigateToWishListState());
  }

  /*
  todo - This method handles the Cart Navigate event everytime we press the Cart navigate it navigates it to the Cart items
  todo - Need to add functionality for this one
  */
  FutureOr<void> cartListNavigationButton(
      HomeCartNavigateButtonEvent event, Emitter<HomeState> emit) {
    print('Cart Navigate is Clicked');

    //*Now this are the actionstates it means whenever i get this states it means we want some actions
    emit(HomeNavigateToCartState());
  }
}
