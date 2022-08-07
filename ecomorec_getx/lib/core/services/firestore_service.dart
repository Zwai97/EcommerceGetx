import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/user.dart';

class FireStoreService {
  FireStoreService._();
  static final FireStoreService instance = FireStoreService._();

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUser(UserModel userModel) async =>
      await _users.doc(userModel.userId).set(userModel.toJson());

  Future<void> deleteUser(String id) async => await _users.doc(id).delete();

  Future<void> updateUser(String id, Map<String, dynamic> data) async =>
      await _users.doc(id).update(data);

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  final CollectionReference<Map<String, dynamic>> _categories =
      FirebaseFirestore.instance.collection('Categories');

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getCategories() async =>
          await _categories.get().then((value) => value.docs);

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  final CollectionReference<Map<String, dynamic>> _products =
      FirebaseFirestore.instance.collection('Products');

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getProducts() async => await _products.get().then((value) => value.docs);

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
