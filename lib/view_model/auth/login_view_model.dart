import 'package:aladin_ecommerce/model/auth/login_response_model.dart';
import 'package:aladin_ecommerce/repository/auth/login_repository.dart';
import 'package:aladin_ecommerce/utils/utils.dart';
import 'package:aladin_ecommerce/view_model/auth/user_preference.dart';
import 'package:aladin_ecommerce/views/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  final repository = LoginRepository();

  UserPrefernce userPrefernce = UserPrefernce();

  final phoneController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final phoneFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  Future<void> loginApi(dynamic data) async {

    loading.value = true;

    repository.loginApi(data).then((value) {
      loading.value = false;

      if (value['message'] == "The given data was invalid.") {
        Utils.snackBar(
          "Credential Don't Match.",
          value['message'] + " Please check your Number & Password",
        );
      } else {
        Utils.snackBar(
          "Login Successful",
          "Welcome back ☺️ ",
        );

        userPrefernce.saveUser(LoginResponseModel.fromJson(value)).then((value) {
          
        });

        Get.offAll(const DashboardScreen());

        
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Error", error.toString());
    });
  }
}
