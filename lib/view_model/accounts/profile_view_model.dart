import 'package:aladin_ecommerce/model/account/profile_model.dart';
import 'package:aladin_ecommerce/repository/accounts/user_profile_repository.dart';
import 'package:aladin_ecommerce/utils/utils.dart';
import 'package:aladin_ecommerce/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileViewModel extends GetxController{


  final phoneController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final addressController = TextEditingController().obs;

  final phoneFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;
  final addressFocusNode = FocusNode().obs;


  final repostiory = Profilerepository();
  final user = ProfileModel().obs;
  var loading = false.obs;

  void setLoading(bool value){
    loading.value = value;
  }
  void setData(ProfileModel value){
    user.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    getUserProfile();
  }

  Future<void> getUserProfile() async {
    setLoading(true);
    try{
      repostiory.getUserProfile().then((value) {
        setLoading(false); 
        setData(value);
      });
    }catch(error){
      setLoading(false);
      Utils.snackBar("Error", error.toString());
    }
  }

  Future<void> updateProfile(dynamic data) async{
    repostiory.updateUserProfile(data).then((value) {
      if(value["message"] == "Token invoked"){
        Utils.snackBar("Profile Updated", "Login Again");
        Get.offAll(const LoginScreen());
      }
      else{
        Utils.snackBar("Can't Update Profile", "");
      }
    }).onError((error, stackTrace) {
      Utils.snackBar("Error", error.toString());
    });
  }
}

