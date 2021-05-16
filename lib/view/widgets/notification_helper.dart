import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSuccess({title, message}) {
  Get.snackbar(title, message,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      animationDuration: Duration(milliseconds: 200));
}

showError({title, message}) {
  Get.snackbar(title, message,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      animationDuration: Duration(milliseconds: 200));
}
