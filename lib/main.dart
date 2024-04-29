import 'package:device_preview/device_preview.dart';
import 'package:e_commerce_app/presentation/auth/login/login_screen.dart';
import 'package:e_commerce_app/presentation/auth/signUp/sign_up._screen.dart';
import 'package:e_commerce_app/presentation/cart/cart_screen.dart';
import 'package:e_commerce_app/presentation/home/home_screen.dart';
import 'package:e_commerce_app/presentation/home_screen/home_screen_view.dart';
import 'package:e_commerce_app/presentation/product_details/product_details_view.dart';
import 'package:e_commerce_app/presentation/splash/splash_screen.dart';
import 'package:e_commerce_app/presentation/utils/theme/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'domain/my_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          SignUpScreen.routeName: (context) => SignUpScreen(),
          HomeScreenView.routeName: (context) => HomeScreenView(),
          ProductDetailsView.routeName: (context) => ProductDetailsView(),
          CartScreen.routeName: (context) => CartScreen(),
        },
        theme: AppTheme.mainTheme,
      ),
    );
  }
}
