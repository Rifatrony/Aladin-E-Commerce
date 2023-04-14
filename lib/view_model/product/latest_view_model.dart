import 'package:aladin_ecommerce/model/products/latest_model.dart';
import 'package:aladin_ecommerce/repository/products/latest_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class LatestViewModel  extends GetxController{
  final repository = LatestRepository();
  var loading = false.obs;
  final latestProduct = LatestModel().obs;

  void setLoading(bool value){
    loading.value = value;
  }
  void setData(LatestModel value){
    latestProduct.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    getLatestProduct();
  }

  Future<void> getLatestProduct() async {
    setLoading(true);
    try {
      repository.getLatest().then((value) {
        setLoading(false);
        setData(value);
      });
    } catch (error) {
      setLoading(false);
      if (kDebugMode) {
        print("Error here $error");
      }
    }
  }
}