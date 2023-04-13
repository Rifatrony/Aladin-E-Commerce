import 'package:aladin_ecommerce/model/auth/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefernce {
  Future<bool> saveUser(LoginResponseModel responseModel) async {
    
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("access_token", responseModel.accessToken.toString());
    return true;
  }

  Future<LoginResponseModel> getUser() async {
    
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? accessToken = sp.getString("access_token");
    return LoginResponseModel(
      accessToken: accessToken
    );
  }

  Future<String?> getAccessToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? accessToken = sp.getString("access_token");
    return accessToken;
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}
