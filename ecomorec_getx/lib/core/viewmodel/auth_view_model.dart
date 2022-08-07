// ignore_for_file: avoid_print

import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:eco_getx_app/model/user.dart';
import 'package:eco_getx_app/view/auth/login_view.dart';
import 'package:eco_getx_app/view/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../services/cache.dart';
import '../services/firestore_service.dart';

class AuthViewModel extends GetxController {
  GlobalKey<FormState> formStateLogin = GlobalKey<FormState>();
  GlobalKey<FormState> formStateSignup = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  String? name, email, password;
  final User? _user = FirebaseAuth.instance.currentUser;
  late UserModel _userInfo;
  UserModel get userInfo => _userInfo;
  Future<void> signUp() async {
    var formdata = formStateSignup.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: email!,
          password: password!,
        )
            .then((user) async {
          await saveUser(user);
          _userInfo = await getUserInfo();
        });

        Get.offAll(() => const HomePage());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
                  context: Get.context!,
                  title: 'Error',
                  body: const Text('The password provided is too weak.'))
              .show();
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
                  context: Get.context!,
                  title: 'Error',
                  body:
                      const Text('The account already exists for that email.'))
              .show();
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> signInwithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication?.idToken,
          accessToken: googleSignInAuthentication?.accessToken);

      await _auth.signInWithCredential(credential).then((user) async {
        await saveUser(user);
        _userInfo = await getUserInfo();
      });
      Get.off(() => const HomePage());
    } on FirebaseAuthException catch (error) {
      AwesomeDialog(
              context: Get.context!,
              title: 'Error Login Google',
              body: Text('${error.message}'))
          .show();
      rethrow;
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    var formdata = formStateLogin.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        await _auth
            .signInWithEmailAndPassword(email: email!, password: password!)
            .then((value) async {
          await saveUserInfo(UserModel(
            userId: value.user?.uid,
            name: name ?? value.user?.displayName,
            email: value.user?.email,
            picture: '',
          ));
          _userInfo = await getUserInfo();
        });
        Get.off(() => const HomePage());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          AwesomeDialog(
                  context: Get.context!,
                  title: 'Error',
                  body: const Text('No user found for that email.'))
              .show();
        } else if (e.code == 'wrong-password') {
          AwesomeDialog(
                  context: Get.context!,
                  title: 'Error',
                  body: const Text('Wrong password provided for that user.'))
              .show();
        }
      }
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    await deleteUserInfo();
    Get.offAll(() => const LoginView());
  }

  Future<void> deleteAccount() async {
    AwesomeDialog(
      context: Get.context!,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
      title: 'Account Delete!',
      titleTextStyle: const TextStyle(color: Colors.amberAccent, fontSize: 20),
      desc: 'Are You Sure You Want To Delete This Account?',
      descTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      dialogType: DialogType.WARNING,
      btnCancelOnPress: () {},
      btnOkOnPress: () async {
        await _user?.delete();

        await FireStoreService.instance.deleteUser(_user!.uid);
        await deleteUserInfo();
        Get.off(() => const LoginView());
      },
      btnCancelText: 'No',
      btnOkText: 'Yes',
    ).show();
  }

  Future<void> saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user?.uid,
      name: name ?? user.user?.displayName,
      email: user.user?.email,
      picture: '',
      address: {
        'street1': '',
        'street2': '',
        'city': '',
        'state': '',
        'country': '',
      },
    );
    await FireStoreService.instance.addUser(userModel);
    await saveUserInfo(userModel);
  }

  Future<UserModel> getUserInfo() async {
    late UserModel user;
    try {
      user = await Cache.instance.getData();
    } catch (e) {
      print(e.toString());
    }
    return user;
  }

  Future<void> saveUserInfo(UserModel user) async =>
      await Cache.instance.setData(user);

  Future<bool> deleteUserInfo() async => await Cache.instance.deleteData();

  @override
  void onInit() async {
    _userInfo = await getUserInfo();
    super.onInit();
  }
}
