import 'package:event_planning_app/utilies/app_styles.dart';
import 'package:flutter/material.dart';

class ChooseDateTime extends StatelessWidget {
  final String iconName;
  final String eventDateOrTime;
  final String chooseDateOrTime;
  final Function functionDateOrTime;

  const ChooseDateTime({super.key, required this.iconName,required this.eventDateOrTime,
required this.chooseDateOrTime, required this.functionDateOrTime});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Image.asset(iconName),
        SizedBox(width:width*0.02 ,),
        Text(eventDateOrTime,style: AppStyles.medium16black,),
        Spacer(),
        TextButton(
            onPressed: (){
          functionDateOrTime();
        },
            child: Text(chooseDateOrTime,style: AppStyles.medium16primary,)
        )
      ],
    );
  }
}
