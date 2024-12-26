
import 'package:event_planning_app/utilies/app_colors.dart';
import 'package:event_planning_app/utilies/app_styles.dart';
import 'package:event_planning_app/utilies/assets_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'event_item_widget.dart';
import 'event_tab_widget.dart';


class HomeTab extends StatefulWidget {

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> eventNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workShop,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.priamaryLight,
        toolbarHeight: height * 0.08,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(AppLocalizations.of(context)!.welcome_back,
            style: AppStyles.regular14white,),
            Text('John Safwat',
            style: AppStyles.bold24white,),
          ],
        ),
        actions: [
          Row(
            children: [
              Icon(CupertinoIcons.sun_max,color: AppColors.whiteColor,size: 30,),
              SizedBox(width: width*0.02,),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.symmetric(horizontal: width*0.02),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Text('EN',style: AppStyles.bold14primaryLight,),
              )
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: height*0.11,
            decoration: BoxDecoration(
              color: AppColors.priamaryLight,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)
              )
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*0.03),
                  child: Row(
                    children: [
                      Image.asset(AssetsManager.iconMap),
                      Text('Cairo , Egypt',style: AppStyles.medium14white,)
                    ],
                  ),
                ),
                DefaultTabController(
                    length:eventNameList.length ,
                    child:TabBar(
                      onTap: (index){
                        selectedIndex =index;
                        setState(() {
          
                        });
                      },
                      padding: EdgeInsets.symmetric(vertical: height *0.02,),
                        indicatorColor: AppColors.priamaryLight,
                        dividerColor: Colors.transparent,
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        labelPadding: EdgeInsets.zero,
                        tabs: eventNameList.map((eventName){
                          return EventTabWidget(
                              isSelected: selectedIndex == eventNameList.indexOf(eventName),
                              eventName: eventName,
                          );
                        }).toList()
                    ) ,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context , index){
              return EventItemWidget();
            }),
          ),
        ],
      ),
    );
  }
}
