// ignore_for_file: non_constant_identifier_names

import 'package:aladin_ecommerce/res/AppUrl.dart';
import 'package:aladin_ecommerce/view_model/accounts/order_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsScreen extends StatefulWidget {
  final String id;
  const OrderDetailsScreen({super.key, required this.id});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final controller = Get.put(OrderViewModel());

  @override
  void initState() {
    super.initState();
    controller.getOrderDetails("${AppUrl.orderDetailsUrl}/${widget.id}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Obx(
              () => controller.detailsLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        RowItem(title: "Name", value: controller.orderDetails.value.name.toString()),
                        RowItem(title: "Order Id", fontWeight: FontWeight.bold, value:  controller.orderDetails.value.orderid.toString()),
                        RowItem(title: "Status", value: controller.orderDetails.value.status.toString()),
                        RowItem(title: "Sub Total", value: controller.orderDetails.value.subTotal.toString()),
                        RowItem(title: "Delivery Charge", value: controller.orderDetails.value.deliveryRate.toString()),
                        RowItem(title: "total", value: controller.orderDetails.value.total.toString()),
                        RowItem(title: "Delivery", value: controller.orderDetails.value.delivery.toString()),
                        RowItem(title: "Phone", value: controller.orderDetails.value.phone.toString()),
                        RowItem(title: "Address", value: controller.orderDetails.value.address.toString()),

                        SizedBox(height: Get.height * 0.02,),
              
                        ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: controller.orderDetails.value.items!.length,
                          itemBuilder: (context, index){
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                              child: Container(
                                padding: const EdgeInsets.symmetric( vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.grey.shade200
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RowItem(title: "Name", value: controller.orderDetails.value.items![index].name.toString()),
                                    RowItem(title: "Quantity", value: controller.orderDetails.value.items![index].quantity.toString()),
                                    RowItem(title: "Price", value: controller.orderDetails.value.items![index].price.toString()),
                                    RowItem(title: "Total (${controller.orderDetails.value.items![index].quantity.toString()} x ${controller.orderDetails.value.items![index].price.toString()})", value: controller.orderDetails.value.items![index].total.toString()),
                                  ],
                                ),
                              ),
                            );
                          })
                        
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  final String title, value;
  final double textSize;
  final FontWeight fontWeight;
  const RowItem({super.key, required this.title, required this.value, this.textSize = 13, this.fontWeight = FontWeight.w400});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: textSize,
              fontWeight: fontWeight
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: textSize,
              fontWeight: fontWeight
            ),
          ),
        ],
      ),
    );      
  }
}
