import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SettingsAvatar extends StatefulWidget {
  const SettingsAvatar({super.key});

  @override
  State<SettingsAvatar> createState() => _SettingsAvatarState();
}

class _SettingsAvatarState extends State<SettingsAvatar> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
        backgroundColor: Colors.brown,
        backgroundImage: const NetworkImage(
          'https://res.cloudinary.com/demo/image/fetch/https://upload.wikimedia.org/wikipedia/commons/1/13/Benedict_Cumberbatch_2011.png'
        ),
          radius: screenWidth*0.3 ,
      ),
        Positioned(
          bottom: 10,
          right: 20,
          child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              padding: const EdgeInsets.all(10),
              shape: const CircleBorder()
            ),
            onPressed: (){
              getImage();
            },
            icon: const Icon(
                Icons.edit,
                color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Future getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }
}
