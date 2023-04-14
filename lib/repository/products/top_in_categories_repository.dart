import 'package:aladin_ecommerce/model/products/top_in_categories_model.dart';
import 'package:aladin_ecommerce/res/AppUrl.dart';
import 'package:aladin_ecommerce/services/NetworkApiServices.dart';

class TopInCategoriesRepository {
  final apiServices = NetworkApiServices();
  Future<TopInCategoriesModel> getTopInCategories() async{
    dynamic response = await apiServices.getApi(AppUrl.topInCategoriesUrl);
    return TopInCategoriesModel.fromJson(response);
  }
}