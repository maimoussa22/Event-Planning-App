import 'package:event_planning_app/utilies/app_colors.dart';
import 'package:event_planning_app/utilies/app_styles.dart';
import 'package:flutter/material.dart';

class TextFiledWidget extends StatelessWidget {
  Color? borderColor;
  String hintText;
  String? labelText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool obscureText;
  int? maxLines;
  String? Function(String?)? validator;
  TextEditingController? controller;

  TextFiledWidget({this.borderColor,required this.hintText, this.hintStyle,
    this.maxLines,this.validator,this.controller,
  this.labelText, this.labelStyle , this.prefixIcon,this.suffixIcon,this.obscureText =false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      obscuringCharacter: '*',
      maxLines:maxLines ?? 1 ,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle??AppStyles.medium14gray,
        labelText: labelText,
        labelStyle: labelStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
              color: borderColor ?? AppColors.grayColor,
              width: 2
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
              color: borderColor ?? AppColors.grayColor,
              width: 2
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
              color: Colors.red,
              width: 2
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
              color: Colors.red,
              width: 2
          ),
        ),
      ),
    );
  }
}
