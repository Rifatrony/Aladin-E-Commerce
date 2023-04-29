import 'package:aladin_ecommerce/view_model/checkout/custom_order_view_model.dart';
import 'package:aladin_ecommerce/views/custom_order_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOrderScreen extends StatefulWidget {
  const CustomOrderScreen({super.key});

  @override
  State<CustomOrderScreen> createState() => _CustomOrderScreenState();
}

class _CustomOrderScreenState extends State<CustomOrderScreen> {
  final controller = Get.put(CustomOrderViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.orderLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ListView.builder(
                  itemCount: controller.orderData.value.orders!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(CustomOrderDetailsScreen(id: controller.orderData.value.orders![index].id.toString(),));
                        print("Select id ${controller.orderData.value.orders![index].orderId}");
                      },
                      child: Container( 
                        margin: const EdgeInsets.only(left: 10, right: 10, top: 8),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          children: [
                            Text(controller.orderData.value.orders![index].orderId
                                .toString()),
                            Text(controller.orderData.value.orders![index].status
                                .toString()),
                            Text(controller.orderData.value.orders![index].paymentStatus
                                .toString()),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
      ),
    );
  }
}
