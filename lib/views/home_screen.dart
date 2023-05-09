// ignore_for_file: unused_element

import 'package:aladin_ecommerce/views/cart_screen.dart';
import 'package:aladin_ecommerce/views/dashboard_screen.dart';
import 'package:aladin_ecommerce/views/order.dart';
import 'package:aladin_ecommerce/views/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myIndex = 0;
  List<Widget> pages = [
    const DashboardScreen(),
    const CartScreen(),
    const OrderPage(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Center(
        child: pages[myIndex],
      ),
    
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepOrangeAccent.shade400,
        type: BottomNavigationBarType.shifting,
        currentIndex: myIndex,
        items: [
          BottomNavigationBarItem(icon: const Icon(Icons.home), label: "Home", backgroundColor: Colors.deepOrangeAccent.shade400),
          BottomNavigationBarItem(icon: const Icon(Icons.shopping_bag_outlined), label: "Cart", backgroundColor: Colors.deepOrangeAccent.shade400),
          BottomNavigationBarItem(icon: const Icon(Icons.list_alt_outlined), label: "Order", backgroundColor: Colors.deepOrangeAccent.shade400),
          BottomNavigationBarItem(icon: const Icon(Icons.person_outline), label: "Profile", backgroundColor: Colors.deepOrangeAccent.shade400),
        ],
        onTap: (index) {
          setState(() {
            myIndex= index;
          });
        },
        
      ),
    );
  }

  Future<bool>_onBackButtonPressed(BuildContext context) async {
    
    if(myIndex != 0){
      setState(() {
        myIndex = 0; // navigate to first page
      });
      return false;
    }
    else{
      bool? exitApp = await showDialog(
        context: context, 
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Aladin BD Online"),
            content: const Text("Do you really want to exit??"),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop(false);
                }, 
                child: const Text("No")
              ),

              TextButton(
                onPressed: (){
                  Navigator.of(context).pop(true);
                }, 
                child: const Text("Yes")
              ),
            ],
          );
        }
      );
      return exitApp ?? false;
    }
    

    
    
  }
}