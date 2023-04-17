import 'package:aladin_ecommerce/model/account/order_details_model.dart';
import 'package:aladin_ecommerce/model/account/order_model.dart';
import 'package:aladin_ecommerce/res/AppUrl.dart';
import 'package:aladin_ecommerce/services/NetworkApiServices.dart';

class OrderRepository {
  final apiServices = NetworkApiServices();
  Future<OrderModel> getOrder() async {
    dynamic response = await apiServices.getApi(AppUrl.orderUrl);
    return OrderModel.fromJson(response);
  }

  Future<OrderDetailsModel> getOrderDetails(String url) async {
    dynamic response = await apiServices.getApi(url);
    return OrderDetailsModel.fromJson(response);
  }
}