import 'package:flutter/material.dart';

import '../../../../utilies/app_colors.dart';
import '../../../../utilies/app_styles.dart';
import '../../../../utilies/assets_manager.dart';


class EventItemWidget extends StatelessWidget {
  const EventItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.02,vertical: height*0.01),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetsManager.homeImage),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.priamaryLight)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8)
            ),
            margin: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.01),
            padding: EdgeInsets.symmetric(horizontal: width*0.02),
            child: Column(
              children: [
                Text("21",style: AppStyles.bold20primaryLight,),
                Text('Nov',style: AppStyles.bold14primaryLight,)
              ],
            ),
          ),
          SizedBox(height: height *0.10,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.01),
            margin: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.01),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('This is a Birthday Party',style: AppStyles.bold14black,),
                Image.asset(AssetsManager.iconLove)
              ],
            ),
          )
        ],
      ),
    );
  }
}
