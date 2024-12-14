import 'package:ecommerce_app/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'otp_verification_screen.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  static const String name = '/complete-profile';

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
                width: 60,
              ),
              const AppLogoWidget(
                width: 90,
                height: 90,
              ),
              const SizedBox(
                height: 16,
              ),
              Text('Complete Profile',
                  style: Theme.of(context).textTheme.titleLarge),
              //const SizedBox(height: 5),
              Text(
                'Get started with us with your details',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey,
                    ),
              ),
              const SizedBox(height: 24),
              buildForm(),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  //if (_formKey.currentState!.validate()) {}
                  //Navigator.pushNamed(context, OtpVerificationScreen.name);
                },
                child: const Text('Complete'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your First name';
              }
              return null;
            },
            controller: _firstNameTEController,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          const SizedBox(height: 12),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your last name here';
              }
              return null;
            },
            controller: _lastNameTEController,
            decoration: const InputDecoration(hintText: 'Last Name'),
          ),
          const SizedBox(height: 12),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your phone number';
              }
              if (RegExp(r'^(?:\+88|88)?01[3-9]\d{8}$').hasMatch(value!) == false) {
                return '*Enter a valid mobile no.';
              };
              return null;
            },
            controller: _mobileTEController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(hintText: 'Mobile'),
          ),
          const SizedBox(height: 12),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return '*This is a required field';
              }
              return null;
            },
            controller: _cityTEController,
            decoration: const InputDecoration(hintText: 'City'),
          ),
          const SizedBox(height: 12),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return '*This is a required field';
              }
              return null;
            },
            maxLines: 3,
            controller: _shippingAddressTEController,
            decoration: const InputDecoration(
              hintText: 'Shipping Address',

            ),
          ),
        ],
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _shippingAddressTEController.dispose();
  }
}
