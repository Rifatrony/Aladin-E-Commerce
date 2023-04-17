import 'package:aladin_ecommerce/view_model/accounts/order_view_model.dart';
import 'package:aladin_ecommerce/views/order_details_screen.dart';
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
      appBar: AppBar(
        title: const Text("Order List"),
      ),
      body: Obx( () =>
        orderViewModel.loading.value
        ? const Center(child: CircularProgressIndicator(),)
        : SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  height: Get.height * 0.07,
                  width: Get.width,
                  child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Order ID", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w500)),
                            Text("Qnty", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w500)),
                            Text("Amount", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w500)),
                            Text("Status", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w500)),
                            
                          ],
                        ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.83,
                child: ListView.builder(
                  itemCount: orderViewModel.order.value.data!.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: (){
                          Get.to(()=>OrderDetailsScreen(id: orderViewModel.order.value.data![index].id.toString(),));
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(orderViewModel.order.value.data![index].orderid.toString(), style: TextStyle(color: Colors.blue.shade400, fontWeight: FontWeight.w500),),
                              Text(orderViewModel.order.value.data![index].quantity.toString()),
                              Text(orderViewModel.order.value.data![index].amount.toString()),
                              Text(orderViewModel.order.value.data![index].status.toString()),
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