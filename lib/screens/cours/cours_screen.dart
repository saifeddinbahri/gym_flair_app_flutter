import 'package:flutter/material.dart';
import 'package:gym_flair/screens/cours/widgets/item.dart';

import '../../shared/sizes.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {

  List<dynamic> items = [
    { 'title': 'item1', 'capacity': '15', 'date': 'janvier 5 2022', 'hour': '09 AM', 'valid': true },
    { 'title': 'item2', 'capacity': '20', 'date': 'janvier 6 2022', 'hour': '10 AM', 'valid': true },
    { 'title': 'item3', 'capacity': '18', 'date': 'janvier 10 2022', 'hour': '03 PM', 'valid': false },
  ] ;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * ConstantSizes.horizontalPadding,
            right: screenWidth * ConstantSizes.horizontalPadding,
            top: screenHeight * 0.05
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: screenHeight * 0.03),
            Text(
              'Courses',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: screenHeight * 0.03),
            SizedBox(
              height: screenHeight * 0.9,
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
            )
          ],
        ),
      ),
    );
  }
}
