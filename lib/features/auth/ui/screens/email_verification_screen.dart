import 'package:ecommerce_app/app/app_theme_data.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatelessWidget{
  const EmailVerificationScreen({super.key});

  static const String name = '/email-verification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 80,),
            const AppLogoWidget(),
            const SizedBox(height: 24,),
            Text('Welcome Back',
                style: Theme.of(context).textTheme.titleLarge
            ),
            const SizedBox(height: 8,),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your email here'
              ),
            ),
          ],
        ),
      ),
    );
  }
}