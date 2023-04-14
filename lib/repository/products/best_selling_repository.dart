import 'package:aladin_ecommerce/model/products/best_selling_model.dart';
import 'package:aladin_ecommerce/res/AppUrl.dart';
import 'package:aladin_ecommerce/services/NetworkApiServices.dart';

class BestSellingRepository {
  final apiServices = NetworkApiServices();
  Future<BestSellingModel> getBestSelling() async{
    dynamic response = await apiServices.getApi(AppUrl.bestSellingUrl);
    return BestSellingModel.fromJson(response);
  }
}