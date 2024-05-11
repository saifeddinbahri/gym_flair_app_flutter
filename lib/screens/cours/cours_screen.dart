import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_flair/screens/cours/widgets/cours_screen_appbar.dart';
import 'package:gym_flair/screens/cours/widgets/event_item.dart';
import 'package:gym_flair/screens/cours/widgets/item.dart';
import 'package:gym_flair/services/courses_service.dart';
import 'package:gym_flair/services/events_service.dart';
import 'package:gym_flair/shared/widgets/screen_title.dart';

import '../../shared/sizes.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController ;
  bool loadingCourses = true;
  bool loadingEvents = true;
  late List<dynamic> courseData;
  late List<dynamic> eventData;
  final service = CoursesService();
  final eventService = EventsService();
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCourses();
    getEvents();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CoursesScreenAppbar(
            title: 'Classes & Events',
            controller: _tabController),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.005,
            ),
            child: TabBarView(
              controller: _tabController,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.778,
                      child: loadingCourses ?
                            const Center(child: CircularProgressIndicator(),)
                           : ListView.builder(
                        padding: EdgeInsets.only(
                          top: screenHeight * 0.01,
                          bottom: screenHeight * 0.01,
                          left: screenWidth * ConstantSizes.horizontalPadding,
                          right: screenWidth * ConstantSizes.horizontalPadding,
                        ),
                        itemCount: courseData.length,
                        itemBuilder: (context, index) {
                          return  Padding(
                            padding:  EdgeInsets.only(
                                bottom: screenHeight * 0.01
                            ),
                            child: SizedBox(
                              height: screenHeight * 0.12,
                              child: Item(
                                  callback: getCourses,
                                  id: courseData[index]['_id'],
                                  title: courseData[index]['nom'],
                                  count: addZero(courseData[index]['count']),
                                  date: courseData[index]['date'].substring(0, 10),
                                  trainer: courseData[index]['coach'],
                                  capacity: courseData[index]['capacite'].toString(),
                                  hour: formatHour(courseData[index]['start']),
                                  end: formatHour(courseData[index]['end']),
                                  valid: courseData[index]['booked']
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                /// below is events section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                   SizedBox(
                     height: screenHeight * 0.778,
                     child: loadingEvents ?
                            const Center(child: CircularProgressIndicator())
                          : ListView.builder(
                       padding: EdgeInsets.only(
                         top: screenHeight * 0.01,
                         bottom: screenHeight * 0.01,
                         left: screenWidth * ConstantSizes.horizontalPadding,
                         right: screenWidth * ConstantSizes.horizontalPadding,
                       ),
                       itemCount: eventData.length,
                       itemBuilder: (context, index) {
                         return  Padding(
                           padding:  EdgeInsets.only(
                               bottom: screenHeight * 0.015
                           ),
                           child: SizedBox(
                             height: screenHeight * 0.5,
                             child: EventItem(
                                 callback: getEvents,
                                 title: eventData[index]['nom'],
                                 id: eventData[index]['_id'],
                                 date: eventData[index]['date'],
                                 description: eventData[index]['desc'],
                                 participantCount: addZero(eventData[index]['count']),
                                 hour: formatHour(eventData[index]['start']),
                                 participated: eventData[index]['booked'],
                                 image: eventData[index]['photo'],
                             ),
                           ),
                         );
                       },
                     ),
                   ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void getCourses() async{
    if (loadingCourses == false) {
      setState(() {
        loadingCourses = true;
      });
    }
    courseData = await service.getCourses();
    loadingCourses = false;
    setState(() {
    });
  }

  void getEvents() async{
    if (loadingEvents == false) {
      setState(() {
        loadingEvents = true;
      });
    }
    eventData = await eventService.getEvents();
    loadingEvents = false;
    setState(() {
    });
  }

  String formatHour(int value) {
    String time = addZero(value);
    if (value > 12) time = '$time PM';
    return '$time AM';
  }
  String addZero(int value) {
    if (value < 10) return '0$value';
    return value.toString();
  }
}
