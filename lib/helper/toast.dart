import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  static void show(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
    );
  }


  Widget LoadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }



  static String formatDate(String? date){
    DateTime dt = DateTime.parse('$date 00:00:00');
    print("jkasjkasjk ${dt.year}");
    String newDate = "${dt.day}"+"-"+"${dt.month}"+"-" + "${dt.year}";
    return newDate;
  }


}
