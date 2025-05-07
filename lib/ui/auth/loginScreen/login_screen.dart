import 'package:event_planning_app/ui/auth/registerScreen/register_screen.dart';
import 'package:event_planning_app/ui/homeScreen/home_screen.dart';
import 'package:event_planning_app/ui/homeScreen/tabs/widget/custom_elevated_button.dart';
import 'package:event_planning_app/utilies/app_colors.dart';
import 'package:event_planning_app/utilies/app_styles.dart';
import 'package:event_planning_app/utilies/assets_manager.dart';
import 'package:flutter/material.dart';
import '../../homeScreen/tabs/widget/custom_text_filed_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LoginScreen extends StatelessWidget {
  static const String routeName = 'login_screen';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.04,),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AssetsManager.logo,height: height*0.31,),
              TextFiledWidget(hintText:AppLocalizations.of(context)!.email,
              prefixIcon: Image.asset(AssetsManager.iconEmail),
              hintStyle: AppStyles.medium16gray,),
              SizedBox(height: height*0.02,),
              TextFiledWidget(hintText:AppLocalizations.of(context)!.password,
                obscureText: true,
                prefixIcon: Image.asset(AssetsManager.iconPass),
                hintStyle: AppStyles.medium16gray,
              suffixIcon: Image.asset(AssetsManager.visibleIcon),),
              SizedBox(height: height*0.02,),
              Text(AppLocalizations.of(context)!.forget_pass,
              style: AppStyles.boldItalic16primary.copyWith(
                  decoration:TextDecoration.underline,
                  decorationColor: AppColors.priamaryLight,
                  decorationThickness: 2 ),
                textAlign: TextAlign.end,
              ),
              SizedBox(height: height*0.02,),
              CustomElevatedButton(onButtonClicked: (){
                Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
              },
                  text: AppLocalizations.of(context)!.login,
              ),
              SizedBox(height: height*0.02,),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RegisterScreen.routeName);
                },
                child: Text.rich(
                  textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(context)!.dont_have_acc,
                          style: AppStyles.medium16black
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context)!.create_acc,
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
              SizedBox(height: height*0.02,),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.priamaryLight,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ),
                  Text('Or',style: AppStyles.medium16primary,),
                  Expanded(
                    child: Divider(
                      color: AppColors.priamaryLight,
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height*0.02,),
              CustomElevatedButton(
                  onButtonClicked: (){
                  },
                  text: AppLocalizations.of(context)!.login_with_google,
                backgroundColor: AppColors.whiteColor,
                textStyle: AppStyles.medium20primary,
                prefixIconButton: Image.asset(AssetsManager.googleIcon),

              )

            ],
          ),
        ),
      ),
    );
  }
}
