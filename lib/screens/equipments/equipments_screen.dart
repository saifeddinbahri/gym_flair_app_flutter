
import 'package:flutter/material.dart';
import 'package:gym_flair/screens/equipments/widgets/equipment_item.dart';
import 'package:gym_flair/services/equipments_service.dart';
import '../../shared/sizes.dart';
import '../../shared/widgets/screen_title.dart';

class EquipmentScreen extends StatefulWidget {
  const EquipmentScreen({super.key});

  @override
  State<EquipmentScreen> createState() => _EquipmentScreenState();
}

class _EquipmentScreenState extends State<EquipmentScreen> {

  late List<dynamic> equipments;
  bool loading = false;

  final List<dynamic> data = [
    {'label': 'Treadmill', 'price': '8DT', 'description': 'best treadmill ever', 'image': 'https://fitfix.ca/wp-content/uploads/2023/08/IMG_1049-scaled.jpg' },
    {'label': 'Treadmill', 'price': '5DT', 'description': 'best treadmill ever', 'image': 'https://fitfix.ca/wp-content/uploads/2023/08/IMG_1049-scaled.jpg' },
    {'label': 'Treadmill', 'price': '10DT', 'description': 'best treadmill ever', 'image': 'https://fitfix.ca/wp-content/uploads/2023/08/IMG_1049-scaled.jpg' },
    {'label': 'Treadmill', 'price': '10DT', 'description': 'best treadmill ever', 'image': 'https://fitfix.ca/wp-content/uploads/2023/08/IMG_1049-scaled.jpg' },
    {'label': 'Treadmill', 'price': '10DT', 'description': 'best treadmill ever', 'image': 'https://fitfix.ca/wp-content/uploads/2023/08/IMG_1049-scaled.jpg' },
    {'label': 'Treadmill', 'price': '10DT', 'description': 'best treadmill ever', 'image': 'https://fitfix.ca/wp-content/uploads/2023/08/IMG_1049-scaled.jpg' },
    {'label': 'Treadmill', 'price': '10DT', 'description': 'best treadmill ever', 'image': 'https://fitfix.ca/wp-content/uploads/2023/08/IMG_1049-scaled.jpg' },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEquipments();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const ScreenTitle(title: 'Equipments'),
        Padding(
          padding: EdgeInsets.only(
            top: screenHeight * 0.005,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: screenHeight * 0.82,
                child: loading ?
                  const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.01,
                      bottom: screenHeight * 0.01,
                      left: screenWidth * ConstantSizes.horizontalPadding,
                      right: screenWidth * ConstantSizes.horizontalPadding,
                    ),
                  itemCount: equipments.length,
                  itemBuilder: (context, index) {
                    return  Padding(
                      padding:  EdgeInsets.only(
                          bottom: screenHeight * 0.01
                      ),
                      child: SizedBox(
                        height: screenHeight * 0.2,
                        child: EquipmentItem(
                             callback: getEquipments,
                             id: equipments[index]['_id'],
                             label: equipments[index]['nom'],
                             price: equipments[index]['prix'],
                             image: equipments[index]['image'],
                             description: equipments[index]['description'],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void getEquipments() async {
    if(loading == false) {
      setState(() {
        loading = true;
      });
    }
    var service = EquipmentsService();
    equipments = await service.getEquipments();
    loading = false;
    setState(() {
    });
  }
}
