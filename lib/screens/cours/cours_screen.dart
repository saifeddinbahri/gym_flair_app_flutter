import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_flair/screens/cours/widgets/cours_screen_appbar.dart';
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
    { 'title': 'item1', 'capacity': '15', 'date': 'janvier 5 2022', 'hour': '09 AM', 'valid': true },
    { 'title': 'item2', 'capacity': '20', 'date': 'janvier 6 2022', 'hour': '10 AM', 'valid': true },
    { 'title': 'item3', 'capacity': '18', 'date': 'janvier 10 2022', 'hour': '03 PM', 'valid': false },
    { 'title': 'item3', 'capacity': '18', 'date': 'janvier 10 2022', 'hour': '03 PM', 'valid': false },
    { 'title': 'item3', 'capacity': '18', 'date': 'janvier 10 2022', 'hour': '03 PM', 'valid': false },
    { 'title': 'item3', 'capacity': '18', 'date': 'janvier 10 2022', 'hour': '03 PM', 'valid': false },
    { 'title': 'item3', 'capacity': '18', 'date': 'janvier 10 2022', 'hour': '03 PM', 'valid': false },
  ] ;

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
            title: 'Courses',
            controller: _tabController),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * ConstantSizes.horizontalPadding,
                right: screenWidth * ConstantSizes.horizontalPadding,
            ),
            child: TabBarView(
              controller: _tabController,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.793,
                      child: ListView.builder(
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
                     height: screenHeight * 0.793,
                     child: ListView.builder(
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
              ],
            )
          ),
        ),
      ],
    );
  }
}
