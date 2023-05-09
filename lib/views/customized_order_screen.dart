import 'package:aladin_ecommerce/views/custom_order_proceed.dart';
import 'package:aladin_ecommerce/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomizedOrderScreen extends StatefulWidget {
  const CustomizedOrderScreen({super.key});

  @override
  State<CustomizedOrderScreen> createState() => _CustomizedOrderScreenState();
}

class _CustomizedOrderScreenState extends State<CustomizedOrderScreen> {

  final productController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customized Your Order"),
        backgroundColor: Colors.deepOrangeAccent.shade400,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.2,
              ),
              Text(
                "You can order by write your products details or given order images",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.redAccent.shade400,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: productController,
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: "আপনার পছন্দ মত বাজার লিস্ট তৈরি করুন যেমনঃ আলু-৩কেজি, পিয়াজ-১কেজি",
                      labelText: "আপনার পছন্দ মত বাজার লিস্ট তৈরি করুন যেমনঃ আলু-৩কেজি, পিয়াজ-১কেজি",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppButton(
                  onPress: () {
                    Get.to(()=> CustomOrderProceedScreen(product: productController.text.toString().trim()));
                  },
                  title: "Submit",
                  height: 50,
                  color: Colors.deepOrangeAccent.shade400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
