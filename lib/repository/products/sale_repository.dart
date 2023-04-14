import 'package:aladin_ecommerce/model/products/sale_model.dart';
import 'package:aladin_ecommerce/res/AppUrl.dart';
import 'package:aladin_ecommerce/services/NetworkApiServices.dart';

class SaleRepository {
  final apiServices = NetworkApiServices();
  Future<SaleModel> getSale() async{
    dynamic response = await apiServices.getApi(AppUrl.saleUrl);
    return SaleModel.fromJson(response);
  }
}