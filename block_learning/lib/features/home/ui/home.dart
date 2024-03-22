// ignore_for_file: type_literal_in_constant_pattern

import 'package:block_learning/features/cart/ui/cart.dart';
import 'package:block_learning/features/home/bloc/home_bloc.dart';
import 'package:block_learning/features/home/ui/product_tile_widget.dart';
import 'package:block_learning/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //*This initState adds the initialEvent as soon as the app starts so the success state will be emited

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    //*BlocConsumer is used to listen and build to the event and the state that being emited
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      //^listenWhen - means it only listent when its the current set state is being used
      listenWhen: (previous, current) => current is HomeActionState,

      //^buildWhen - means it only builds when the current set state is not being used(based on the logic)
      buildWhen: (previous, current) => current is! HomeActionState,

      listener: (context, state) {
        /* 
        *Now here at the listener we need to wait for the user to actually clicked the buttons if they clicked the shopping_bag_icon
        *it will navigate into the CartItemsList page and if they clicked the heart(wishlistpage) they will be navigated on 
        *wishlistItems page
        */
        if (state is HomeNavigateToCartState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Cart()));
        } else if (state is HomeNavigateToWishListState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WishList()));

          /*
        *This sub conditions are used to show a scaffoldSnackBar whenever the wishlist and cart button is being clicked 
        *it triggers the event from from the bloc and set the state to show the snackbar
        */
        } else if (state is HomeProductItemCartedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            'Item added to Cart',
            style: GoogleFonts.poppins(),
          )));
        } else if (state is HomeProductItemWishlistedState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            'Item added to Wishlist',
            style: GoogleFonts.poppins(),
          )));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeLoadedSuccesState:

            //*We initialize the HomeLoadedState as [succesState] so we can get the products from the productsModel that we passed on HomeLoadedState
            final succesState = state as HomeLoadedSuccesState;

            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.teal,
                  title: Text(
                    'Grocery App',
                    style: GoogleFonts.poppins(),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishListNavigateButtonEvent());
                      },
                      icon: const Icon(Icons.favorite_border),
                    ),
                    IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartNavigateButtonEvent());
                      },
                      icon: const Icon(Icons.shopping_bag_outlined),
                    ),
                  ],
                ),

                /*
                *Now inside of our body we use the ListViewBuilder to build some widget that shows us our products
                ^We have a parameter context and index so we need to return a widget that we want to build
                ^in our case we have ProductTileWidget this widget holds the Products and it has a parameter
                ^it ask for the productsDataModel so we need to supply the productsDataModel to do that
                ^We pass the productsDataModel from the succesState that we initialize from the success state and call of the index using the ListView.Builder
                */
                body: ListView.builder(

                    //& to get all of the item Counts we will still call the successState and the products and get its length
                    itemCount: succesState.products.length,
                    itemBuilder: ((context, index) {
                      //& for every tileWidget it will ask for the productDataModel which comes from successState
                      //& Beacuse the successState takes the products which are the list of productsDataModel
                      return ProductTileWidget(
                          //*We passed the bloc homeBloc here so we can get all of the any changes
                          homeBloc: homeBloc,
                          productsDataModel: succesState.products[index]);
                    })),
              ),
            );
          case HomeLoadedFailureState:
            return const Scaffold(
              body: Center(
                child: Text('ERROR'),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
