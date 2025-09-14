import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toaster {
  static void success(String message, {Toast? length}) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: 16.0,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      toastLength: length ?? Toast.LENGTH_SHORT,
    );
  }

  static void error(String message, {Toast? length}) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: 16.0,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      toastLength: length ?? Toast.LENGTH_SHORT,
    );
  }

  static void info(String message, {Toast? length}) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: 16.0,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.blue,
      toastLength: length ?? Toast.LENGTH_SHORT,
    );
  }

  static void warning(String message, {Toast? length}) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: 16.0,
      textColor: Colors.black,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.yellow,
      toastLength: length ?? Toast.LENGTH_SHORT,
    );
  }

  static void normal(String message, {Toast? length}) {
    Fluttertoast.showToast(
      msg: message,
      fontSize: 16.0,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      toastLength: length ?? Toast.LENGTH_SHORT,
    );
  }
}
