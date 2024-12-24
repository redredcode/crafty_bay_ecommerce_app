import 'package:ecommerce_app/app/app_theme_data.dart';
import 'package:ecommerce_app/app/controller_binder.dart';
import 'package:ecommerce_app/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:ecommerce_app/features/auth/ui/screens/spalsh_screen.dart';
import 'package:ecommerce_app/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce_app/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../features/auth/ui/screens/email_verification_screen.dart';
import '../features/auth/ui/screens/otp_verification_screen.dart';
import '../features/category/ui/screens/category_list_screen.dart';
import '../features/product/ui/screens/product_list_screen.dart';

class CraftyBay extends StatelessWidget{
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBinder(),
      initialRoute: '/',
      routes: {
        '/' : (context) => const SplashScreen(),
        EmailVerificationScreen.name: (context) => const EmailVerificationScreen(),
        OtpVerificationScreen.name : (context) => const OtpVerificationScreen(),
        CompleteProfileScreen.name : (context) => const CompleteProfileScreen(),
        HomeScreen.name : (context) => const HomeScreen(),
        MainBottomNavScreen.name : (context) => const MainBottomNavScreen(),
        CategoryListScreen.name : (context) => const CategoryListScreen(),
        ProductListScreen.name : (context) => const ProductListScreen(),
      },
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
    );
  }
}