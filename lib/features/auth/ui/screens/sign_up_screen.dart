import 'package:ecommerce_app/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:ecommerce_app/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:ecommerce_app/features/auth/ui/screens/sign_in_screen.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:ecommerce_app/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:ecommerce_app/features/common/ui/widgets/snack_bar_message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/sign_up_params.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() =>
      _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _phoneNoTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignUpController _signUpController =
      Get.find<SignUpController>();

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

                // first name text field
                TextFormField(
                  textInputAction: TextInputAction.next,
                  //keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your First Name';
                    }
                    return null;
                  },
                  controller: _firstNameTEController,
                  decoration: const InputDecoration(hintText: 'First Name'),
                ),
                const SizedBox(height: 10),

                // last name text field
                TextFormField(
                  textInputAction: TextInputAction.next,
                  //keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your Last Name';
                    }
                    return null;
                  },
                  controller: _lastNameTEController,
                  decoration: const InputDecoration(hintText: 'Last Name'),
                ),
                const SizedBox(height: 10),

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

                // phone number text field
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your Valid Phone Number';
                    }
                    if (RegExp(r'^(?:\+88|88)?01[3-9]\d{8}$').hasMatch(value!) == false) {
                      return '*Enter a valid mobile no.';
                    }
                    return null;
                  },
                  controller: _phoneNoTEController,
                  decoration: const InputDecoration(hintText: 'Phone Number'),
                ),
                const SizedBox(height: 10),

                // City text field
                TextFormField(
                  textInputAction: TextInputAction.next,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your City';
                    }
                    return null;
                  },
                  controller: _cityTEController,
                  decoration: const InputDecoration(hintText: 'City'),
                ),
                const SizedBox(height: 10),



                // password text field
                TextFormField(
                  textInputAction: TextInputAction.go,
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value) {
                    if ((value?.isEmpty ?? true) || value!.length < 6) {
                      return 'Password should be at-least 6 characters long';
                    }
                    return null;
                  },
                  controller: _passwordTEController,
                  decoration: const InputDecoration(hintText: 'Password'),
                ),

                const SizedBox(height: 16),

                GetBuilder<SignUpController>(builder: (controller) {
                  if (controller.inProgress) {
                    return const CenteredCircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _onTapSignUp();
                      }
                    },
                    child: const Text('Sign Up'),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapSignUp() async {
    if (_formKey.currentState!.validate()) {
      bool isSuccess = await _signUpController.signUp(
        SignUpParams(
          firstName: _firstNameTEController.text.trim(),
          lastName: _lastNameTEController.text.trim(),
          email: _emailTEController.text.trim(),
          password: _passwordTEController.text,
          phoneNumber: _phoneNoTEController.text.trim(),
          city: _cityTEController.text.trim(),
        ),
      );

      print('API call success: $isSuccess');
      print('Widget mounted: $mounted');
      //isSuccess = true;

      if (isSuccess) {
        if (mounted) {
          Navigator.pushNamed(
            context,
            OtpVerificationScreen.name,
            arguments: _emailTEController.text.trim(),
          );
        }
      } else {
        if (mounted) {
          showSnackBarMessage(
            context,
            _signUpController.errorMessage!,
          );
        }
      }
    }
  }
}
