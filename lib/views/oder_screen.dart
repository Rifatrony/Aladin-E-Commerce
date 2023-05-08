import 'package:aladin_ecommerce/view_model/accounts/order_view_model.dart';
import 'package:aladin_ecommerce/views/home_screen.dart';
import 'package:aladin_ecommerce/views/order_details_screen.dart';
import 'package:aladin_ecommerce/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}


class _OrderScreenState extends State<OrderScreen> {
  final orderViewModel = Get.put(OrderViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => orderViewModel.loading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: orderViewModel.order.value.data!.isEmpty
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
                            Get.offAll(const HomeScreen());
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
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: SizedBox(
                              height: Get.height * 0.07,
                              width: Get.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text("Order ID",
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.w500)),
                                  Text("Qnty",
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.w500)),
                                  Text("Amount",
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.w500)),
                                  Text("Status",
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.83,
                            child: ListView.builder(
                                itemCount:
                                    orderViewModel.order.value.data!.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(() => OrderDetailsScreen(
                                              id: orderViewModel
                                                  .order.value.data![index].id
                                                  .toString(),
                                            ));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            top: 10,
                                            left: 5,
                                            right: 5,
                                            bottom: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              orderViewModel.order.value
                                                  .data![index].orderid
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.blue.shade400,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(orderViewModel.order.value
                                                .data![index].quantity
                                                .toString()),
                                            Text(orderViewModel
                                                .order.value.data![index].amount
                                                .toString()),
                                            Text(orderViewModel
                                                .order.value.data![index].status
                                                .toString()),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
              ),
      ),
    );
  }
}
