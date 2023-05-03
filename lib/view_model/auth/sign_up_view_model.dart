import 'package:aladin_ecommerce/model/auth/login_response_model.dart';
import 'package:aladin_ecommerce/repository/auth/sign_up_repository.dart';
import 'package:aladin_ecommerce/utils/utils.dart';
import 'package:aladin_ecommerce/view_model/auth/user_preference.dart';
import 'package:aladin_ecommerce/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpViewModel extends GetxController {
  final repository = SignUpRepository();


  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final nameFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;
  final phoneFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  UserPrefernce userPrefernce = UserPrefernce();

  RxBool loading = false.obs;

  Future<void> signUpApi(dynamic data) async {

    loading.value = true;

    repository.signUpApi(data).then((value) {
      loading.value = false;

      if (value['message'] == "The given data was invalid.") {
        Utils.snackBar(
          "The given data was invalid.",
          "Error",
        );
      } 
      else {
        Utils.snackBar(
          "Registration Successful",
          "Thanks for create new account",
        );
        userPrefernce.saveUser(LoginResponseModel.fromJson(value)).then((value) {
          
        });
          Get.offAll(const HomeScreen());
          
        }

    });

  }
  
}
