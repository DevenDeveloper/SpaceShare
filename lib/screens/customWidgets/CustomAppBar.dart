import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../res/theme/theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double width;
  final String title;
  final String imagePath;

  const CustomAppBar({
    super.key,
    required this.width,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      title: AnimatedContainer(
        duration: const Duration(milliseconds: 1200),
        curve: Curves.easeOut,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Flexible(
              child: Icon(
                Icons.location_on_rounded,
                color: AppTheme.primaryColorDark,
                size: 18,
              ),
            ),
            const Flexible(child: SizedBox(width: 8.0)),
            Flexible(
              flex: 9,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppTheme.primaryColorDark,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      actions: [
        FadedScaleAnimation(
          scaleDuration: 1200.milliseconds,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(imagePath),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}