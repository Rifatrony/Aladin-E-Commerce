import 'package:aladin_ecommerce/model/products/feature_product_model.dart';
import 'package:aladin_ecommerce/repository/products/fetaure_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class FeatureViewModel  extends GetxController{
  final repository = FeatureRepository();
  var loading = false.obs;
  final featureProduct = FeatureModel().obs;

  void setLoading(bool value){
    loading.value = value;
  }
  void setData(FeatureModel value){
    featureProduct.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    getFeatureProduct();
  }

  Future<void> getFeatureProduct() async {
    setLoading(true);
    try {
      repository.getFeature().then((value) {
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