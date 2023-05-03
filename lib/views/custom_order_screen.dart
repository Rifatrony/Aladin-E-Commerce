import 'package:aladin_ecommerce/view_model/checkout/custom_order_view_model.dart';
import 'package:aladin_ecommerce/views/custom_order_details_screen.dart';
import 'package:aladin_ecommerce/views/dashboard_screen.dart';
import 'package:aladin_ecommerce/widgets/app_button.dart';
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
            : controller.orderData.value.orders!.isEmpty 
            ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: Get.height * 0.1,),
                          Image(
                            height: Get.height * 0.3,
                            width: Get.width * 0.8,
                            image: const NetworkImage("https://assets.materialup.com/uploads/16e7d0ed-140b-4f86-9b7e-d9d1c04edb2b/preview.png")),
                          
                          SizedBox(height: Get.height * 0.02,),
                          const Text("No Order Found"),
                          SizedBox(height: Get.height * 0.05,),
                          AppButton(onPress: (){
                            Get.offAll(const DashboardScreen());
                          }, title: "Back to home", color: Colors.deepOrangeAccent, height: 50,),
                          SizedBox(height: Get.height * 0.01,),
                          Container(
                            height: 50,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.circular(16)
                            ),
                            child: TextButton.icon(
                              onPressed: (){}, 
                              icon: const Icon(
                                Icons.refresh, color: Colors.white,
                              ), 
                              label: const Text(
                                "Retry", 
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
            : Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ListView.builder(
                  itemCount: controller.orderData.value.orders!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(CustomOrderDetailsScreen(id: controller.orderData.value.orders![index].id.toString(),));
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
