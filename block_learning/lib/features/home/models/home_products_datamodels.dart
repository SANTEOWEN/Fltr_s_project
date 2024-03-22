//!this class represents the products

class ProductsDataModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  ProductsDataModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.imageUrl});
}