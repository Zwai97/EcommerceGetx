import 'package:eco_getx_app/helper/constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/product_cart.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();
  Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await init();
      return _database;
    }
  }

  Future<Database> init() async {
    String path = join(await getDatabasesPath(), 'DB.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute('''
          CREATE TABLE $PRODUCT_CART_TABLE(
                   $NAME_COLUMN TEXT NOT NULL,
                   $image_COLUMN TEXT NOT NULL,
                   $PRICE_COLUMN TEXT NOT NULL,
                   $PRODUCTID_COLUMN TEXT NOT NULL,
                   $QUANTITY_COLUMN INTEGER NOT NULL
                  )''');
      // ignore: avoid_print, dead_code
      print('=============================onCreate');
    });
  }

  Future<void> insertData(ProductCart productCart) async {
    Database? dbClient = await database;
    await dbClient!.insert(PRODUCT_CART_TABLE, productCart.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<ProductCart>> getData() async {
    Database? dbClient = await database;
    return await dbClient!
        .query(PRODUCT_CART_TABLE)
        .then((value) => value.map((e) => ProductCart.fromJson(e)).toList());
  }

  Future<void> updateData(ProductCart productCart) async {
    Database? dbClient = await database;
    await dbClient!.update(PRODUCT_CART_TABLE, productCart.toJson(),
        where: '$PRODUCTID_COLUMN = ?', whereArgs: [productCart.productId]);
  }

  Future<void> deleteData(ProductCart productCart) async {
    Database? dbClient = await database;
    await dbClient!.delete(PRODUCT_CART_TABLE,
        where: '$PRODUCTID_COLUMN = ?', whereArgs: [productCart.productId]);
  }
}
