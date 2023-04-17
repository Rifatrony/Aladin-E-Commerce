import 'package:aladin_ecommerce/view_model/cart/cart_view_model.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
      ),
      body: Obx(
        () => controller.cartLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
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
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            children: [
                              Text(controller
                                      .cart.value.data![index].product!.name
                                      .toString()),
                              // Expanded(
                              //   // wrap the first AppText widget with Expanded
                              //   child: AppText(
                              //     title: controller
                              //         .cart.value.data![index].product!.name
                              //         .toString(),
                              //     color: Colors.black,
                              //     textSize: 13,
                              //   ),
                              // ),
                              AppText(
                                title: controller.cart.value.data![index].total
                                    .toString(),
                                color: Colors.black,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.remove),
                                          onPressed: () {
                                            controller
                                                .decrementItemQuantity(index);
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
                                                .incrementItemQuantity(index);
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                })),
      ),
      bottomNavigationBar: Obx(
        () => controller.cartLoading.value
            ? const Center(child: CircularProgressIndicator.adaptive())
            : Container(
                height: 80,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26),
                      topRight: Radius.circular(26),
                    )),
                child: Text(
                  'Total: ${controller.getCartTotal().toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
      ),
    );
  }
}
