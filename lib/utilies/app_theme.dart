import 'package:event_planning_app/utilies/app_colors.dart';
import 'package:event_planning_app/utilies/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static final ThemeData themeLight = ThemeData(
    primaryColor:AppColors.priamaryLight ,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.priamaryLight),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: true,
      selectedLabelStyle: AppStyles.bold12white,
      unselectedLabelStyle: AppStyles.bold12white,
      elevation: 0,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.priamaryLight,
      shape: StadiumBorder(side: BorderSide(color: AppColors.whiteColor,width: 6))
    )
  );
  static final ThemeData themeDark = ThemeData(
      primaryColor:AppColors.priamaryDark ,
      appBarTheme: AppBarTheme(backgroundColor: AppColors.priamaryDark),
      scaffoldBackgroundColor: AppColors.priamaryDark,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showUnselectedLabels: true,
          selectedLabelStyle: AppStyles.bold12white,
          unselectedLabelStyle: AppStyles.bold12white,
        elevation: 0,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0,
          backgroundColor: AppColors.priamaryDark,
          shape: StadiumBorder(side: BorderSide(color: AppColors.whiteColor,width: 6))
      )
  );


}