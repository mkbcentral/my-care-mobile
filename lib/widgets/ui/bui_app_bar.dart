import 'package:flutter/material.dart';
import 'package:my_care_mobile/themes/app_theme.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isCenter;
  final List<Widget>? actions;
  const BuildAppBar(
      {super.key, required this.title, required this.isCenter, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: AppTheme.colors.bgPrimaryGreen,
      foregroundColor: AppTheme.colors.white,
      centerTitle: isCenter,
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
