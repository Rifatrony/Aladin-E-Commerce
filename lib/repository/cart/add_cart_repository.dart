import 'package:aladin_ecommerce/model/cart/cart_model.dart';
import 'package:aladin_ecommerce/res/AppUrl.dart';
import 'package:aladin_ecommerce/services/NetworkApiServices.dart';

class CartRepository{
  final apiServices = NetworkApiServices();
  Future<void> addToCart(dynamic data, String url) async {
    dynamic response = await apiServices.postApiWithRawData(data, url);
    return response;
  }

  Future<CartModel> getCart() async {
    dynamic response = await apiServices.getApi(AppUrl.getCartUrl);
    return CartModel.fromJson(response);
  }

  Future<void> incrementCart(String url) async {
    dynamic response = await apiServices.getApi(url);
    return response;
  }

  Future<void> decrementCart(String url) async {
    dynamic response = await apiServices.getApi(url);
    return response;
  }
}