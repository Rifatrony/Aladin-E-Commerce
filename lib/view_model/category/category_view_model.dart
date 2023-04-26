import 'package:aladin_ecommerce/model/category/category_model.dart';
import 'package:aladin_ecommerce/model/category/category_wise_model.dart';
import 'package:aladin_ecommerce/repository/category/category_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CategoryViewModel  extends GetxController{
  final repository = CategoryRepository();
  var loading = false.obs;
  var categoryLoading = false.obs;
  final category = CategoryModel().obs;
  final categoryWiseProduct = CategoryWiseModel().obs;

  void setLoading(bool value){
    loading.value = value;
  }
  void setData(CategoryModel value){
    category.value = value;
  }

  void setCategoryLoading(bool value){
    categoryLoading.value = value;
  }
  void setCategoryData(CategoryWiseModel value){
    categoryWiseProduct.value = value;
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

  Future<void> getCategoryWiseProduct(String url) async {
    setCategoryLoading(true);
    try {
      repository.getCategoryWiseProduct(url).then((value) {
        setCategoryLoading(false);
        setCategoryData(value);
      });
    } catch (error) {
      setCategoryLoading(false);
      if (kDebugMode) {
        print("Error here $error");
      }
    }
  }
}