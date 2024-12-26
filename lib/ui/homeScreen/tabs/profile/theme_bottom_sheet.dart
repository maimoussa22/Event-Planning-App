import 'package:event_planning_app/provider/app_theme_provider.dart';
import 'package:event_planning_app/utilies/app_colors.dart';
import 'package:event_planning_app/utilies/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class ThemeBottomSheet extends StatefulWidget{
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheet();
}

class _ThemeBottomSheet extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var appTheme = Provider.of<AppThemeProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: (){
                appTheme.changeTheme(ThemeMode.light);
              },
              child: appTheme.appTheme == ThemeMode.light ?
              getSelected(AppLocalizations.of(context)!.light)
                  : unSelected(AppLocalizations.of(context)!.light),
            ),
            SizedBox(height:height*0.02,),
            InkWell(
              onTap: (){
                appTheme.changeTheme(ThemeMode.dark);
              },
              child: appTheme.appTheme == ThemeMode.dark ?
              getSelected(AppLocalizations.of(context)!.dark)
                  : unSelected(AppLocalizations.of(context)!.dark),
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