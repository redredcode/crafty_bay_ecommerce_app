import 'package:ecommerce_app/app/app_theme_data.dart';
import 'package:ecommerce_app/app/controller_binder.dart';
import 'package:ecommerce_app/features/auth/ui/screens/sign_up_screen.dart';
import 'package:ecommerce_app/features/auth/ui/screens/splash_screen.dart';
import 'package:ecommerce_app/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce_app/features/product/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../features/auth/ui/screens/sign_in_screen.dart';
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
      onGenerateRoute: (RouteSettings settings){
        late Widget widget;
        if (settings.name == SplashScreen.name) {
          widget = const SplashScreen();
        } else if (settings.name == SignInScreen.name) {
          widget = const SignInScreen();
        } else if (settings.name == SignUpScreen.name) {
          widget = const SignUpScreen();
        } else if (settings.name == OtpVerificationScreen.name) {
          String email = settings.arguments as String;
          widget = OtpVerificationScreen(email: email);
        } else if (settings.name == MainBottomNavScreen.name) {
          widget = const MainBottomNavScreen();
        } else if (settings.name == CategoryListScreen.name) {
          widget = const CategoryListScreen();
        } else if (settings.name == ProductListScreen.name) {
          Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
          widget = ProductListScreen(categoryName: args['categoryName'], categoryID: args['categoryID']);
        } else if (settings.name == ProductDetailsScreen.name) {
          int productId = settings.arguments as int;
          widget = ProductDetailsScreen(productId: productId);
        }
        return MaterialPageRoute(builder: (ctx){
          return widget;
        });
      },
      // routes: {
      //   '/' : (context) => const SplashScreen(),
      //   HomeScreen.name : (context) => const HomeScreen(),
      //   ProductListScreen.name : (context) => const ProductListScreen(),
      // },
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
    );
  }
}