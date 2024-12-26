import 'package:event_planning_app/ui/homeScreen/tabs/profile/theme_bottom_sheet.dart';
import 'package:event_planning_app/utilies/app_colors.dart';
import 'package:event_planning_app/utilies/app_styles.dart';
import 'package:event_planning_app/utilies/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../../provider/app_language_provider.dart';
import '../../../../provider/app_theme_provider.dart';
import 'language_bottom_sheet.dart';


class ProfileTab extends StatelessWidget {
  static const String routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguageProvider>(context);
    var appTheme = Provider.of<AppThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
          bottomLeft:Radius.circular(65)
        )),
        toolbarHeight:height*0.18 ,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(AssetsManager.profileImage),
            SizedBox(width:width*0.05 ,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('John Safwat',style: AppStyles.bold24white,),
                  Text('johnsafwat.route@gmail.com',style: AppStyles.medium16white,)
                ],
              ),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:appTheme.appTheme == ThemeMode.light?
                Text(AppLocalizations.of(context)!.language,
              style: AppStyles.bold20black,)
                :Text(AppLocalizations.of(context)!.language,
              style: AppStyles.bold20white,)
          ),
          InkWell(
            onTap: (){
              showLanguageBottomSheet(context);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16,vertical:16 ),
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.priamaryLight,
                  width: 2
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appLanguage.appLanguage == 'ar'?
                  Text(AppLocalizations.of(context)!.arabic,style: AppStyles.bold20primaryLight,)
                    :Text(AppLocalizations.of(context)!.english,
                    style: AppStyles.bold20primaryLight,),
                  Icon(Icons.arrow_drop_down,color: AppColors.priamaryLight,size: 30,)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: appTheme.appTheme == ThemeMode.dark ?
            Text(AppLocalizations.of(context)!.theme,
              style: AppStyles.bold20white,)
                : Text(AppLocalizations.of(context)!.theme,
              style: AppStyles.bold20black,)
          ),
          InkWell(
            onTap: (){
              showThemeBottomSheet(context);
              },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16,vertical:16 ),
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: AppColors.priamaryLight,
                      width: 2
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  appTheme.appTheme == ThemeMode.light?
                  Text(AppLocalizations.of(context)!.light,
                    style: AppStyles.bold20primaryLight,)
                  :Text(AppLocalizations.of(context)!.dark,
                    style: AppStyles.bold20primaryLight,),
                  Icon(Icons.arrow_drop_down,color: AppColors.priamaryLight,size: 30,)
                ],
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.03),
            child: ElevatedButton(
                onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.redColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                )
              ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: height*0.02),
                  child: Row(
                    children: [
                      Icon(Icons.logout,color: AppColors.whiteColor,size: 25,),
                      SizedBox(width: width*0.02,),
                      Text(AppLocalizations.of(context)!.logout,style: AppStyles.regular20white,)
                    ],
                  ),
                ),
            ),
          )
        ],
      ),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context,
        builder: (context) => LanguageBottomSheet()
    );
  }
  void showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context,
        builder: (context) => ThemeBottomSheet()
    );
  }
}
