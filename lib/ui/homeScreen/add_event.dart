import 'package:event_planning_app/firebase_utils.dart';
import 'package:event_planning_app/model/event.dart';
import 'package:event_planning_app/ui/homeScreen/tabs/home/event_tab_widget.dart';
import 'package:event_planning_app/ui/homeScreen/tabs/widget/choose_date_time.dart';
import 'package:event_planning_app/ui/homeScreen/tabs/widget/custom_elevated_button.dart';
import 'package:event_planning_app/ui/homeScreen/tabs/widget/custom_text_filed_widget.dart';
import 'package:event_planning_app/utilies/app_colors.dart';
import 'package:event_planning_app/utilies/app_styles.dart';
import 'package:event_planning_app/utilies/assets_manager.dart';
import 'package:event_planning_app/utilies/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class AddEventScreen extends StatefulWidget {
  static const String routeName = 'add_event_screen';

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  int selectedIndex = 0;

  var formKey =   GlobalKey<FormState>();

  DateTime? selectedDate;
  String formattedDate = '';
  TimeOfDay? selectedTime;
  String formattedTime = '';
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  String selectedEventName = '';
  String selectedEventImage = '';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    List<String> eventNameList = [
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

    List<String> eventImageList = [
      AssetsManager.sportImage,
      AssetsManager.birthdayImage,
      AssetsManager.meetingImage,
      AssetsManager.gamingImage,
      AssetsManager.workshopImage,
      AssetsManager.bookClubImage,
      AssetsManager.exhibitionImage,
      AssetsManager.holidayImage,
      AssetsManager.eatingImage,
    ];

    selectedEventImage = eventImageList[selectedIndex];
    selectedEventName = eventNameList[selectedIndex];
    print(selectedEventName);
    print(selectedEventImage);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        iconTheme: IconThemeData(color: AppColors.priamaryLight),
        title: Text(AppLocalizations.of(context)!.create_event,
        style: AppStyles.medium20primary,),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*0.03,vertical: height*0.02),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                  child: Image.asset(eventImageList[selectedIndex],
                  height: height*0.25,)
              ),
              SizedBox(height: height*0.02,),
              Container(
                height: height*0.04,
                child: ListView.builder(
                  itemCount: eventNameList.length,
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: (){
                          selectedIndex = index;
                          setState(() {

                          });
                        },
                        child: EventTabWidget(
                          borderColor: AppColors.priamaryLight,
                            color: AppColors.priamaryLight,
                            selectedTextColor: AppStyles.medium16white,
                            unSelectedTextColor: AppStyles.medium16primary,
                            isSelected: selectedIndex == index,
                            eventName: eventNameList[index]),
                      );
                    },
                ),
              ),
              Form(
                key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: height*0.02,),
                      Text(AppLocalizations.of(context)!.title,style: AppStyles.medium16black,),
                      TextFiledWidget(
                        validator:(text){
                          if(text ==null || text.isEmpty){
                            return 'Please Enter Event Title';
                          }
                          return null;
                        } ,
                        controller: titleController,
                        hintText: AppLocalizations.of(context)!.event_title,
                        hintStyle: AppStyles.medium16gray,
                        prefixIcon: Image.asset(AssetsManager.titleIcon),
                      ),
                      SizedBox(height: height*0.02,),
                      Text(AppLocalizations.of(context)!.description,style: AppStyles.medium16black,),
                      TextFiledWidget(
                        validator:(text){
                          if(text ==null || text.isEmpty){
                            return 'Please Enter Event Title';
                          }
                          return null;
                        } ,
                        controller: descriptionController,
                        hintText: AppLocalizations.of(context)!.event_description,
                        hintStyle: AppStyles.medium16gray,
                        maxLines: 5,
                      ),
                      SizedBox(height: height*0.02,),
                      ChooseDateTime(
                        iconName: AssetsManager.dateIcon,
                        eventDateOrTime: AppLocalizations.of(context)!.event_date,
                        chooseDateOrTime: selectedDate==null ?
                        AppLocalizations.of(context)!.choose_date
                            :formattedDate,
                        functionDateOrTime: chooseDate,
                      ),
                      ChooseDateTime(
                        iconName: AssetsManager.timeIcon,
                        eventDateOrTime: AppLocalizations.of(context)!.event_time,
                        chooseDateOrTime: selectedTime == null?
                        AppLocalizations.of(context)!.choose_time
                            : formattedTime,
                        functionDateOrTime: chooseTime,
                      ),
                      SizedBox(height: height*0.02,),
                      Text(AppLocalizations.of(context)!.location,style: AppStyles.medium16black,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: width*0.02,
                            vertical: height*0.01),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.priamaryLight,
                                width: 2
                            )
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: Image.asset(AssetsManager.locationIcon),
                              padding: EdgeInsets.symmetric(horizontal: width*0.02,
                                  vertical: height*0.01),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.priamaryLight
                              ),
                            ),
                            SizedBox(width: width*0.02,),
                            Text(AppLocalizations.of(context)!.choose_event_location,
                              style: AppStyles.medium16primary,),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios_rounded,color: AppColors.priamaryLight,),
                          ],
                        ),
                      ),
                      SizedBox(height: height*0.02,),
                      CustomElevatedButton(
                          onButtonClicked: (){
                            addEvent();
                          },
                          text: AppLocalizations.of(context)!.add_event
                      ),
                    ],
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
  void chooseDate()async{
    var chooseDate = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))
    );
    selectedDate = chooseDate;
    formattedDate = DateFormat('dd/MM/yyy').format(selectedDate!);
    setState(() {

    });
  }
  void chooseTime()async{
    var chooseTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
    );
    selectedTime = chooseTime;
    formattedTime = selectedTime!.format(context);
    setState(() {

    });

  }
  void addEvent() {
    if(formKey.currentState?.validate()==true){
      Event event = Event(
          title: titleController.text,
          description: descriptionController.text,
          eventName: selectedEventName,
          image: selectedEventImage,
          date: selectedDate,
          time: formattedTime
      );
      FirebaseUtils.addEventToFireStore(event).timeout(Duration(milliseconds: 500),
      onTimeout: (){

        ToastUtils.showToast('Added Event Successfully');
      });
    }
  }
}
