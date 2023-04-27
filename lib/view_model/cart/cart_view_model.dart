import 'package:aladin_ecommerce/model/cart/cart_model.dart';
import 'package:aladin_ecommerce/repository/cart/add_cart_repository.dart';
import 'package:aladin_ecommerce/utils/utils.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  final loading = false.obs;
  final repository = CartRepository();
  final cartLoading = false.obs;
  final cart = CartModel().obs;

  void setLoading(bool value) {
    loading.value = value;
  }

  void setCartLoading(bool value) {
    cartLoading.value = value;
  }

  void setCartData(CartModel value) {
    cart.value = value;
  }

  Future<void> incrementItemQuantity(int index, String url) async {
    try {
      repository.incrementCart(url).then((val) {
        cart.update((val) {
          val!.data![index].quantity = val.data![index].quantity! + 1;
          val.data![index].total = (double.parse(val.data![index].price!) *
                  val.data![index].quantity!)
              .toInt();
        });
      }).onError((error, stackTrace) {
        Utils.snackBar("Error", error.toString());
      });
    } catch (error) {
      Utils.snackBar("Error", error.toString());
    }
  }

  Future<void> decrementItemQuantity(int index, String url) async {
    try {
      repository.decrementCart(url).then((val) {
        cart.update((val) {
          if (val!.data![index].quantity! > 1) {
            val.data![index].quantity = val.data![index].quantity! - 1;
            val.data![index].total = (double.parse(val.data![index].price!) *
                    val.data![index].quantity!)
                .toInt();
          } else {
            Utils.snackBar("Error", "Quantity cannot be less than 1.");
          }
        });

        
      }).onError((error, stackTrace) {
        Utils.snackBar("Error", error.toString());
      });
    } catch (error) {
      Utils.snackBar("Error", error.toString());
    }
  }

  double getCartTotal() {
    double total = 0.0;
    if (cart.value.data != null) {
      // check if cart.value.data is not null
      for (Datum item in cart.value.data!) {
        total +=
            item.total ?? 0.0; // use null-aware operators to avoid null errors
      }
    }
    return total;
  }

  @override
  void onInit() {
    super.onInit();
    getCart();
  }

  Future<void> addToCart(dynamic data, String url) async {
    loading.value = true;
    try {
      repository.addToCart(data, url).then((value) {
        Utils.snackBar("Successful", "Added to cart");
        loading.value = false;
      }).onError((error, stackTrace) {
        Utils.snackBar("Error", error.toString());
        loading.value = false;
      });
    } catch (error) {
      Utils.snackBar("Error", error.toString());
      loading.value = false;
    }
  }

  Future<void> getCart() async {
    setCartLoading(true);
    try {
      repository.getCart().then((value) {
        setCartLoading(false);
        setCartData(value);
      }).onError((error, stackTrace) {
        Utils.snackBar("Error", error.toString());
        setCartLoading(false);
      });
    } catch (error) {
      Utils.snackBar("Error", error.toString());
      setCartLoading(false);
    }
  }
}
