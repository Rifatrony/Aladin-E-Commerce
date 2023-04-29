import 'package:aladin_ecommerce/res/AppUrl.dart';
import 'package:aladin_ecommerce/view_model/cart/cart_view_model.dart';
import 'package:aladin_ecommerce/views/order_proceed.dart';
import 'package:aladin_ecommerce/widgets/app_button.dart';
import 'package:aladin_ecommerce/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final controller = Get.put(CartViewModel());
  // final deliveryMethodController = Get.put(DeliveryViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 0,
        title: const Text("My Cart"),
      ),
      body: Obx(() => controller.cartLoading.value
          ? const Center(child: CircularProgressIndicator())
          : controller.cart.value.data!.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: controller.cart.value.data!.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(16)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(controller
                                  .cart.value.data![index].product!.thumbnail
                                  .toString()),
                            ),
                            SizedBox(
                              width: Get.width * 0.02,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Get.width * 0.65,
                                  child: Text(
                                    controller
                                        .cart.value.data![index].product!.name
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * 0.01,
                                ),

                                // AppText(
                                //   title: controller
                                //       .cart.value.data![index].total
                                //       .toString(),
                                //   color: Colors.grey.shade800,
                                //   fontWeight: FontWeight.w400,
                                // ),

                                AppText(
                                  title:
                                      "${controller.cart.value.data![index].quantity} X ${controller.cart.value.data![index].price}",
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w400,
                                ),

                                SizedBox(
                                  height: Get.height * 0.01,
                                ),

                                Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: () {
                                          if(controller.cart.value.data![index].quantity! > 1){
                                            controller
                                              .decrementItemQuantity(index, "${AppUrl.incrementCartUrl}/${controller.cart.value.data![index].product!.id}/decrement");

                                          }
                                        
                                        },
                                      ),
                                      AppText(
                                        title: controller
                                            .cart.value.data![index].quantity
                                            .toString(),
                                        color: Colors.black,
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {
                                          controller
                                              .incrementItemQuantity(index, "${AppUrl.incrementCartUrl}/${controller.cart.value.data![index].product!.id}/increment");
                                        },
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: Get.height * 0.005,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }))
              : Center(
                  child: Image(
                      height: Get.height * 0.3,
                      width: Get.width * 0.6,
                      image: const AssetImage("assets/empty_cart.png")))),
      bottomNavigationBar: Obx(() => controller.cartLoading.value
          ? const Center(child: CircularProgressIndicator())
          : controller.cart.value.data!.isNotEmpty
              ? Container(
                  height: 120,
                  decoration: BoxDecoration(
                      color: Colors.greenAccent.shade100,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(26),
                        topRight: Radius.circular(26),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Total: ${controller.getCartTotal().toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        child: AppButton(
                          onPress: () {
                            Get.to(const OrderProceedScreen());
                          },
                          title: "Checkout",
                          color: Colors.greenAccent.shade400,
                        ),
                      )
                    ],
                  ),
                )
              : const Text("")),
    );
  }
}
