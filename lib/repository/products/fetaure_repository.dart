import 'package:aladin_ecommerce/model/products/feature_product_model.dart';
import 'package:aladin_ecommerce/res/AppUrl.dart';
import 'package:aladin_ecommerce/services/NetworkApiServices.dart';

class FeatureRepository {
  final apiServices = NetworkApiServices();
  Future<FeatureModel> getFeature() async{
    dynamic response = await apiServices.getApi(AppUrl.featureUrl);
    return FeatureModel.fromJson(response);
  }
}