class Category {
  final String? name;
  final String? image;
  final String? id;

  Category({this.name, this.image, this.id});

  Category.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image = json['image'],
        id = json['id'];
}
