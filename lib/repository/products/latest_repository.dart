import 'package:aladin_ecommerce/model/products/latest_model.dart';

import 'package:aladin_ecommerce/res/AppUrl.dart';
import 'package:aladin_ecommerce/services/NetworkApiServices.dart';

class LatestRepository {
  final apiServices = NetworkApiServices();
  Future<LatestModel> getLatest() async{
    dynamic response = await apiServices.getApi(AppUrl.latestUrl);
    return LatestModel.fromJson(response);
  }
}