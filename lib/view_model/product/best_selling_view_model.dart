import 'package:aladin_ecommerce/model/products/best_selling_model.dart';
import 'package:aladin_ecommerce/repository/products/best_selling_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class BestSellingViewModel  extends GetxController{
  final repository = BestSellingRepository();
  var loading = false.obs;
  final bestSellProduct = BestSellingModel().obs;

  void setLoading(bool value){
    loading.value = value;
  }
  void setData(BestSellingModel value){
    bestSellProduct.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    getBestSellingProduct();
  }

  Future<void> getBestSellingProduct() async {
    setLoading(true);
    try {
      repository.getBestSelling().then((value) {
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