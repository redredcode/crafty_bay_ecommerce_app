import 'package:ecommerce_app/app/app_theme_data.dart';
import 'package:ecommerce_app/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:ecommerce_app/features/auth/ui/screens/spalsh_screen.dart';
import 'package:flutter/material.dart';

import '../features/auth/ui/screens/email_verification_screen.dart';
import '../features/auth/ui/screens/otp_verification_screen.dart';

class CraftyBay extends StatelessWidget{
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => const SplashScreen(),
        EmailVerificationScreen.name: (context) => const EmailVerificationScreen(),
        OtpVerificationScreen.name : (context) => const OtpVerificationScreen(),
        CompleteProfileScreen.name : (context) => const CompleteProfileScreen(),

      },
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      themeMode: ThemeMode.light,
    );
  }
}