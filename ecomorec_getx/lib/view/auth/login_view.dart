// ignore_for_file: avoid_print

import 'package:eco_getx_app/core/viewmodel/auth_view_model.dart';
import 'package:eco_getx_app/view/auth/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_social_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

class LoginView extends GetView<AuthViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: const Color.fromRGBO(250, 250, 250, 1),
        padding:
            EdgeInsets.only(top: context.height * 0.10, left: 20, right: 20),
        child: Column(
          children: [
            Expanded(
              flex: 25,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: controller.formStateLogin,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText(
                            text: 'Welcome,',
                            fsize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          TextButton(
                              onPressed: () => Get.to(() => const SignUp()),
                              child: const CustomText(
                                text: 'Sign Up',
                                color: PRIMARY_COLOR,
                                fsize: 18,
                              ))
                        ],
                      ),
                      const CustomText(
                        text: 'Sign in to Continue',
                        fsize: 14,
                        color: TEXT_TITLE_COLOR,
                      ),
                      const Spacer(flex: 4),
                      const CustomText(
                          text: 'Email', color: TEXT_TITLE_COLOR, fsize: 14),
                      Expanded(
                        flex: 4,
                        child: CustomTextFormField(
                          text: 'iamdavid@gmail.com',
                          validator: (value) {
                            if (value == null) {
                              print('Error');
                            }
                            return null;
                          },
                          onsaved: (value) {
                            controller.email = value;
                          },
                        ),
                      ),
                      const Spacer(flex: 3),
                      const CustomText(
                          text: 'Password', color: TEXT_TITLE_COLOR, fsize: 14),
                      Expanded(
                        flex: 4,
                        child: CustomTextFormField(
                          text: '************',
                          letterSpacing: 3,
                          onsaved: (value) {
                            controller.password = value;
                          },
                          validator: (value) {
                            if (value == null) {
                              print('Error');
                            }
                            return null;
                          },
                        ),
                      ),
                      const Spacer(flex: 2),
                      const Expanded(
                        flex: 2,
                        child: CustomText(
                          text: 'Forgot Password?',
                          alignment: Alignment.topRight,
                        ),
                      ),
                      const Spacer(flex: 2),
                      CustomButton(
                          text: 'SIGN IN',
                          onPressed: () async {
                            await controller.signInWithEmailAndPassword();
                          }),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(flex: 2),
            const Expanded(
                child: CustomText(text: '-OR-', alignment: Alignment.center)),
            const Spacer(flex: 2),
            CustomSocialButton(
                onTap: () async {},
                icon: Icons.facebook,
                text: 'Sign In with Facebook',
                color: Colors.blue),
            const Spacer(),
            CustomSocialButton(
                onTap: () async {
                  await controller.signInwithGoogle();
                },
                icon: Icons.gamepad,
                text: 'Sign In with Google',
                color: Colors.amberAccent),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}


  // const CustomText(
  //                       text: 'Sign in to Continue',
  //                       fsize: 14,
  //                       color: TEXT_TITLE_COLOR,
  //                     ),
  //                     const SizedBox(height: 60),
  //                     const CustomText(
  //                         text: 'Email', color: TEXT_TITLE_COLOR, fsize: 14),
  //                     CustomTextFormField(
  //                       text: 'iamdavid@gmail.com',
  //                       validator: (value) {
  //                         if (value == null) {
  //                           print('Error');
  //                         }
  //                         return null;
  //                       },
  //                       onsaved: (value) {
  //                         controller.email = value;
  //                       },
  //                     ),
  //                     const SizedBox(height: 40),
  //                     const CustomText(
  //                         text: 'Password', color: TEXT_TITLE_COLOR, fsize: 14),
  //                     CustomTextFormField(
  //                       text: '************',
  //                       onsaved: (value) {
  //                         controller.password = value;
  //                       },
  //                       validator: (value) {
  //                         if (value == null) {
  //                           print('Error');
  //                         }
  //                         return null;
  //                       },
  //                     ),
  //                     const SizedBox(height: 30),
  //                     const CustomText(
  //                         text: 'Forgot Password?',
  //                         alignment: Alignment.topRight),
  //                     const SizedBox(height: 30),
  //                     CustomButton(
  //                         text: 'SIGN IN',
  //                         onPressed: () async {
  //                           await controller.signInWithEmailAndPassword();
  //                         })




//  const SizedBox(height: 15),
//               const CustomText(text: '-OR-', alignment: Alignment.center),
//               const SizedBox(height: 15),
//               CustomSocialButton(
//                   onTap: () async {},
//                   icon: Icons.facebook,
//                   text: 'Sign In with Facebook',
//                   color: Colors.blue),
//               const SizedBox(height: 20),
//               CustomSocialButton(
//                   onTap: () async {
//                     await controller.signInwithGoogle();
//                   },
//                   icon: Icons.gamepad,
//                   text: 'Sign In with Google',
//                   color: Colors.amberAccent),
//               const SizedBox(height: 20),