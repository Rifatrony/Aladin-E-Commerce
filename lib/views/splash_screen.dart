import 'dart:async';
import 'package:aladin_ecommerce/views/dashboard_screen.dart';
import 'package:aladin_ecommerce/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async{
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token');

    if (accessToken != null) {
      Timer(const Duration(seconds: 3), () {
      Get.offAll(const DashboardScreen());
    });
    }
    else{
      Timer(const Duration(seconds: 3), () {
      Get.offAll(const LoginScreen());
    });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              height: Get.height * 0.2,
              width: Get.height * 0.6,
              image: const AssetImage("assets/commerce.png")
            ),

            SizedBox(height: Get.height * 0.1),

            const CircularProgressIndicator()
          ],
        )
      )
    );
  }
}