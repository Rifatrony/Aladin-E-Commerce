import 'package:aladin_ecommerce/model/checkout/delivery_mothod_model.dart';
import 'package:aladin_ecommerce/repository/checkout/delivery_mothod_repository.dart';
import 'package:aladin_ecommerce/utils/utils.dart';
import 'package:get/get.dart';

class DeliveryViewModel extends GetxController{
  final repository = DeliveryMethodRepository();
  final deliveryMethod = DeliveryMethodModel().obs;
  final loading = false.obs;

  void setSelectedDeliveryMethod(DeliveryMethodModel value) {
    deliveryMethod.value = value;
  }

  void setLoading(bool value){
    loading.value = value;
  }

  @override
  void onInit(){
    super.onInit();
    getDelivery();
  }

  Future<void> getDelivery() async{
    setLoading(true);
    try{
      repository.getDeliveryMethod().then((value) {
        setLoading(false);
        setSelectedDeliveryMethod(value);
      }).onError((error, stackTrace) {
        Utils.snackBar("Error", error.toString());
      });
      
    }catch(error){
      Utils.snackBar("Error", error.toString());
    }
  }
}