class ItemTile {
  String? image;
  String name;
  String restaurantName;
  num price;
  int quantity;
  ItemTile(
      {this.image,
      required this.name,
      required this.restaurantName,
      required this.price,
      required this.quantity});
}
