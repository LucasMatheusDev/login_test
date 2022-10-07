import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_test/src/domain/interface/show_snackbar.dart';

class ShowSnackBarImp implements IShowSnackBar {
  @override
  void show(
    String message,
  ) {
    Get.snackbar(
      "",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
