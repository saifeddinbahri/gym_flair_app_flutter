
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gym_flair/screens/home/widgets/scan_qr_code_button.dart';
import 'package:gym_flair/screens/home/widgets/section_container.dart';
import 'package:gym_flair/services/constant.dart';
import '../../shared/sizes.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../shared/widgets/screen_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late IO.Socket socket;
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    socket = IO.io('http://${Constants.url}', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    socket.on('count', (data) => {
      if (mounted) {
        setState(() {count = data;})
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    socket.disconnect();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ScreenTitle(title: 'Home'),
          Padding(
            padding: EdgeInsets.only(
                left: screenWidth * ConstantSizes.horizontalPadding,
                right: screenWidth * ConstantSizes.horizontalPadding,
                top: screenHeight * 0.02
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: screenHeight * 0.03),
                 SectionContainer(
                  title: 'QR Scan',
                  child: ScanQrCodeButton(
                    socket: socket,
                  )
                ),
                SizedBox(height: screenHeight * 0.03),
                 SectionContainer(
                    title: 'Gym count',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.person),
                        SizedBox(width: screenWidth * 0.01,),
                        Text(
                          addZero(count),
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  String addZero(int value) {
    if (value < 10) return '0$value';
    return value.toString();
  }
}
