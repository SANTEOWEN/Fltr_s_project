// ignore_for_file: type_literal_in_constant_pattern

import 'package:block_learning/features/cart/bloc/cart_bloc.dart';
import 'package:block_learning/features/cart/ui/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text('Cart Items'),
        ),
        body: BlocConsumer<CartBloc, CartState>(
          bloc: cartBloc,
          //^This means we only listen when theres an action(event) happends
          listenWhen: (previous, current) => current is CartActionState,

          //^When the state is not actionState(event) it only rebuild the appp
          buildWhen: (previous, current) => current is! CartActionState,
          listener: (context, state) {
            if (state is CartItemRemovedState) {
              print('Emit');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Cart Item Removed',
                    style: GoogleFonts.poppins(),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case CartLoadingState:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case CartSuccessState:
                final sucessState = state as CartSuccessState;

                return ListView.builder(
                    itemCount: sucessState.cartItems.length,
                    itemBuilder: ((context, index) {
                      return CartTile(
                          productsDataModel: sucessState.cartItems[index],
                          cartBloc: cartBloc);
                    }));

              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
