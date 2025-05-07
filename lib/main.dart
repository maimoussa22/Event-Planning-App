import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_app/provider/app_language_provider.dart';
import 'package:event_planning_app/provider/app_theme_provider.dart';
import 'package:event_planning_app/ui/auth/loginScreen/login_screen.dart';
import 'package:event_planning_app/ui/auth/registerScreen/register_screen.dart';
import 'package:event_planning_app/ui/homeScreen/add_event.dart';
import 'package:event_planning_app/ui/homeScreen/home_screen.dart';
import 'package:event_planning_app/utilies/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<AppLanguageProvider>( create: (context) => AppLanguageProvider()),
        ChangeNotifierProvider<AppThemeProvider>( create: (context) => AppThemeProvider()),
      ],
      child: myApp()
  )
  );
}

class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      routes: {
        HomeScreen.routeName:(context) => HomeScreen(),
        LoginScreen.routeName:(context) => LoginScreen(),
        RegisterScreen.routeName:(context) => RegisterScreen(),
        AddEventScreen.routeName:(context) => AddEventScreen(),
      },
      theme: AppTheme.themeLight,
      darkTheme: AppTheme.themeDark,
      themeMode: themeProvider.appTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale:Locale(languageProvider.appLanguage),
    );
  }

}