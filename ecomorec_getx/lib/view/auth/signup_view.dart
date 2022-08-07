import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/viewmodel/auth_view_model.dart';
import '../../helper/constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_text_form_field.dart';

class SignUp extends GetView<AuthViewModel> {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      ),
      body: Column(
        children: [
          const Spacer(),
          Expanded(
            flex: 15,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: controller.formStateSignup,
                  child: Column(
                    children: [
                      const CustomText(
                        text: 'Sign Up',
                        fsize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                      const Spacer(),
                      const CustomText(
                          text: 'Name', color: TEXT_TITLE_COLOR, fsize: 14),
                      Expanded(
                        flex: 2,
                        child: CustomTextFormField(
                          text: 'David Spade',
                          validator: (value) {
                            if (value!.length > 100) {
                              return 'name cant to be larger than 100 letter';
                            }
                            if (value.length < 2) {
                              return 'name cant to be less than 2';
                            }
                            return null;
                          },
                          onsaved: (value) => controller.name = value,
                        ),
                      ),
                      // const Spacer(),
                      const CustomText(
                          text: 'Email', color: TEXT_TITLE_COLOR, fsize: 14),
                      Expanded(
                        flex: 2,
                        child: CustomTextFormField(
                          text: 'iamdavid@gmail.com',
                          validator: (value) {
                            if (value!.length > 100) {
                              return 'email cant to be larger than 100 letter';
                            }
                            if (value.length < 2) {
                              return 'email cant to be less than 2';
                            }
                            return null;
                          },
                          onsaved: (value) => controller.email = value,
                        ),
                      ),
                      // const Spacer(),
                      const CustomText(
                          text: 'Password', color: TEXT_TITLE_COLOR, fsize: 14),
                      Expanded(
                        flex: 2,
                        child: CustomTextFormField(
                          text: '************',
                          letterSpacing: 3,
                          onsaved: (value) => controller.password = value,
                          validator: (value) {
                            if (value!.length > 100) {
                              return 'password cant to be larger than 100 letter';
                            }
                            if (value.length < 4) {
                              return 'password cant to be less than 4';
                            }
                            return null;
                          },
                        ),
                      ),
                      // const Spacer(flex: 2),
                      CustomButton(
                          text: 'SIGN UP',
                          onPressed: () async => await controller.signUp())
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
