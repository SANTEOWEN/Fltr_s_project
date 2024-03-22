// ignore_for_file: type_literal_in_constant_pattern

import 'package:block_learning/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:block_learning/features/wishlist/ui/wishlist_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  //*This initState adds the initialEvent as soon as the app starts so the success state will be emited

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  Widget build(BuildContext context) {
    //*BlocConsumer is used to listen and build to the event and the state that being emited
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: const Text('Wishlist Item'),
            ),
            body: BlocConsumer<WishlistBloc, WishlistState>(
              bloc: wishlistBloc,
              //^listenWhen - means it only listent when its the current set state is being used
              listenWhen: (previous, current) => current is WishlistActionState,
              //^buildWhen - means it only builds when the current set state is not being used(based on the logic)
              buildWhen: (previous, current) => current is! WishlistActionState,
              listener: (context, state) {
                if (state is WishlistNotifRemovedState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Wishlist removed $state',
                        style: GoogleFonts.poppins(fontSize: 15),
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                switch (state.runtimeType) {
                  case WishlistLoadingState:
                    return const Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );

                  case WishlistSuccessState:

                    //*We initialize the HomeLoadedState as [succesState] so we can get the products from the productsModel that we passed on HomeLoadedState
                    final succesState = state as WishlistSuccessState;

                    return ListView.builder(
                        itemCount: succesState.wishlistItems.length,
                        itemBuilder: ((context, index) {
                          return WishlistTile(
                              productsDataModel:
                                  succesState.wishlistItems[index],
                              wishlistBloc: wishlistBloc);
                        }));

                  case WishlistFailState:
                    return const Center(
                      child: Text('Error Getting Data'),
                    );
                  default:
                    return const SizedBox();
                }
              },
            )));
  }
}
