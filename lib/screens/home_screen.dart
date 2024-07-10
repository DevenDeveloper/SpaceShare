import 'package:flutter/material.dart';

import 'customWidgets/BottomMenu.dart';
import 'pages/HomePage.dart';
import 'pages/SearchPalace.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {


  int selectedIconIndex = 2;

  void selectIcon(int index) {
    setState(() {
      selectedIconIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    // final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        alignment: Alignment.center,
        children: [
          selectedIconIndex == 0
              ? const SearchPalace()
              : const HomePage(),
          BottomMenu(
              selectedIconIndex: selectedIconIndex, selectIcon: selectIcon)
        ],
      ),
    );
  }
}
