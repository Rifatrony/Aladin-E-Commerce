import 'package:aladin_ecommerce/model/account/order_details_model.dart';
import 'package:aladin_ecommerce/model/account/order_model.dart';
import 'package:aladin_ecommerce/repository/accounts/order_repository.dart';
import 'package:aladin_ecommerce/utils/utils.dart';
import 'package:get/get.dart';

class OrderViewModel extends GetxController{
  final repository = OrderRepository();
  final order = OrderModel().obs;
  final orderDetails = OrderDetailsModel().obs;
  final loading = false.obs;
  final detailsLoading = false.obs;

  void setLoading(bool value){
    loading.value = value;
  }
  void setDetailsLoading(bool value){
    detailsLoading.value = value;
  }
  void setData(OrderModel value){
    order.value = value;
  }
  void setOrderDetails(OrderDetailsModel value){
    orderDetails.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    getOrder();
  }

  Future<void> getOrder() async {
    setLoading(true);
    try{
      
      repository.getOrder().then((value) {
        setLoading(false);
        setData(value);
      });
    }catch(error){
      setLoading(false);
      Utils.snackBar("Error", error.toString());
    }
  }

  Future<void> getOrderDetails(String url) async {
    setDetailsLoading(true);
    try{
      
      repository.getOrderDetails(url).then((value) {
        setDetailsLoading(false);
        setOrderDetails(value);
      });
    }catch(error){
      setDetailsLoading(false);
      Utils.snackBar("Error", error.toString());
    }
  }
}