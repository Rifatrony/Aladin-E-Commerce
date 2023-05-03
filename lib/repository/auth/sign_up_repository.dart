import 'package:aladin_ecommerce/res/AppUrl.dart';
import 'package:aladin_ecommerce/services/NetworkApiServices.dart';

class SignUpRepository{
  final apiServices = NetworkApiServices();
  Future<dynamic> signUpApi(dynamic data) async {
    dynamic response = 
        await apiServices.loginApi(data, AppUrl.signUpUrl);
    return response;
  }
}