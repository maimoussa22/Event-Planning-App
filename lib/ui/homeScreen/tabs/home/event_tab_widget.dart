import 'package:event_planning_app/utilies/app_colors.dart';
import 'package:event_planning_app/utilies/app_styles.dart';
import 'package:flutter/material.dart';

class EventTabWidget extends StatelessWidget {
  bool isSelected ;
  String eventName;
  Color? color;
  TextStyle selectedTextColor;
  TextStyle unSelectedTextColor;
  Color borderColor;

  EventTabWidget({required this.isSelected , required this.eventName,
  this.color, required this.selectedTextColor , required this.unSelectedTextColor,
  required this.borderColor});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width *0.02),
        padding: EdgeInsets.symmetric(horizontal: width*0.03,vertical: height*0.003),
      decoration: BoxDecoration(
        color: isSelected ? color : Colors.transparent,
            borderRadius: BorderRadius.circular(46),
        border: Border.all(color:borderColor,width: 2)
      ),
      child: Text(eventName,
      style: isSelected ? selectedTextColor : unSelectedTextColor),
    );
  }
}
