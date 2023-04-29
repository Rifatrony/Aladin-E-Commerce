import 'package:aladin_ecommerce/model/checkout/custom_order_list_model.dart';
import 'package:aladin_ecommerce/model/checkout/order_details_model.dart';
import 'package:aladin_ecommerce/repository/checkout/custom_order_repository.dart';
import 'package:aladin_ecommerce/utils/utils.dart';
import 'package:aladin_ecommerce/views/order.dart';
import 'package:get/get.dart';

class CustomOrderViewModel extends GetxController {

  final repository = CustomOrderRepository();
  final loading = false.obs;
  final orderLoading = false.obs;
  final orderDetailsLoading = false.obs;
  final orderData = CustomOrderListModel().obs;
  final orderDetailsData = CustomOrderDetailsModel().obs;

  void setData(CustomOrderListModel value) {
    orderData.value = value;
  }

  void setOrderDetails(CustomOrderDetailsModel value) {
    orderDetailsData.value = value;
  }

  void setLoading(bool value){
    orderLoading.value = value;
  }
  void setOrderDetailsLoading(bool value){
    orderDetailsLoading.value = value;
  }

  @override
  void onInit(){
    super.onInit();
    getCustomOrder();
  }

  Future<dynamic> createCustomOrder(dynamic data, String url) async {
    loading.value = true;
    try {
      loading.value = false;
      repository.createCustomOrder(data, url).then((response) {
        if (response["success"]["status"] == true) {
          loading.value = false;
          Utils.snackBar("Successful", "Order Place Successfully");
          Get.offAll(const OrderPage());
        }
      }).onError((error, stackTrace) {
      });
    } catch (error) {
      loading.value = false;
      Utils.snackBar("Error here", error.toString());
    }
  }

  Future<dynamic> getCustomOrder() async {
    setLoading(true);
    try {
      setLoading(true);
      repository.getCustomOrder().then((value) {
        setData(value);
        setLoading(false);
      }).onError((error, stackTrace) {
      });
    } catch (error) {
     setLoading(false);
      Utils.snackBar("Error here", error.toString());
    }
  }

  Future<dynamic> getCustomOrderDetails(String url) async {
    setOrderDetailsLoading(true);
    try {
      setOrderDetailsLoading(true);
      repository.getCustomOrderDetails(url).then((value) {
        setOrderDetails(value);
        setOrderDetailsLoading(false);
      }).onError((error, stackTrace) {
      });
    } catch (error) {
     setOrderDetailsLoading(false);
      Utils.snackBar("Error here", error.toString());
    }
  }
}
