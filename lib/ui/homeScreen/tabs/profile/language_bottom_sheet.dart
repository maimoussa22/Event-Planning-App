import 'package:event_planning_app/utilies/app_colors.dart';
import 'package:event_planning_app/utilies/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../../provider/app_language_provider.dart';


class LanguageBottomSheet extends StatefulWidget{
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var appLanguage = Provider.of<AppLanguageProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: (){
                appLanguage.changeLanguage('en');
              },
              child: appLanguage.appLanguage == 'en' ?
              getSelected(AppLocalizations.of(context)!.english)
                  : unSelected(AppLocalizations.of(context)!.english),
            ),
            SizedBox(height:height*0.02,),
            InkWell(
              onTap: (){
                appLanguage.changeLanguage('ar');
              },
              child: appLanguage.appLanguage == 'ar'?
                  getSelected(AppLocalizations.of(context)!.arabic)
              : unSelected(AppLocalizations.of(context)!.arabic)
            ),
          ],
        ),
      ),
    );
  }

  Widget getSelected(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
          style: AppStyles.bold20primaryLight,),
        Icon(Icons.check,color: AppColors.priamaryLight,size: 30,)
      ],
    );
  }
  Widget unSelected(String text){
    return Text(text,
      style: AppStyles.bold20black,);
  }
}