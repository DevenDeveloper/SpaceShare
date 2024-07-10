import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../res/theme/theme.dart';
import '../customWidgets/CustomAppBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  late Animation<int> _animationBuy;
  late Animation<int> _animationRent;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    _animationBuy = IntTween(begin: 0, end: 1004).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _animationRent = IntTween(begin: 0, end: 1212).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceInOut,
    ));

    _controller.forward();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _width = _getContentWidth();
        _widthAddress = MediaQuery.of(context).size.width;
      });
    });
  }

  double _width = 0.0;
  double _widthAddress = 54.0;

  double _getContentWidth() {
    const textSpan = TextSpan(
      text: 'Saint Petersburg',
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
      ),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(maxWidth: MediaQuery.of(context).size.width);
    return textPainter.width + 76;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppTheme.primaryGradientColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          width: _width,
          title: 'Saint Petersburg',
          imagePath: 'assets/images/img.png',
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadedScaleAnimation(
                      scaleDuration: 1800.milliseconds,
                      child: const Text(
                        'Hi, Marina',
                        style: TextStyle(
                            fontSize: 20, color: AppTheme.primaryColorDark),
                      ),
                    ),
                    FadedSlideAnimation(
                      slideDuration: 1800.milliseconds,
                      beginOffset: const Offset(0.0, .60),
                      endOffset: const Offset(0, 0),
                      child: const Text(
                        'let\'s select your\nperfect place',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: FadedScaleAnimation(
                      scaleDuration: const Duration(milliseconds: 1800),
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 16, bottom: 32, left: 16, right: 4),
                        height: 170,
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            addSize(height: 16),
                            const Text(
                              'BUY',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            addSize(height: 20),
                            AnimatedBuilder(
                              animation: _animationBuy,
                              builder: (context, child) => Text(
                                '${_animationBuy.value}',
                                style: const TextStyle(
                                    fontSize: 34,
                                    color: Colors.white,
                                    letterSpacing: 3,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            const Text(
                              'offers',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: FadedScaleAnimation(
                      scaleDuration: const Duration(milliseconds: 1800),
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 16, bottom: 32, left: 4, right: 16),
                        height: 170,
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(152),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            addSize(height: 16),
                            const Text(
                              'RENT',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppTheme.primaryColorDark,
                                  fontWeight: FontWeight.w500),
                            ),
                            addSize(height: 20),
                            AnimatedBuilder(
                              animation: _animationRent,
                              builder: (context, child) => Text(
                                '${_animationRent.value}',
                                style: const TextStyle(
                                    fontSize: 34,
                                    color: AppTheme.primaryColorDark,
                                    letterSpacing: 3,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            const Text(
                              'offers',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: AppTheme.primaryColorDark),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: FadedScaleAnimation(
                      scaleDuration: const Duration(milliseconds: 1800),
                      child: Container(
                        margin: const EdgeInsets.only(
                            top: 16, bottom: 32, left: 16, right: 4),
                        height: 170,
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            addSize(height: 16),
                            const Text(
                              'BUY',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            addSize(height: 20),
                            AnimatedBuilder(
                              animation: _animationBuy,
                              builder: (context, child) => Text(
                                '${_animationBuy.value}',
                                style: const TextStyle(
                                    fontSize: 34,
                                    color: Colors.white,
                                    letterSpacing: 3,
                                    fontWeight: FontWeight.w900),
                              ),
                            ),
                            const Text(
                              'offers',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  FadedSlideAnimation(
                    beginOffset: const Offset(0.0, .8),
                    endOffset: const Offset(0.0, 0.0),
                    slideDuration: 1600.milliseconds,
                    slideCurve: Curves.easeInOut,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(22),
                                child: Image.asset(
                                  'assets/images/img_home_interior.png',
                                  height: 210,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 10,
                                right: 10,
                                child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: AnimatedContainer(
                                      padding: EdgeInsets.all(2),
                                        duration:
                                            const Duration(milliseconds: 2400),
                                        curve: Curves.easeInOut,
                                        width: _widthAddress,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.1),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                          color: const Color(0xFFEEDBC2)
                                              .withAlpha(220),
                                          borderRadius:
                                              BorderRadius.circular(34),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                             Flexible(
                                              flex: 1,
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: FadedScaleAnimation(
                                                    scaleCurve: Curves.easeInOut,
                                                    scaleDuration: 2500.milliseconds,
                                                    child: const Text(
                                                      'Gladk St., 25',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black87),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.circle,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withAlpha(111),
                                                      spreadRadius: 2,
                                                      blurRadius: 7,
                                                      offset:
                                                          const Offset(-8, 0),
                                                    ),
                                                  ],
                                                ),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(19.0),
                                                  child: Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: 14,
                                                    color: Colors.black54,
                                                  ),
                                                )),
                                          ],
                                        )
                                    )
                                ),
                              )
                            ],
                          ),
                          addSize(height: 10),
                          StaggeredGrid.count(
                            crossAxisCount: 4,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 8,
                            children: [
                              StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 4,
                                child: item(1),
                              ),
                              StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 2,
                                child: item(2),
                              ),
                              StaggeredGridTile.count(
                                crossAxisCellCount: 2,
                                mainAxisCellCount: 2,
                                child: item(3),
                              ),
                            ],
                          ),
                          addSize(height: 80),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack item(int item) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            item == 1
                ? 'assets/images/product_image2.png'
                : item == 2
                    ? 'assets/images/product_image3.png'
                    : 'assets/images/product_image4.png',
            fit: BoxFit.cover,
            height: 378,
          ),
        ),
        Positioned(
            bottom: 10,
            left: 10,
            right: 10,
            child: Container(
              padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  color: const Color(0xFFEEDBC2).withAlpha(220),
                  borderRadius: BorderRadius.circular(34),
                ),
                child: Row(
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FadedScaleAnimation(
                            scaleCurve: Curves.easeInOut,
                            scaleDuration: 2500.milliseconds,
                            child: const Text(
                              'The St., 25',
                              overflow:
                              TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight:
                                  FontWeight.w500,
                                  color: Colors.black87),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withAlpha(111),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset:
                              const Offset(-8, 0),
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(9.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: Colors.black54,
                          ),
                        )),
                  ],
                )
            )),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget addSize({double width = 0.0, double height = 0.0}) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
