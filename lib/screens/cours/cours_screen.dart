import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_flair/screens/cours/widgets/cours_screen_appbar.dart';
import 'package:gym_flair/screens/cours/widgets/event_item.dart';
import 'package:gym_flair/screens/cours/widgets/item.dart';
import 'package:gym_flair/shared/widgets/screen_title.dart';

import '../../shared/sizes.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController ;
  List<dynamic> items = [
    { 'title': 'Upper workout', 'capacity': '15', 'date': 'janvier 5 2022', 'hour': '09 AM', 'valid': true, 'trainer': 'Ahmed ben ali' },
    { 'title': 'Legs workout', 'capacity': '20', 'date': 'janvier 6 2022', 'hour': '10 AM', 'valid': true, 'trainer': 'Amine salah' },
    { 'title': 'Cardio', 'capacity': '18', 'date': 'janvier 10 2022', 'hour': '03 PM', 'valid': false, 'trainer': 'Farah ayari' },
    { 'title': 'Boxing', 'capacity': '18', 'date': 'janvier 10 2022', 'hour': '03 PM', 'valid': false, 'trainer': 'omar msekni' },
    { 'title': 'Karate', 'capacity': '18', 'date': 'janvier 10 2022', 'hour': '03 PM', 'valid': false, 'trainer': 'fatma ayed' },
    { 'title': 'Back workout', 'capacity': '18', 'date': 'janvier 10 2022', 'hour': '03 PM', 'valid': false, 'trainer': 'aymen hlel' },
    { 'title': 'Yoga', 'capacity': '18', 'date': 'janvier 10 2022', 'hour': '03 PM', 'valid': false, 'trainer': 'Ali wled ahmed sssssssss' },
  ] ;

  List<dynamic> eventItems = [
    {'title': 'Marathon ', 'content': "Join The Coastal Challenge Marathon on June 15, 2024, at Rivertown Beach. Lace up your running shoes for an exhilarating journey along the scenic coastline, where rolling hills meet breathtaking ocean views. With strategically placed aid stations to fuel your progress, you'll conquer every mile with determination. Finisher medals will be awarded as a testament to your achievement, followed by a vibrant post-race celebration filled with music, food, and camaraderie. Don't miss out on this opportunity to push your limits and create lasting memories. Register now and prepare for an unforgettable experience at The Coastal Challenge Marathon!", 'date': 'January 10 2022', 'hour': '10 AM', 'isChecked': true, 'count': '42', 'image': 'https://t3.ftcdn.net/jpg/06/32/28/56/360_F_632285607_jaSoMbZupPXWfOS3SNQk8lcdZIloqH3b.jpg'},
    {'title': 'Even 1', 'content': 'Event made by tek-up', 'date': 'Mars 03 2022', 'hour': '10 AM', 'isChecked': true, 'count': '42', 'image': 'https://t3.ftcdn.net/jpg/06/32/28/56/360_F_632285607_jaSoMbZupPXWfOS3SNQk8lcdZIloqH3b.jpg'},
    {'title': 'Even 1', 'content': 'Event made by tek-up', 'date': 'August 13 2022', 'hour': '10 AM', 'isChecked': false, 'count': '42', 'image': 'https://t3.ftcdn.net/jpg/06/32/28/56/360_F_632285607_jaSoMbZupPXWfOS3SNQk8lcdZIloqH3b.jpg'},
    {'title': 'Even 1', 'content': 'Event made by tek-up', 'date': 'January 20 2022', 'hour': '10 AM', 'isChecked': true, 'count': '42', 'image': 'https://t3.ftcdn.net/jpg/06/32/28/56/360_F_632285607_jaSoMbZupPXWfOS3SNQk8lcdZIloqH3b.jpg'},
    {'title': 'Even 1', 'content': 'Event made by tek-up', 'date': 'July 15 2022', 'hour': '10 AM', 'isChecked': true, 'count': '42', 'image': 'https://t3.ftcdn.net/jpg/06/32/28/56/360_F_632285607_jaSoMbZupPXWfOS3SNQk8lcdZIloqH3b.jpg'},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                      child: ListView.builder(
                        padding: EdgeInsets.only(
                          top: screenHeight * 0.01,
                          bottom: screenHeight * 0.01,
                          left: screenWidth * ConstantSizes.horizontalPadding,
                          right: screenWidth * ConstantSizes.horizontalPadding,
                        ),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return  Padding(
                            padding:  EdgeInsets.only(
                                bottom: screenHeight * 0.01
                            ),
                            child: SizedBox(
                              height: screenHeight * 0.12,
                              child: Item(
                                  title: items[index]['title'],
                                  date: items[index]['date'],
                                  trainer: items[index]['trainer'],
                                  capacity: items[index]['capacity'],
                                  hour: items[index]['hour'],
                                  valid: items[index]['valid']
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
                     child: ListView.builder(
                       padding: EdgeInsets.only(
                         top: screenHeight * 0.01,
                         bottom: screenHeight * 0.01,
                         left: screenWidth * ConstantSizes.horizontalPadding,
                         right: screenWidth * ConstantSizes.horizontalPadding,
                       ),
                       itemCount: eventItems.length,
                       itemBuilder: (context, index) {
                         return  Padding(
                           padding:  EdgeInsets.only(
                               bottom: screenHeight * 0.015
                           ),
                           child: SizedBox(
                             height: screenHeight * 0.5,
                             child: EventItem(
                                 title: eventItems[index]['title'],
                                 date: eventItems[index]['date'],
                                 description: eventItems[index]['content'],
                                 participantCount: eventItems[index]['count'],
                                 hour: eventItems[index]['hour'],
                                 participated: eventItems[index]['isChecked'],
                                 image: eventItems[index]['image'],
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
}
