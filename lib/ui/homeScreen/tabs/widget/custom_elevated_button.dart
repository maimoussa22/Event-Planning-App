import 'package:event_planning_app/utilies/app_colors.dart';
import 'package:event_planning_app/utilies/app_styles.dart';
import 'package:event_planning_app/utilies/assets_manager.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  Function onButtonClicked ;
  String text;
  TextStyle? textStyle;
  Color? backgroundColor;
  Widget? prefixIconButton;
  CustomElevatedButton({required this.onButtonClicked, required this.text,
  this.textStyle, this.backgroundColor,  this.prefixIconButton});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return ElevatedButton(
        onPressed: (){
          onButtonClicked();
        },
      style: ElevatedButton.styleFrom(
        backgroundColor:backgroundColor?? AppColors.priamaryLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: AppColors.priamaryLight)
        ),
        padding: EdgeInsets.symmetric(vertical: height*0.015)
      ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefixIconButton ?? SizedBox(),
            SizedBox(width: width*0.02,),
            Text(text,style: textStyle ?? AppStyles.medium20white,),
          ],
        ),
    );
  }
}
