import 'package:aladin_ecommerce/model/account/profile_model.dart';
import 'package:aladin_ecommerce/repository/accounts/user_profile_repository.dart';
import 'package:aladin_ecommerce/utils/utils.dart';
import 'package:get/get.dart';

class ProfileViewModel extends GetxController{
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
}

