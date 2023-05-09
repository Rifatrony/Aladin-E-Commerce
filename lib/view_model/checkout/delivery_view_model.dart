import 'package:aladin_ecommerce/model/checkout/delivery_mothod_model.dart';
import 'package:aladin_ecommerce/repository/checkout/delivery_mothod_repository.dart';
import 'package:aladin_ecommerce/utils/utils.dart';
import 'package:aladin_ecommerce/views/order.dart';
import 'package:get/get.dart';

class DeliveryViewModel extends GetxController{
  final repository = DeliveryMethodRepository();
  final deliveryMethod = List<DeliveryMethodModel>.empty().obs;
  final loading = false.obs;
  final proceedLoading = false.obs;

  void setSelectedDeliveryMethod(List<DeliveryMethodModel> value) {
    deliveryMethod.value = value;
  }

  void setLoading(bool value){
    loading.value = value;
  }
  void setProceedLoading(bool value){
    proceedLoading.value = value;
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

  Future<void> proceedOrder(dynamic data) async {
    setProceedLoading(true);
    try{
      setProceedLoading(false);
      repository.proceedOrder(data).then((value) {
        setProceedLoading(false);
        if(value["success"]["status"] == true){
          Utils.snackBar("Order Placed Successfully", "Thank you for place order");
          Get.to(const OrderPage());
        }
        else{
          Utils.snackBar("Error", "Can't placed order");
        }
      });
    }catch(error){
      setProceedLoading(false);
    }
  }
}