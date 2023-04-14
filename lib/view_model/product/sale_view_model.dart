import 'package:aladin_ecommerce/model/products/sale_model.dart';
import 'package:aladin_ecommerce/repository/products/sale_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SaleViewModel  extends GetxController{
  final repository = SaleRepository();
  var loading = false.obs;
  final saleProduct = SaleModel().obs;

  void setLoading(bool value){
    loading.value = value;
  }
  void setData(SaleModel value){
    saleProduct.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    getSaleProduct();
  }

  Future<void> getSaleProduct() async {
    setLoading(true);
    try {
      repository.getSale().then((value) {
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