import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toaster {
  static void success(String message, {bool isLong = false}) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: 16.0,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
    );
  }

  static void error(String message, {bool isLong = false}) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: 16.0,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
    );
  }

  static void info(String message, {bool isLong = false}) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: 16.0,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.blue,
      toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
    );
  }

  static void warning(String message, {bool isLong = false}) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: 16.0,
      textColor: Colors.black,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.yellow,
      toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
    );
  }

  static void normal(String message, {bool isLong = false}) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: 16.0,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
    );
  }
}
