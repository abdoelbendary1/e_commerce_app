import 'package:e_commerce_app/presentation/home/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = "home_screen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeScreenBody(),
    );
  }
}
