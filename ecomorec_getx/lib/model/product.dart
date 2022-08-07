class Product {
  final String? name;
  final String? description;
  final String? color;
  final String? size;
  final String? price;
  final String? image;
  final String? store;
  final String? productId;
  final List? category;

  Product(
      {this.name,
      this.description,
      this.color,
      this.size,
      this.price,
      this.image,
      this.store,
      this.productId,
      this.category});

  Product.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        color = json['color'],
        size = json['size'],
        price = json['price'],
        image = json['image'],
        productId = json['productId'],
        store = json['store'],
        category = json['category'];
}
