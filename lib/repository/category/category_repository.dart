import 'package:aladin_ecommerce/model/category/category_model.dart';
import 'package:aladin_ecommerce/model/category/category_wise_model.dart';
import 'package:aladin_ecommerce/res/AppUrl.dart';
import 'package:aladin_ecommerce/services/NetworkApiServices.dart';

class CategoryRepository {
  final apiServices = NetworkApiServices();
  Future<CategoryModel> getCategory() async{
    dynamic response = await apiServices.getApi(AppUrl.categoryUrl);
    return CategoryModel.fromJson(response);
  }

  Future<CategoryWiseModel> getCategoryWiseProduct(String url) async{
    dynamic response = await apiServices.getApi(url);
    return CategoryWiseModel.fromJson(response);
  }
}