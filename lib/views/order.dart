import 'package:aladin_ecommerce/views/custom_order_screen.dart';
import 'package:aladin_ecommerce/views/oder_screen.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrangeAccent,
            elevation: 0,
            title: const Text("Order"),
            bottom: const TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              tabs: [
                Tab(
                  text: "Custom Order",
                ),
                Tab(
                  text: "Order",
                )
              ]),
          ),
          body: const TabBarView(
            children: [
              CustomOrderScreen(),
              OrderScreen(),
            ]),
        ));
  }
}
