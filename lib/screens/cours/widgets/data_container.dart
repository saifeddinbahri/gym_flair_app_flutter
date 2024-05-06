
import 'package:flutter/material.dart';

class DataContainer extends StatelessWidget {
  const DataContainer({
    super.key,
    required this.icon,
    required this.content,
  });
  final String content;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Icon(icon, size: width * 0.06),
        SizedBox(width: width * 0.02),
        Text(
          content,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontSize: width * 0.04
          ),
        ),
      ],
    );
  }
}
