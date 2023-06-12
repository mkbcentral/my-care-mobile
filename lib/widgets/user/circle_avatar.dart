import 'package:flutter/material.dart';
import 'package:my_care_mobile/themes/app_theme.dart';

class CircleAvatarWidget extends StatelessWidget {
  final double width;
  final double heigth;
  final String imageUrl;
  const CircleAvatarWidget(
      {super.key,
      required this.width,
      required this.heigth,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppTheme.colors.white,
          borderRadius: BorderRadius.circular(50)),
      width: width,
      height: heigth,
      child: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
    );
  }
}
