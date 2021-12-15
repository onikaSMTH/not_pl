class Product {
  String id;
  String name;
  double price;
  String image;
  String description;
  int quantity;

  Product(
      {required this.id,
      required this.description,
      required this.quantity,
      required this.price,
      required this.name,
      required this.image});
}
