import 'package:aladin_ecommerce/repository/checkout/custom_order_repository.dart';
import 'package:aladin_ecommerce/utils/utils.dart';
import 'package:get/get.dart';

class CustomOrderViewModel extends GetxController {
  final repository = CustomOrderRepository();
  final loading = false.obs;

  Future<dynamic> createCustomOrder(dynamic data, String url) async {
    loading.value = true;
    try {
      loading.value = false;
      repository.createCustomOrder(data, url).then((response) {
        if (response["success"]["status"] == true) {
          loading.value = false;
          Utils.snackBar("Successful", "Order Place Successfully");
        }
      }).onError((error, stackTrace) {
      });
    } catch (error) {
      loading.value = false;
      Utils.snackBar("Error here", error.toString());
    }
  }
}
