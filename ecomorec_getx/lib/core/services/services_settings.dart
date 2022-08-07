import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'cache.dart';

class FirebaseInstance extends GetxService {
  firebaseInit() async {
    await Firebase.initializeApp();

    return this;
  }
}

class GetCurrentUser extends GetxService {
  late bool isLogin;
  getUserInit() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user?.email == null) {
      isLogin = false;
    } else {
      isLogin = true;
    }

    return this;
  }
}

class CacheService extends GetxService {
  //late SharedPreferences pref;
  Future<CacheService> init() async {
    await Cache.prefs;
    return this;
  }
}
