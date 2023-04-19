import 'package:aladin_ecommerce/model/products/product_details_model.dart';
import 'package:aladin_ecommerce/repository/products/product_details_repository.dart';
import 'package:aladin_ecommerce/utils/utils.dart';
import 'package:get/get.dart';

class ProductDetailsViewModel extends GetxController{
  final repository = ProductDetailsRepository();
  final loading  = false.obs;
  final product = ProductDetailsModel().obs;
  final quantity = 1.obs;

  void setLoading(bool value){
    loading.value = value;
  }
  void setData(ProductDetailsModel value){
    product.value = value;
  }

  void increment(){
    quantity.value ++ ;
  }
  void decrement(){
    if(quantity.value>1){
      quantity.value -- ;
    }
    else{
      Utils.snackBar("Error", "Quantity can't be less then 1");
    }
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