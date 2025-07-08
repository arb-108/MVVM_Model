import 'dart:math';

import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';
class Utils{
  static Flushbar<dynamic>? _currentFlushbar;
  static toastMessage(String message){
    Fluttertoast.showToast(msg:message,);
  }

  static double generateRandomDouble({double min = 0, double max = 8}) {
    Random random = Random();
    return min + (random.nextDouble() * (max - min));
  }

  static void flushbarErrorMessage(String message,BuildContext context){
    _currentFlushbar?.dismiss();

     _currentFlushbar=Flushbar(
      // forwardAnimationCurve: Curves.decelerate,
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      borderRadius: BorderRadius.circular(6),
      flushbarPosition: FlushbarPosition.BOTTOM,
      padding: EdgeInsets.all(15),
      backgroundColor: Colors.red,
      reverseAnimationCurve: Curves.easeOut,
      positionOffset: 20,
      icon: Icon(Icons.error,size: 28,color: Colors.white,),
      message: message,
      duration: Duration(seconds: 2),
       mainButton: IconButton(onPressed: (){
         Navigator.of(context, rootNavigator: true).pop();
       }, icon: Icon(Icons.close,color: Colors.white,)),

    )..show(context);
  }

  static void showSuccess(String message,BuildContext context) {
    _currentFlushbar?.dismiss(context);
    _currentFlushbar=Flushbar(
      message: message,
      icon: const Icon(Icons.check_circle_outline, color: Colors.white, size: 28),
      backgroundColor: Colors.green.shade600,
      flushbarPosition: FlushbarPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      borderRadius: BorderRadius.circular(8),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(16),
      positionOffset: 20,
      forwardAnimationCurve: Curves.easeInOut,
      reverseAnimationCurve: Curves.easeOut,
      mainButton: IconButton(
        icon: Icon(Icons.close, color: Colors.white),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop(); // Closes Flushbar
        },
      ),
    )..show(context);
  }
}