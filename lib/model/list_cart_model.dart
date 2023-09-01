class ListCart {
  String name;
  String price;
  String id;
  int quantity;
  String size;
  String pathPicture;

  ListCart(
      {required this.name,
      required this.price,
      required this.id,
      required this.pathPicture,
      required this.quantity,
      required this.size});

  ListCart.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        price = json['price'],
        id = json['id'],
        quantity = json['quantity'],
        size = json['size'],
        pathPicture = json['pathPicture'];

  listCartToJson() {
    return {
      'name': name,
      'price': price,
      'id': id,
      'quantity': quantity,
      'size': size,
      'pathPicture': pathPicture
    };
  }
}
