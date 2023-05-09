import 'package:aladin_ecommerce/view_model/checkout/delivery_view_model.dart';
import 'package:aladin_ecommerce/views/order_proceed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  final controller = Get.put(DeliveryViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delivery Method"),
        elevation: 0,
        backgroundColor: Colors.deepOrangeAccent.shade400,
      ),

      // OrderProceedScreen
      body: Obx(() => controller.loading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Text("Tap on a Delivery Method", style: TextStyle(color: Colors.redAccent.shade400),),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: controller.deliveryMethod.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(OrderProceedScreen(id: controller.deliveryMethod[index].id.toString()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.grey.shade200),
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.all(16),
                          child: Text(
                              "${controller.deliveryMethod[index].name.toString()} Delivery Charge ${controller.deliveryMethod[index].rate.toString()} tk"),
                        ),
                      );
                    }),
              ),
            ],
          )),
    );
  }
}
