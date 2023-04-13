import 'package:aladin_ecommerce/res/AppUrl.dart';
import 'package:aladin_ecommerce/services/NetworkApiServices.dart';

class LoginRepository{
  final apiServices = NetworkApiServices();
  Future<dynamic> loginApi(var data) async {
    dynamic response = 
        await apiServices.loginApi(data, AppUrl.loginUrl);
    return response;
  }
}