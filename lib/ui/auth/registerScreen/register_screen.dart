import 'package:event_planning_app/ui/auth/loginScreen/login_screen.dart';
import 'package:event_planning_app/ui/homeScreen/home_screen.dart';
import 'package:event_planning_app/ui/homeScreen/tabs/widget/custom_elevated_button.dart';
import 'package:event_planning_app/utilies/app_colors.dart';
import 'package:event_planning_app/utilies/app_styles.dart';
import 'package:event_planning_app/utilies/assets_manager.dart';
import 'package:flutter/material.dart';
import '../../homeScreen/tabs/widget/custom_text_filed_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class RegisterScreen extends StatelessWidget {
  static const String routeName = 'register_screen';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,
      title: Text(AppLocalizations.of(context)!.register,),
      centerTitle: true,),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.04,),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AssetsManager.logo,height: height*0.25,),
              TextFiledWidget(hintText:AppLocalizations.of(context)!.name,
                prefixIcon: Image.asset(AssetsManager.iconName),
                hintStyle: AppStyles.medium16gray,),
              SizedBox(height: height*0.03,),
              TextFiledWidget(hintText:AppLocalizations.of(context)!.email,
              prefixIcon: Image.asset(AssetsManager.iconEmail),
              hintStyle: AppStyles.medium16gray,),
              SizedBox(height: height*0.03,),
              TextFiledWidget(hintText:AppLocalizations.of(context)!.password,
                obscureText: true,
                prefixIcon: Image.asset(AssetsManager.iconPass),
                hintStyle: AppStyles.medium16gray,
              suffixIcon: Image.asset(AssetsManager.visibleIcon),),
              SizedBox(height: height*0.03,),
              TextFiledWidget(hintText:AppLocalizations.of(context)!.re_password,
                obscureText: true,
                prefixIcon: Image.asset(AssetsManager.iconPass),
                hintStyle: AppStyles.medium16gray,
                suffixIcon: Image.asset(AssetsManager.visibleIcon),),
              SizedBox(height: height*0.03,),
              CustomElevatedButton(onButtonClicked: (){
                Navigator.popAndPushNamed(context, HomeScreen.routeName);
              },
                  text: AppLocalizations.of(context)!.create_acc,
              ),
              SizedBox(height: height*0.03,),
              InkWell(
                onTap: (){
                  Navigator.popAndPushNamed(context, LoginScreen.routeName);
                },
                child: Text.rich(
                  textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(context)!.already_have_acc,
                          style: AppStyles.medium16black
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context)!.login,
                          style: AppStyles.mediumItalic16primary.copyWith(
                            decoration: TextDecoration.underline,
                              decorationColor: AppColors.priamaryLight,
                              decorationThickness: 2
                          )
                        )
                      ]
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
