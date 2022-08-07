class UserModel {
  final String? userId;
  final String? name;
  final String? email;
  final String? picture;
  final Map<String, dynamic>? address;

  UserModel({this.userId, this.name, this.email, this.picture, this.address});

  UserModel.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        name = json['name'],
        email = json['email'],
        picture = json['picture'],
        address = json['address'];

  toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'picture': picture,
      'address': address,
    };
  }
}
