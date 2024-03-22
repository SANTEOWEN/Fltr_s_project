import 'package:block_learning/features/home/bloc/home_bloc.dart';
import 'package:block_learning/features/home/models/home_products_datamodels.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductTileWidget extends StatelessWidget {
  //!We always need to pass the models that we want to display
  final ProductsDataModel productsDataModel;

  //! We pass the HomeBLoc bloc here so we dont use a click listeners lets just make the bloc do the work
  final HomeBloc homeBloc;

  const ProductTileWidget(
      {super.key, required this.productsDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(productsDataModel.imageUrl))),
            ),
            const SizedBox(height: 20),
            Text(
              productsDataModel.name,
              style: GoogleFonts.poppins(
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              productsDataModel.description,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₱ ${productsDataModel.price.toString()}',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        homeBloc.add(WishListButtonEvent(
                          //^It requires the events 
                          clickedWishListProduct: productsDataModel
                        ));
                      },
                      icon: const Icon(Icons.favorite_border),
                    ),
                    IconButton(
                      onPressed: () {
                        homeBloc.add(CartButtonEvent(
                          clickedCartProduct: productsDataModel
                        ));
                      },
                      icon: const Icon(Icons.shopping_bag_outlined),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
