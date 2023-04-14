import 'package:aladin_ecommerce/model/category/category_model.dart';
import 'package:aladin_ecommerce/repository/category/category_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CategoryViewModel  extends GetxController{
  final repository = CategoryRepository();
  var loading = false.obs;
  final category = CategoryModel().obs;

  void setLoading(bool value){
    loading.value = value;
  }
  void setData(CategoryModel value){
    category.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    getCategory();
  }

  Future<void> getCategory() async {
    setLoading(true);
    try {
      repository.getCategory().then((value) {
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