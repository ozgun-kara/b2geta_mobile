import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbar(
    {required BuildContext context,
    required String message,
    bool isError = false}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: isError ? Colors.red.shade900 : Colors.black,
  ));
}

void showErrorDialog({required String message}) {
  Get.defaultDialog(
    title: message,
    backgroundColor: Colors.red,
    titleStyle: const TextStyle(color: Colors.white),
    middleTextStyle: const TextStyle(color: Colors.white),
  );
}
