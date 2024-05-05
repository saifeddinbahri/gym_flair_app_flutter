import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_flair/services/constant.dart';
import 'package:gym_flair/services/user_service.dart';
import 'package:image_picker/image_picker.dart';

class SettingsAvatar extends StatefulWidget {
  const SettingsAvatar({
    required this.photo,
    super.key
  });
 final String photo;
  @override
  State<SettingsAvatar> createState() => _SettingsAvatarState();
}

class _SettingsAvatarState extends State<SettingsAvatar> {
  final ImagePicker _picker = ImagePicker();
  String? photo;


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
        backgroundColor: Colors.brown,
        backgroundImage: NetworkImage(photo == null ?
        '${Constants.imageUrl}${widget.photo}' :
        '${Constants.imageUrl}$photo'
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
    var service = UserService();
    var res = await service.updateImage(image!);
    setState(() {
      photo = res;
    });
  }
}
