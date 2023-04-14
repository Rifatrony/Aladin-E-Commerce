import 'package:aladin_ecommerce/model/products/product_details_model.dart';
import 'package:aladin_ecommerce/repository/products/product_details_repository.dart';
import 'package:aladin_ecommerce/utils/utils.dart';
import 'package:get/get.dart';

class ProductDetailsViewModel extends GetxController{
  final repository = ProductDetailsRepository();
  final loading  = false.obs;
  final product = ProductDetailsModel().obs;

  void setLoading(bool value){
    loading.value = value;
  }
  void setData(ProductDetailsModel value){
    product.value = value;
  }

  Future<void> getProductDetails(String url) async {
    setLoading(true);
    try{
      repository.getProductDetails(url).then((value) {
        setLoading(false);
        setData(value);
      }).onError((error, stackTrace) {
        setLoading(false);
        Utils.snackBar("Error", error.toString());
      });
    }catch(error){
      setLoading(false);
    }
  }
}