import 'package:ecommerce_app/features/auth/ui/controllers/sign_in_controller.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:ecommerce_app/features/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce_app/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce_app/features/common/ui/widgets/snack_bar_message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() =>
      _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignInController _signInController =
      Get.find<SignInController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 80),
                const AppLogoWidget(width: 90),
                const SizedBox(height: 16),
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                //const SizedBox(height: 5),
                Text(
                  'Please enter your email',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your Email address';
                    }
                    if (EmailValidator.validate(value!) == false) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                  controller: _emailTEController,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),

                const SizedBox(height: 10),

                // password text field
                TextFormField(
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your password';
                    }
                    return null;
                  },
                  controller: _passwordTEController,
                  decoration: const InputDecoration(hintText: 'Password'),
                ),

                const SizedBox(height: 16),

                GetBuilder<SignInController>(builder: (controller) {
                  if (controller.inProgress) {
                    return const CenteredCircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: _onTapNextButton,
                    child: const Text('Next'),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapNextButton() async {
    if (_formKey.currentState!.validate()) {
      bool isSuccess = await _signInController.signIn(
        _emailTEController.text.trim(),
        _passwordTEController.text,
      );

      print('API call success: $isSuccess');
      print('Widget mounted: $mounted');

      if (isSuccess) {
        if (mounted) {
          Navigator.pushNamed(
            context,
            MainBottomNavScreen.name,
            arguments: _emailTEController.text.trim(),
          );
        }
      } else {
        if (mounted) {
          showSnackBarMessage(
            context,
            _signInController.errorMessage!,
          );
        }
      }
    }
  }
}
