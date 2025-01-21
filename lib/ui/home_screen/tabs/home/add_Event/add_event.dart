import 'package:event_planning_app/firebase_utils.dart';
import 'package:event_planning_app/model/event.dart';
import 'package:event_planning_app/ui/home_screen/tabs/home/tab_event_widget.dart';
import 'package:event_planning_app/ui/home_screen/tabs/widget/choose_date_or_time.dart';
import 'package:event_planning_app/ui/home_screen/tabs/widget/custom_elevated_button.dart';
import 'package:event_planning_app/ui/home_screen/tabs/widget/custom_text_field.dart';
import 'package:event_planning_app/utils/app_colors.dart';
import 'package:event_planning_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class AddEvent extends StatefulWidget {
  static const String routeName = 'add_event';

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  int selectedIndex = 0;
  final formKey = GlobalKey<FormState>();
  var titleController = TextEditingController(); //title
  var descriptionController = TextEditingController(); //description
  DateTime? selectedDate;
  String formattedDate = ''; //date
  TimeOfDay? selectedTime;
  String formattedTime = ''; //time
  String selectedImage = '';
  String selectedEvent = '';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    List<String> eventsNameList = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
    selectedEvent = eventsNameList[selectedIndex];
    List<String> imageSelectedNameList = [
      "assets/Images/sport.png",
      "assets/Images/birthday.png",
      "assets/Images/meeting.png",
      "assets/Images/gaming.png",
      "assets/Images/workshop.png",
      "assets/Images/book_club.png",
      "assets/Images/Exhibition.png",
      "assets/Images/holiday.png",
      "assets/Images/eating.png",
    ];
    selectedImage = imageSelectedNameList[selectedIndex];
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.primaryLight),
        title: Text(AppLocalizations.of(context)!.create_event,
            style: AppStyles.medium16Primary),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: height * 0.01),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(imageSelectedNameList[selectedIndex])),
              // Container(
              //   clipBehavior: Clip.antiAlias,
              //   decoration:
              //       BoxDecoration(borderRadius: BorderRadius.circular(16)),
              //   child: Image.asset(imageSelectedNameList[selectedIndex]),
              // ),
              SizedBox(height: height * 0.02),
              SizedBox(
                height: height * 0.04,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: TabEventWidget(
                            borderColor: AppColors.primaryLight,
                            textSelectedStyle: AppStyles.medium16White,
                            textUnselectedStyle: AppStyles.medium16Primary,
                            eventName: eventsNameList[index],
                            isSelected: selectedIndex == index,
                            backgroundColor: AppColors.primaryLight),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          width: width * 0.02,
                        ),
                    itemCount: eventsNameList.length),
              ),
              SizedBox(height: height * 0.02),
              Text(
                AppLocalizations.of(context)!.title,
                style: AppStyles.medium16Black,
              ),
              SizedBox(height: height * 0.02),
              Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextField(
                        controller: titleController,
                        hintText: AppLocalizations.of(context)!.event_title,
                        prefixIcon: Image.asset("assets/Images/icon_edit.png"),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Please, enter event title!";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        AppLocalizations.of(context)!.description,
                        style: AppStyles.medium16Black,
                      ),
                      SizedBox(height: height * 0.02),
                      CustomTextField(
                        controller: descriptionController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Please, enter event description!";
                          }
                          return null;
                        },
                        maxLines: 5,
                        hintText:
                            AppLocalizations.of(context)!.event_description,
                      ),
                      SizedBox(height: height * 0.02),
                      ChooseDateOrTime(
                        iconName: "assets/Images/Calendar.png",
                        eventName: AppLocalizations.of(context)!.event_date,
                        onChooseDateOrTime: chooseDate,
                        chooseDateOrTime: selectedDate == null
                            ? AppLocalizations.of(context)!.choose_date
                            : DateFormat("dd/MM/yyyy").format(selectedDate!),
                        //formattedDate
                      ),
                      SizedBox(height: height * 0.02),
                      ChooseDateOrTime(
                          chooseDateOrTime: selectedTime == null
                              ? AppLocalizations.of(context)!.choose_time
                              : formattedTime,
                          iconName: "assets/Images/Clock.png",
                          eventName: AppLocalizations.of(context)!.event_time,
                          onChooseDateOrTime: chooseTime),
                      SizedBox(height: height * 0.02),
                      Text(
                        AppLocalizations.of(context)!.location,
                        style: AppStyles.medium16Black,
                      ),
                      SizedBox(height: height * 0.02),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.02, vertical: height * 0.005),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                width: 2, color: AppColors.primaryLight)),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.02,
                                  vertical: height * 0.01),
                              decoration: BoxDecoration(
                                  color: AppColors.primaryLight,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: AppColors.primaryLight)),
                              child:
                                  Image.asset("assets/Images/iconLocation.png"),
                            ),
                            SizedBox(width: width * 0.02),
                            Text(
                                AppLocalizations.of(context)!
                                    .choose_event_location,
                                style: AppStyles.medium16Primary),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: AppColors.primaryLight,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      CustomElevatedButton(
                          text: AppLocalizations.of(context)!.add_event,
                          onButtonClick: addEvent)
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void addEvent() {
    if (formKey.currentState?.validate() == true) {
      Event event = Event(
          title: titleController.text,
          description: descriptionController.text,
          eventName: selectedEvent,
          dateTime: selectedDate!,
          image: selectedImage,
          time: formattedTime
      );
      FirebaseUtils.addEventToFireStore(event).timeout(Duration(milliseconds: 500),onTimeout: () {
        Fluttertoast.showToast(
            msg: "event added successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.lightGreen,
            textColor: Colors.white,
            fontSize: 12.0
        ); // store in firebase and in 0.5 a second tell me if it's successful by doing the print
      },); // timeout is for when in offline mode and then is for online mode
    }
  }

  void chooseDate() async {
    var chooseDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    selectedDate = chooseDate;
    // formattedDate = DateFormat("dd/MM/yyyy").format(selectedDate!);
    // now the above line is dispensable since I directly used the right hand side in line 156
    setState(() {});
  }

  void chooseTime() async {
    var chooseTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    selectedTime = chooseTime;
    formattedTime = selectedTime!.format(context);
    setState(() {});
  }
}
