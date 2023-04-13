import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static void fieldFocusChange ( BuildContext context, FocusNode current, FocusNode next ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static snackBar(String title, String message){
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: Colors.green.shade400,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(
        bottom: 26,
        left: 16,
        right: 16
      )
    );
  }
  
}