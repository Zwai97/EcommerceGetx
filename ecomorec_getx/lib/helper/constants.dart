// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/////////////////////////////////////////////////////////////////////////////////////////////////////////
const Color PRIMARY_COLOR = Color.fromRGBO(0, 197, 105, 1);
const Color BLACK_COLOR = Colors.black;
const Color TEXT_TITLE_COLOR = Color.fromRGBO(146, 146, 146, 1);
const Color GREY_COLOR = Color.fromRGBO(240, 240, 240, 1);
const Color SECOND_GREY_COLOR = Color.fromRGBO(221, 221, 221, 1);
/////////////////////////////////////////////////////////////////////////////////////////////////////////
const String PRODUCT_CART_TABLE = 'productCartTable';
const String NAME_COLUMN = 'name';
const String PRICE_COLUMN = 'price';
const String PRODUCTID_COLUMN = 'productId';

const String QUANTITY_COLUMN = 'quantity';
const String image_COLUMN = 'image';

/////////////////////////////////////////////////////////////////////////////////////////////////////////
const SpinKitFadingCircle SPIN_KIT = SpinKitFadingCircle(
  color: PRIMARY_COLOR,
  size: 50.0,
);
/////////////////////////////////////////////////////////////////////////////////////////////////////////

const String CACHE_USER_FIELD = 'user';
/////////////////////////////////////////////////////////////////////////////////////////////////////////

enum Delivery { StandardDelivery, NextDayDelivery, NominatedDelivery }

enum Address { HomeAddress, WorkAddress }
