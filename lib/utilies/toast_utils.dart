import 'package:event_planning_app/utilies/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils{
  static void showToast(String msg) {
    Fluttertoast.showToast(
        msg:msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.priamaryLight,
        textColor: AppColors.whiteColor,
        fontSize: 16.0
    );
  }
}