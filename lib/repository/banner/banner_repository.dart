import 'package:aladin_ecommerce/model/banner/banner_model.dart';
import 'package:aladin_ecommerce/res/AppUrl.dart';
import 'package:aladin_ecommerce/services/NetworkApiServices.dart';

class BannerRepository {
  final apiServices = NetworkApiServices();
  Future<BannerModel> getBanner() async {
    dynamic response = await apiServices.getApiWithoutHeader(AppUrl.bannerUrl);
    return BannerModel.fromJson(response);
  }
}