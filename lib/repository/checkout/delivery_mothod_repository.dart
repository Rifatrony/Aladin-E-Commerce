import 'dart:convert';

import 'package:aladin_ecommerce/model/checkout/delivery_mothod_model.dart';
import 'package:aladin_ecommerce/res/AppUrl.dart';
import 'package:aladin_ecommerce/services/NetworkApiServices.dart';

class DeliveryMethodRepository{
  final apiServices = NetworkApiServices();
  Future<List<DeliveryMethodModel>> getDeliveryMethod() async {
    dynamic response = await apiServices.getApi(AppUrl.deliveryMethodUrl);
    List<DeliveryMethodModel> deliveryMethods = deliveryMethodModelFromJson(json.encode(response));
    return deliveryMethods;
  }

  Future<dynamic> proceedOrder(dynamic data) async {
    dynamic response = apiServices.postApi(data, AppUrl.proceedOrderUrl);
    return response;
  }
}
