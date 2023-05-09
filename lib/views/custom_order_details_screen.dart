import 'package:aladin_ecommerce/res/AppUrl.dart';
import 'package:aladin_ecommerce/view_model/checkout/custom_order_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomOrderDetailsScreen extends StatefulWidget {
  final String id;
  const CustomOrderDetailsScreen({super.key, required this.id});

  @override
  State<CustomOrderDetailsScreen> createState() =>
      _CustomOrderDetailsScreenState();
}

class _CustomOrderDetailsScreenState extends State<CustomOrderDetailsScreen> {
  final controller = Get.put(CustomOrderViewModel());

  @override
  void initState() {
    super.initState();
    controller
        .getCustomOrderDetails("${AppUrl.customOrderDetailsUrl}/${widget.id}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent.shade400,
        elevation: 0,
        title: const Text("Product Details"),
      ),
      body: Obx(
        () => controller.orderDetailsLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  InvoiceRow(title: "Name", value: controller.orderDetailsData.value.name.toString()),
                  InvoiceRow(title: "Email", value: controller.orderDetailsData.value.email.toString()),
                  InvoiceRow(title: "Phone", value: controller.orderDetailsData.value.phone.toString()),
                  InvoiceRow(title: "Status", value: controller.orderDetailsData.value.phone.toString()),
                  InvoiceRow(title: "Product", value: controller.orderDetailsData.value.product.toString()),
                ],
              ),
      ),
    );
  }
}
class InvoiceRow extends StatelessWidget {
  final String title, value;
  const InvoiceRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ]
      ),
    );
  }
}
