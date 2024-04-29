import 'package:e_commerce_app/presentation/home_screen/widget/custom_bottom_navigation_bar.dart';
import 'package:e_commerce_app/presentation/tabs/favorite_tab/favorite_tab.dart';
import 'package:e_commerce_app/presentation/tabs/home_tab/home_tab.dart';
import 'package:e_commerce_app/presentation/tabs/product_list_tab/product_list_tab.dart';
import 'package:e_commerce_app/presentation/tabs/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';

class HomeScreenView extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    ProductListTab(),
    FavoriteTab(),
    ProfileTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildCustomBottomNavigationBar(
        context: context,
        selectedIndex: selectedIndex,
        onTapFunction: (index) {
          selectedIndex = index;
          setState(() {

          });
        },
      ),
      body: tabs[selectedIndex],
    );
  }
}
