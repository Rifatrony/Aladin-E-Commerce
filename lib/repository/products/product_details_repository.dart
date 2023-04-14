import 'package:aladin_ecommerce/model/products/product_details_model.dart';
import 'package:aladin_ecommerce/services/NetworkApiServices.dart';

class ProductDetailsRepository{
  final apiServices = NetworkApiServices();
  Future<ProductDetailsModel> getProductDetails(String url) async {
    dynamic response = await apiServices.getApi(url);
    return ProductDetailsModel.fromJson(response);
  }
}