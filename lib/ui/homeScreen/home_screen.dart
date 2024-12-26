import 'package:event_planning_app/ui/homeScreen/tabs/favorite/favorite_tab.dart';
import 'package:event_planning_app/ui/homeScreen/tabs/home/home_tab.dart';
import 'package:event_planning_app/ui/homeScreen/tabs/map/map_tab.dart';
import 'package:event_planning_app/ui/homeScreen/tabs/profile/profile_tab.dart';
import 'package:event_planning_app/utilies/app_colors.dart';
import 'package:event_planning_app/utilies/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget>tabs = [HomeTab(),MapTab(),FavoriteTab(),ProfileTab()];

  int selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
        ),
        child: BottomAppBar(
          padding: EdgeInsets.zero,
          shape: CircularNotchedRectangle(),
          color: Theme.of(context).primaryColor,
          notchMargin: 2,
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
              onTap: (index){
              selectedIndex = index;
              setState(() {

              });
              },
              items:[
                selectedIndex==0?
                item(iconName: AssetsManager.selectedIconHome,label: AppLocalizations.of(context)!.home,index: 0)
                    : item(iconName: AssetsManager.iconHome,label: AppLocalizations.of(context)!.home,index: 0),
                selectedIndex == 1?
                item(iconName: AssetsManager.selectedIconMap,label: AppLocalizations.of(context)!.map,index: 1)
                    : item(iconName: AssetsManager.iconMap,label: AppLocalizations.of(context)!.map,index: 1),
                selectedIndex == 2 ?
                item(iconName: AssetsManager.selectedIconFavorite,label: AppLocalizations.of(context)!.love,index: 2)
                    : item(iconName: AssetsManager.iconFavorite,label: AppLocalizations.of(context)!.love,index: 2),
                selectedIndex == 3?
                item(iconName: AssetsManager.selectedIconProfile,label: AppLocalizations.of(context)!.profile,index: 3)
                    : item(iconName: AssetsManager.iconProfile,label: AppLocalizations.of(context)!.profile,index: 3),

          ]
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
      child: Icon(Icons.add,color: AppColors.whiteColor,)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }

  BottomNavigationBarItem item ({required String iconName ,required String label,required index}){
    return BottomNavigationBarItem(icon:Image.asset(iconName),label:label,);
  }
}
