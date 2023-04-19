import 'package:aladin_ecommerce/model/checkout/delivery_mothod_model.dart';
import 'package:aladin_ecommerce/res/AppUrl.dart';
import 'package:aladin_ecommerce/services/NetworkApiServices.dart';

class DeliveryMethodRepository{
  final apiServices = NetworkApiServices();
  Future<DeliveryMethodModel> getDeliveryMethod() async {
    dynamic response = await apiServices.getApiWithoutHeader(AppUrl.deliveryMethodUrl);
    return DeliveryMethodModel.fromJson(response);
  }
}