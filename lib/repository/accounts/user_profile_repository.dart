import 'package:aladin_ecommerce/model/account/profile_model.dart';
import 'package:aladin_ecommerce/res/AppUrl.dart';
import 'package:aladin_ecommerce/services/NetworkApiServices.dart';

class Profilerepository {
  final apiService = NetworkApiServices();
  Future<ProfileModel> getUserProfile() async{
    dynamic response = await apiService.getApi(AppUrl.profileUrl);
    return ProfileModel.fromJson(response);
  }

  Future updateUserProfile(dynamic data) async{
    dynamic response = await apiService.postApi(data, AppUrl.updateProfileUrl);
    return response;
  }
}