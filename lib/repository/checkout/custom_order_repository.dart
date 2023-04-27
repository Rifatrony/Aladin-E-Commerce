import 'package:aladin_ecommerce/services/NetworkApiServices.dart';

class CustomOrderRepository {
  final apiServices = NetworkApiServices();
  Future<dynamic> createCustomOrder(dynamic data, String url) async {
    dynamic response = await apiServices.postApi(data, url);
    return response;
  }
 }