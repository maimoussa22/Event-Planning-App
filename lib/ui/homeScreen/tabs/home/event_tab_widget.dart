import 'package:event_planning_app/utilies/app_colors.dart';
import 'package:event_planning_app/utilies/app_styles.dart';
import 'package:flutter/material.dart';

class EventTabWidget extends StatelessWidget {
  bool isSelected ;
  String eventName;

  EventTabWidget({required this.isSelected , required this.eventName});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width *0.02),
        padding: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.003),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.whiteColor : Colors.transparent,
            borderRadius: BorderRadius.circular(46),
        border: Border.all(color: AppColors.whiteColor,width: 2)
      ),
      child: Text(eventName,
      style: isSelected ? AppStyles.medium16primary : AppStyles.medium16white),
    );
  }
}
