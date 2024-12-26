import 'package:event_planning_app/ui/homeScreen/tabs/widget/custom_text_filed_widget.dart';
import 'package:event_planning_app/utilies/app_colors.dart';
import 'package:event_planning_app/utilies/app_styles.dart';
import 'package:event_planning_app/utilies/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../home/event_item_widget.dart';


class FavoriteTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: width*0.04),
              child: TextFiledWidget(
                borderColor: AppColors.priamaryLight,
                hintText: AppLocalizations.of(context)!.search_for_event,
                hintStyle: AppStyles.bold14primaryLight,
                prefixIcon: Image.asset(AssetsManager.iconSearch),
              )
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context , index){
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.01),
                child: EventItemWidget(),
              );
            }),
          ),

        ],
      ),
    );
  }
}
