import 'package:aladin_ecommerce/model/checkout/custom_order_list_model.dart';
import 'package:aladin_ecommerce/model/checkout/order_details_model.dart';
import 'package:aladin_ecommerce/res/AppUrl.dart';
import 'package:aladin_ecommerce/services/NetworkApiServices.dart';

class CustomOrderRepository {
  final apiServices = NetworkApiServices();
  Future<dynamic> createCustomOrder(dynamic data, String url) async {
    dynamic response = await apiServices.postApi(data, url);
    return response;
  }

  Future<CustomOrderListModel> getCustomOrder() async {
    dynamic response = await apiServices.getApi(AppUrl.customOrderListUrl);
    return CustomOrderListModel.fromJson(response);
  }

  Future<CustomOrderDetailsModel> getCustomOrderDetails(String url) async {
    dynamic response = await apiServices.getApi(url);
    return CustomOrderDetailsModel.fromJson(response);
  }
 }