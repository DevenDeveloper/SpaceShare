import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class BottomMenu extends StatelessWidget {
  final int selectedIconIndex;
  final Function(int) selectIcon;

  BottomMenu({
    super.key,
    required this.selectedIconIndex,
    required this.selectIcon,
    // required this.menuIcons,
  });

  List<String> menuIcons = [
    "assets/icons/search_icon.svg",
    "assets/icons/message.svg",
    "assets/icons/home_circle_icon.svg",
    "assets/icons/favorite.svg",
    "assets/icons/profile.svg"
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: FadedSlideAnimation(
        beginOffset: const Offset(0.0, 8.0),
        endOffset: const Offset(0.0, 0.0),
        slideDuration: const Duration(milliseconds: 2200),
        child: Container(
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: const Color(0XFF323232),
            borderRadius: BorderRadius.circular(112),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(menuIcons.length,
              (index) => FadedScaleAnimation(
                scaleCurve: Curves.bounceInOut,
                scaleDuration: 1200.milliseconds,
                child: InkWell(
                  onTap: () => selectIcon(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    width: selectedIconIndex == index ? 46 : 36,
                    height: selectedIconIndex == index ? 46 : 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selectedIconIndex == index
                          ? Colors.orange
                          : const Color(0XFF222222),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        menuIcons[index],
                        width: 18,
                        height: 18,
                        fit: BoxFit.scaleDown,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
