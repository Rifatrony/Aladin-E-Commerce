import 'package:aladin_ecommerce/model/products/top_in_categories_model.dart';
import 'package:aladin_ecommerce/repository/products/top_in_categories_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class TopInCategoriesViewModel  extends GetxController{
  final repository = TopInCategoriesRepository();
  var loading = false.obs;
  final topInCategoriesProduct = TopInCategoriesModel().obs;

  void setLoading(bool value){
    loading.value = value;
  }
  void setData(TopInCategoriesModel value){
    topInCategoriesProduct.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    getTopInCategoryProduct();
  }

  Future<void> getTopInCategoryProduct() async {
    setLoading(true);
    try {
      repository.getTopInCategories().then((value) {
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