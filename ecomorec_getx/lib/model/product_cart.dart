class ProductCart {
  final String? name;
  String? price;
  final String? image;
  int? quantity;
  final String? productId;

  ProductCart(
      {this.name, this.price, this.image, this.quantity, this.productId});

  ProductCart.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        price = json['price'],
        image = json['image'],
        productId = json['productId'],
        quantity = json['quantity'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'quantity': quantity,
      'productId': productId,
    };
  }
}
