import 'package:aladin_ecommerce/model/banner/banner_model.dart';
import 'package:aladin_ecommerce/repository/banner/banner_repository.dart';
import 'package:aladin_ecommerce/utils/utils.dart';
import 'package:get/get.dart';

class BannerViewModel extends GetxController{
  final loading = false.obs;
  final repository = BannerRepository();
  final banners = BannerModel().obs;
  var currentBanner = 0.obs;

  void setLoading(bool value){
    loading.value = value;
  }

  void setData(BannerModel value) {
    banners.value = value;
  }

  @override
  void onInit(){
    super.onInit();
    getBanner();
  }

  Future<void> getBanner() async{
    setLoading(true);
    try{
      repository.getBanner().then((value){
        setLoading(false);
        setData(value);
      });
    }catch(error){
      setLoading(false);
      Utils.snackBar("Error", error.toString());
    }
  }
}